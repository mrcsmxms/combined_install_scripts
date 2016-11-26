echo "
  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
    ░░░░▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒░░▒▒▒▒▒▒░░▒▒▒▒▒▒░░░░░░
  ░░░░░░▒▒░░▒▒░░▒▒░░▒▒░░▒▒░░▒▒░░░░░░▒▒░░░░░░░░
    ░░░░▒▒░░▒▒░░▒▒░░▒▒▒▒▒▒░░▒▒░░░░░░▒▒▒▒▒▒░░░░░░
  ░░░░░░▒▒░░▒▒░░▒▒░░▒▒▒▒░░░░▒▒░░░░░░░░░░▒▒░░░░
    ░░░░▒▒░░▒▒░░▒▒░░▒▒░░▒▒░░▒▒▒▒▒▒░░▒▒▒▒▒▒░░░░░░
  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
    ░░▒▒▒▒▒▒▒▒▒▒░░▒▒░░▒▒░░▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒░░░░
  ░░░░▒▒░░▒▒░░▒▒░░░▒▒▒▒░░░▒▒░░▒▒░░▒▒░░▒▒░░░░░░
    ░░▒▒░░▒▒░░▒▒░░░░▒▒░░░░▒▒░░▒▒░░▒▒░░▒▒▒▒▒▒░░░░
  ░░░░▒▒░░▒▒░░▒▒░░░▒▒▒▒░░░▒▒░░▒▒░░▒▒░░░░░░▒▒░░
    ░░▒▒░░▒▒░░▒▒░░▒▒░░▒▒░░▒▒░░▒▒░░▒▒░░▒▒▒▒▒▒░░░░
  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
                        // github.com/mrcsmxms
"
sudo apt-get update
clear
echo "Which output would you like to use for audio?"
#echo "1: HeadPhones // 2: HDMI // 3: Auto"
echo "Choose wisely!"
echo "[1] Headphone / [2] HDMI / [3] Auto"
read line
case "$line" in
    1) sudo amixer cset numid=3 1
       echo "headphone set as audio output"
        ;;
    2) sudo amixer cset numid=3 2
       echo "HDMI set as audio output"
        ;;
    3) sudo amixer cset numid=3 0
       echo "audio output set to automatic"
        ;;
esac
sudo apt-get install git libao-dev libssl-dev libcrypt-openssl-rsa-perl libio-socket-inet6-perl libwww-perl avahi-utils
sudo git clone https://github.com/albertz/shairport.git shairport
cd shairport
sudo make
sudo make install
wget http://www.forum-raspberrypi.de/mydownloads/downloads/libnet-sdp-perl_0.07-1_all.deb
wget http://www.forum-raspberrypi.de/mydownloads/downloads/shairport_0.05-1_armhf.deb
sudo dpkg -i libnet-sdp-perl_0.07-1_all.deb
sudo dpkg -i shairport_0.05-1_armhf.deb
echo "Should AirPlay always start on boot?"
echo "[Y/N]"
read line
case "$line" in
    y|Y|J|j) sudo cp shairport.init.sample /etc/init.d/shairport
             cd /etc/init.d
             sudo chmod a+x shairport
             sudo update-rc.d shairport defaults
             sudo /etc/init.d/shairport start
             echo "AirPlay started!"
             echo "If you want to change the name of the AirPlay Station enter"
             echo "'sudo nano /etc/init.d/shairport'"
             echo "and enter '-a Name' after $PIDFILE"
             echo "Changes will appyl after restarting the program by the command"
             echo "'sudo /etc/init.d restart'"
             echo "Have fun"
        ;;
    n|N)     cd /home/pi
             sudo chmod a+x shairport
             sudo /home/pi/shairport start
             echo "AirPlay started!"
             echo "If you want to change the name of the AirPlay Station enter"
             echo "'sudo nano /home/pi/shairport'"
             echo "and enter '-a Name' after $PIDFILE"
             echo "Changes will appyl after restarting the program by the command"
             echo "'sudo /home/pi restart'"
             echo "Have fun"
        ;;
esac
