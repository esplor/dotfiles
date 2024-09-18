## FROM reddit
https://www.reddit.com/r/swaywm/comments/uf5fv8/gtk_themes_not_working_debian_bullseye/

EDIT: I FOUND A SOLUTION, FINALLY!

Okay, so this problem was fucking killing me all day, seriously. I went back to i3/X11 for a while, noticed my themes weren't working in X11 land, too. After much struggling, it turns out that BOTH the ~/.config/gtk-3.0/settings.ini AND gsettings requires the parameters to NOT be in double quotes! When they imply to use single quotes, or no quotes, they mean it.

Here's solutions that are both working for i3 and sway:

### For the file ~/.config/gtk-3.0/settings.ini
```
[Settings]
gtk-theme-name = Adwaita
gtk-application-prefer-dark-theme = true
gtk-icon-theme-name = Adwaita
gtk-recent-files-max-age = 0
gtk-recent-files-limit = 0
```
And for your auto-execute line in ~/.config/sway/config

### Sway autoexec
```
set $schema "org.gnome.desktop.interface"

exec_always {
    gsettings set $schema gtk-theme Adwaita
    gsettings set $schema icon-theme Adwaita
    gsettings set $schema cursor-theme Yaru
    gsettings set $schema gtk-application-prefer-dark-theme true
}
```
This even works when using sudo -E gparted

Can someone please tell the fucking GTK/Gnome developers to fix their fucking shit code and allow double quotes to be used? For the love of fucking God... Ugh...

```
mkdir -p ~/.config/gtk-3.0/              
cat <<EOF> ~/.config/gtk-3.0/settings.ini
[Settings]
gtk-theme-name = Adwaita
gtk-application-prefer-dark-theme = true
gtk-icon-theme-name = Adwaita
gtk-recent-files-max-age = 0
gtk-recent-files-limit = 0
EOF
```
