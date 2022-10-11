if [ -d "$MY_PROJECT_DIRECTORY/run" ];
then
echo "already exists"
else
cd $MY_PROJECT_DIRECTORY && sudo mkdir run logs

sudo chown django:www-data run
sudo chown django:www-data logs

cd $MY_PROJECT_DIRECTORY/run

# 출력값 없애는 방법 찾아보기
cat <<EOF | sudo tee uwsgi.ini
[uwsgi]
uid = django
base = $MY_PROJECT_DIRECTORY
home = %(base)/venv
chdir = %(base)
module = config.wsgi:application
env = DJANGO_SETTINGS_MODULE=$CONFIG_SETTINGS
master = true
processes = 4
socket = %(base)/run/uwsgi.sock
logto = %(base)/logs/uwsgi.log
chown-socket = %(uid):www-data
chmod-socket = 660
vacuum = true
EOF

cd /etc/systemd/system/

cat <<EOF | sudo tee uwsgi.service
[Unit]
Description=uWSGI Emperor service

[Service]
ExecStart=$MY_PROJECT_DIRECTORY/venv/bin/uwsgi --emperor $MY_PROJECT_DIRECTORY/run
User=django
Group=www-data
Restart=on-failure
KillSignal=SIGQUIT
Type=notify
NotifyAccess=all
StandardError=syslog

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl stop uwsgi
sudo systemctl start uwsgi
sudo systemctl enable uwsgi
fi