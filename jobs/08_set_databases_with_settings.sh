cd $CURRENT_FOLDER

# 데이터베이스가 있을 경우 안함
if [[ ! -z "`mysql -qfsBe "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME='$DATABASE_NAME'" 2>&1`" ]];
then
echo "database already exists"
else
# .sql 파일 생성
cat <<EOF | sudo tee mysql_database_initial_setting.sql
CREATE DATABASE $DATABASE_NAME;
CREATE USER `$DATABASE_USER_NAME`@`localhost` IDENTIFIED BY '$DATABASE_USER_PASSWORD';
GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO `$DATABASE_USER_NAME`@`localhost`;
flush privileges; # 권한 적용
ALTER DATABASE `$DATABASE_NAME` CHARACTER SET utf8;
EOF
# .sql 파일 실행
mysql -uroot < $CURRENT_FOLDER/mysql_database_initial_setting.sql
fi