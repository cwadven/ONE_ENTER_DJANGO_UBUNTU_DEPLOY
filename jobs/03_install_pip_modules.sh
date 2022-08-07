cd $MY_PROJECT_DIRECTORY && sudo python3.7 -m venv venv

. $MY_PROJECT_DIRECTORY/venv/bin/activate && sudo pip3 install --upgrade pip setuptools
. $MY_PROJECT_DIRECTORY/venv/bin/activate && sudo pip3 install wheel
. $MY_PROJECT_DIRECTORY/venv/bin/activate && sudo pip3 install -r requirements.txt
. $MY_PROJECT_DIRECTORY/venv/bin/activate && sudo pip3 install uwsgi
