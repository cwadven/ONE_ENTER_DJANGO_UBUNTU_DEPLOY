# mariadb install
sudo apt-get -y install mariadb-server mariadb-client

# mysql service start
service mysql start

# pip install mysqlclient
. $MY_PROJECT_DIRECTORY/venv/bin/activate && pip install mysqlclient