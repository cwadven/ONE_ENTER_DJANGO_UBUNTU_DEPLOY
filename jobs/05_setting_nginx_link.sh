sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/null_blog
sudo ln -s /etc/nginx/sites-available/null_blog /etc/nginx/sites-enabled
sudo rm /etc/nginx/sites-enabled/default

vi /etc/nginx/nginx.conf
# 추가 작업

sudo vi /etc/nginx/sites-available/null_blog
# 추가 작업