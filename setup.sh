echo "Enabling bluetooth daemon and setting it to auto-start"

sudo sed -i 's|#AutoEnable=false|AutoEnable=true|g' /etc/bluetooth/main.conf
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

# ------------------------------------------------------------------------

echo
echo "Enabling the cups service daemon so we can print"

systemctl enable org.cups.cupsd.service
systemctl start org.cups.cupsd.service

# ------------------------------------------------------------------------

echo
echo "Enabling Network Time Protocol so clock will be set via the network"

sudo ntpd -qg
sudo systemctl enable ntpd.service
sudo systemctl start ntpd.service

# ------------------------------------------------------------------------

echo
echo "NETWORK SETUP"
echo
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service
