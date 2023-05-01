# 원앤터 Django Ubuntu 배포

#### Canonical-Ubuntu-18.04 Version (Oracle Cloud Instance)

---

### 아래 작업은 생성한 Oracle Cloud Instance 에서 하세요

#### 1. root 권한으로 실행
(pip install 에서 문제가 생겨서 root 권한 실행 )

```
sudo su -

git clone https://github.com/cwadven/ONE_ENTER_DJANGO_UBUNTU_DEPLOY.git

cd ONE_ENTER_DJANGO_UBUNTU_DEPLOY
```

#### 2. 스크립트 실행

```
/bin/bash start.sh
```


중간에 `pip install` 에서 문제가 생기면 정상적으로 실행되지 않을 겁니다.

#### 3. python manage.py collectstatic 은 따로 인스턴스에서 하세요
