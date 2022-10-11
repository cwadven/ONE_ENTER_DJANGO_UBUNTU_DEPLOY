# pip install mysqlclient
. $MY_PROJECT_DIRECTORY/venv/bin/activate && pip install mysqlclient

# migrate
. $MY_PROJECT_DIRECTORY/venv/bin/activate && python manage.py migrate --noinput