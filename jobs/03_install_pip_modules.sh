cd $MY_PROJECT_DIRECTORY && python3.7 -m venv venv

source $MY_PROJECT_DIRECTORY/venv/bin/activate && pip install --upgrade pip setuptools
source $MY_PROJECT_DIRECTORY/venv/bin/activate && pip install -r requirements.txt
source $MY_PROJECT_DIRECTORY/venv/bin/activate && pip install wheel
source $MY_PROJECT_DIRECTORY/venv/bin/activate && pip install uwsgi
