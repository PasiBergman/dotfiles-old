# Raspberry Pi specific aliases
#
# Enable Wi-Fi
# ------------
# sudo nvim /etc/netctl/wireless-wpa
#
# Start/Stop Wi-Fi now

if [[ "$(uname -a)" == *"raspi"* ]]; then
    alias wifi-start="sudo netctl start wireless-wpa"
    alias wifi-stop="sudo netctl stop wireless-wpa"
    # Start/Stop network after boot
    alias wifi-enable="sudo netctl enable wireless-wpa"
    alias wifi-disable="sudo netctl disable wireless-wpa"

    alias ytop=bpytop
    alias top=bpytop
fi

