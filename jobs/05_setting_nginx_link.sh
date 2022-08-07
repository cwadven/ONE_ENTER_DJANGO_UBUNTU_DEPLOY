sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/$PROJECT_NAME
sudo ln -s /etc/nginx/sites-available/$PROJECT_NAME /etc/nginx/sites-enabled
sudo rm /etc/nginx/sites-enabled/default

# nginx 설정 수정
sudo sed -i 's/# server_names_hash_bucket_size 64;/server_names_hash_bucket_size 128;/g' /etc/nginx/nginx.conf

# 프로젝트 nginx uwsgi 와 연동

cd /etc/nginx/sites-available/

cat <<EOF | sudo tee -a $PROJECT_NAME
upstream django {
        server unix:$MY_PROJECT_DIRECTORY/run/uwsgi.sock;
}

server {
        client_max_body_size 100M;
        charset utf-8;

        location / {
                include         /etc/nginx/uwsgi_params;
                uwsgi_pass      django;
        }

        location /static {
                alias $MY_PROJECT_DIRECTORY/static;
        }

        location /media {
                alias $MY_PROJECT_DIRECTORY/media;
        }
}
EOF
