# git 프로젝트 url 을 가져옵니다.
# 예) https://github.com/cwadven/NullyDRFTemplate.git
read -p "Enter Git Project Url: " GIT_URL

# 예) config.settings.production.py
read -p "Enter settings.py direction with path .: " CONFIG_SETTINGS

# 프로젝트 명을 가져옵니다.
with_git=(${GIT_URL##*/})
split_with_git=(${with_git//./ })
PROJECT_NAME=(${split_with_git[0]})

MY_PROJECT_DIRECTORY=/var/www/${PROJECT_NAME}

CURRENT_FOLDER=$PWD

export GIT_URL
export PROJECT_NAME
export MY_PROJECT_DIRECTORY
export CONFIG_SETTINGS

export CURRENT_FOLDER

# script 를 단계별로 실행
echo "================start 00_install_nginx.sh=================="
. "$CURRENT_FOLDER/jobs/00_install_nginx.sh"

echo "================start 01_set_directory_and_linux_user.sh=================="
. "$CURRENT_FOLDER/jobs/01_set_directory_and_linux_user.sh"

echo "================start 02_install_python.sh=================="
. "$CURRENT_FOLDER/jobs/02_install_python.sh"

echo "================start 03_install_pip_modules.sh=================="
. "$CURRENT_FOLDER/jobs/03_install_pip_modules.sh"

echo "================start 04_setting_uwsgi.sh=================="
. "$CURRENT_FOLDER/jobs/04_setting_uwsgi.sh"

echo "================start 05_setting_nginx_link.sh=================="
. "$CURRENT_FOLDER/jobs/05_setting_nginx_link.sh"

echo "================start 06_setting_django_project.sh=================="
. "$CURRENT_FOLDER/jobs/06_setting_django_project.sh"

echo "================start 07_restart_nginx_uwsgi.sh=================="
. "$CURRENT_FOLDER/jobs/07_restart_nginx_uwsgi.sh"

unset GIT_URL
unset PROJECT_NAME
unset MY_PROJECT_DIRECTORY
unset CONFIG_SETTINGS
unset CURRENT_FOLDER
