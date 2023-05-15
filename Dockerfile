# Base image
FROM python:3.10
# What port start to run it
EXPOSE 5000
# 작업하기 위해 이동할 폴더 경로
WORKDIR /app
# requirements.txt 에 적힌 목록 설치
# 주의사항 - COPY를 안하면 Docker는 requirements.txt를 모르기 때문에 RUN 전에 해당 파일을 COPY 해야한다.
COPY requirements.txt .
RUN pip install -r requirements.txt
# . (모든 소스를) . (여기에 있는 것들을 복사)
COPY . .
# 실행할 명령어
CMD ["flask","run","--host","0.0.0.0"]
# docker 빌드 명령어. rest-api-flask-python 이라는 이름(태그)로 .(현재 위치의 Dockerfile) 참조
# docker build -t rest-api-flask-python .
# 도커 데스크톱으로 실행할 수 있고, 다음의 명령어를 입력하여 터미널로 실행시킬 수 있다.
# docker run -p 5005:5000 rest-api-flask-python
# 이는 rest-api-flask-python 이름의 이미지를 실행시킨다는 뜻
# 또한 5000포트를 5005번으로 포트포워딩 한다는 뜻이다.
# 백그라운드에서 실행시키고 싶다면 -d 혹은 -p와 합쳐서 -dp 옵션을 주면 된다.
# docker run -d -p 5005:5000 rest-api-flask-python
# OR
# docker run -dp 5005:5000 rest-api-flask-python

# 코드 변경할 때 마다 동기화 시켜주는 명령어
# docker run -dp 5005:5000 -w /app -v "$(pwd):/app" rest-api-flask-python
