# pip install mysqlclient
. $MY_PROJECT_DIRECTORY/venv/bin/activate && pip install mysqlclient

# migrate
. $MY_PROJECT_DIRECTORY/venv/bin/activate && python $MY_PROJECT_DIRECTORY/manage.py migrate --noinput