cd $MY_PROJECT_DIRECTORY && sudo python3.7 -m venv venv

source $MY_PROJECT_DIRECTORY/venv/bin/activate && sudo pip install --upgrade pip setuptools
source $MY_PROJECT_DIRECTORY/venv/bin/activate && sudo pip install -r requirements.txt
source $MY_PROJECT_DIRECTORY/venv/bin/activate && sudo pip install wheel
source $MY_PROJECT_DIRECTORY/venv/bin/activate && sudo pip install uwsgi
