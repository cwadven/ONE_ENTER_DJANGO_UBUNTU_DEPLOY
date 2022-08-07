sudo groupadd djangogroup
sudo useradd -g djangogroup -b /home -m -s /bin/bash django

sudo chown django:djangogroup /var/www/$PROJECT_NAME
sudo usermod -a -G djangogroup ubuntu
sudo chmod g+w /var/www/$PROJECT_NAME
