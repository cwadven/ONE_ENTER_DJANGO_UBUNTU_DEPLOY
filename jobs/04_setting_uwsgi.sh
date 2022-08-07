sudo mkdir run logs

sudo chown django:www-data run
sudo chown django:www-data logs

sudo vi /var/www/null_blog/run/uwsgi.ini

[uwsgi]
uid = django
base = /var/www/null_blog
home = %(base)/venv
chdir = %(base)
module = config.wsgi:application
env = DJANGO_SETTINGS_MODULE=config.settings
master = true
processes = 4
socket = %(base)/run/uwsgi.sock
logto = %(base)/logs/uwsgi.log
chown-socket = %(uid):www-data
chmod-socket = 660
vacuum = true

sudo vi /etc/systemd/system/uwsgi.service

[Unit]
Descripttion=uWSGI Emperor service

[Service]
ExecStart=/var/www/null_blog/venv/bin/uwsgi --emperor /var/www/null_blog/run
User=django
Group=www-data
Restart=on-failure
KillSignal=SIGQUIT
Type=notify
NotifyAccess=all
StandardError=syslog

[Install]
WantedBy=multi-user.target

systemctl start uwsgi
systemctl enable uwsgi
