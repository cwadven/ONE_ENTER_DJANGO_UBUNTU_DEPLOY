# 첫 세팅에 /var/www 폴더를 만들어야 합니다.
# git clone을 /var/www 에 받습니다.

PROJECT_NAME="test"
export PROJECT_NAME


# script 를 단계별로 실행
. ".jobs/00_install_nginx.sh"
. ".jobs/01_set_directory_and_linux_user.sh"
. ".jobs/02_install_python.sh"
. ".jobs/03_install_pip_modules.sh"
. ".jobs/04_setting_uwsgi.sh"
. ".jobs/05_setting_nginx_link.sh"
. ".jobs/06_setting_django_project.sh"
. ".jobs/07_restart_nginx_uwsgi.sh"