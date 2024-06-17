sudo pacman -S efitools 
sudo mkdir -p /usr/share/secureboot/keys # Store all keys here 
uuidgen --random > GUID.txt
openssl req -newkey rsa:4096 -nodes -keyout PK.key -new -x509 -sha256 -days 3650 -subj "/CN=my Platform Key/" -out PK.crt
