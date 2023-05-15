# Base image
FROM python:3.10
# What port start to run it
EXPOSE 5000
# 작업하기 위해 이동할 폴더 경로
WORKDIR /app
# requirements.txt 에 적힌 목록 설치
# 주의사항 - COPY를 안하면 Docker는 requirements.txt를 모르기 때문에 RUN 전에 해당 파일을 COPY 해야한다.
COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt
# . (모든 소스를) . (여기에 있는 것들을 복사)
COPY . .
# 실행할 명령어
CMD ["flask","run","--host","0.0.0.0"]
# docker 빌드 명령어. rest-api-flask-python 이라는 이름(태그)로 .(현재 위치의 Dockerfile) 참조
# docker build -t rest-api-flask-python .
