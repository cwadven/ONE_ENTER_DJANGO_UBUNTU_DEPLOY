cd /var/www/null_blog/
sudo python3.7 -m venv venv
source venv/bin/activate

pip install --upgrade pip setuptools
pip install -r requirements.txt
pip install wheel
pip install uwsgi
