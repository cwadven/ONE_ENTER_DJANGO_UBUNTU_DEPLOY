sudo groupadd djangogroup
sudo useradd -g djangogroup -b /home -m -s /bin/bash django

cd /var/www && sudo git clone $GIT_URL
sudo chown django:djangogroup $MY_PROJECT_DIRECTORY
sudo usermod -a -G djangogroup ubuntu
sudo chmod g+w $MY_PROJECT_DIRECTORY
