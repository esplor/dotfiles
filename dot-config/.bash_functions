_brctl() {
	brightnessctl -d amdgpu_bl0 s $1
}

_pbrctl() {
	brightnessctl -d amdgpu_bl0 s $1%
}

bl-dag() {
	brightnessctl -d amdgpu_bl0 s 80%
}


bl-natt() {
	brightnessctl -d amdgpu_bl0 s 20%
}
