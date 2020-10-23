clear
cd ~
echo "eDEX-UI script started!"
sleep 1
echo "Removing previous installation files..."
sudo rm -rf edex-ui/
cd /usr/share/applications
sudo rm "eDEX-UI.desktop"
cd ~
echo "Installing dependencies..."
##if grep -q bionic /etc/os-release; then
##  echo "Ubuntu 18.04 detected, using NodeSource to install Node.js..."
##  echo "(The version that ships with Ubuntu Bionic isn't new enough)"
##  curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
##fi
#the next line fixes a dependency issue that may occur depending on what you have installed
sudo apt-get install libssl1.0-dev -y
sudo apt-get install npm* nodejs* -y

echo "Downloading the source..."
git clone https://github.com/GitSquared/edex-ui
cd edex-ui

npm install
##this next step gives me errors, but it works anyway...
npm run build-linux

npm run install-linux

cd /home/$USER/edex-ui/media/
sudo mkdir /usr/share/edex-ui
sudo cp logo.svg /usr/share/edex-ui
cd /usr/share/applications
sudo wget https://raw.githubusercontent.com/cobalt2727/L4T-Megascript/master/assets/eDEX-UI/eDEX-UI.desktop

echo ""
echo ""
#echo "We'll make a desktop file later, but to launch the program, navigate to /home/$USER/edex-ui/ and type 'npm start'"
echo "Done!"
echo "Settings can be modified by changing /home/$USER/.config/eDEX-UI/settings.json"
echo "Available themes to apply in the settings text file can be listed by typing 'ls /home/$USER/.config/eDEX-UI/themes'"
echo "We'll eventually maybe do this by default, but you can turn off the mouse pointer by setting the 'nocursor' variable to true inside the settings.json file"

