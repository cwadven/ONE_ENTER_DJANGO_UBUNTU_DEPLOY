cd $MY_PROJECT_DIRECTORY && sudo python3.7 -m venv venv

source $MY_PROJECT_DIRECTORY/venv/bin/activate && sudo pip3 install --upgrade pip setuptools
source $MY_PROJECT_DIRECTORY/venv/bin/activate && sudo pip3 install -r requirements.txt
source $MY_PROJECT_DIRECTORY/venv/bin/activate && sudo pip3 install wheel
source $MY_PROJECT_DIRECTORY/venv/bin/activate && sudo pip3 install uwsgi
