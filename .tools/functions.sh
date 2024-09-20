_print_dots () {
  printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
}
