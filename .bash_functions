_brctl() {
	brightnessctl -d amdgpu_bl0 s $1
}

_pbrctl() {
	brightnessctl -d amdgpu_bl0 s $1%
}
