cd $MY_PROJECT_DIRECTORY && python3.7 -m venv venv

. $MY_PROJECT_DIRECTORY/venv/bin/activate && pip install --upgrade pip setuptools
. $MY_PROJECT_DIRECTORY/venv/bin/activate && pip install wheel
. $MY_PROJECT_DIRECTORY/venv/bin/activate && pip install -r requirements.txt
. $MY_PROJECT_DIRECTORY/venv/bin/activate && pip install uwsgi
