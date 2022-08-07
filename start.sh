#!/bin/bash

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

export GIT_URL
export PROJECT_NAME
export MY_PROJECT_DIRECTORY
export CONFIG_SETTINGS

# script 를 단계별로 실행
. "jobs/00_install_nginx.sh"
. "jobs/01_set_directory_and_linux_user.sh"
. "jobs/02_install_python.sh"
. "jobs/03_install_pip_modules.sh"
. "jobs/04_setting_uwsgi.sh"
. "jobs/05_setting_nginx_link.sh"
. "jobs/06_setting_django_project.sh"
. "jobs/07_restart_nginx_uwsgi.sh"

unset GIT_URL
unset PROJECT_NAME
unset MY_PROJECT_DIRECTORY
unset CONFIG_SETTINGS
