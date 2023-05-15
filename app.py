from flask import Flask
from flask_smorest import Api

from resources.item import blp as ItemBluprint
from resources.store import blp as StoreBluprint


app = Flask(__name__) # create Flask app

# 블루프린트와 메서드 뷰를 활용해 클래스 기반 뷰를 구현하고 모듈화 했으면,
# 이제 app 인스턴스를 설정하고 연결시켜야 한다.

app.config["PROPAGATE_EXCEPTIONS"] = True
app.config["API_TITLE"] = "Stores REST API"
app.config["API_VERSION"] = "v1"
app.config["OPENAPI_VERSION"] = "3.0.3"
app.config["OPENAPI_URL_PREFIX"] = "/"
app.config["OPENAPI_SWAGGER_UI_PATH"] = "/swagger-ui"
app.config["OPENAPI_SWAGGER_UI_URL"] = "https://cdn.jsdelivr.net/npm/swagger-ui-dist/"
# Api 객체 생성
api = Api(app)

api.register_blueprint(ItemBluprint)
api.register_blueprint(StoreBluprint)