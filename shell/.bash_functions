bl-pct() { brightnessctl -d amdgpu_bl0 s $1% ; }
bl-value() { brightnessctl -d amdgpu_bl0 s $1 ; }
bl-day() { brightnessctl -d amdgpu_bl0 s 80% ; }
bl-natt() { brightnessctl -d amdgpu_bl0 s 20% ; }
