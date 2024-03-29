from flask import Flask, jsonify
from status.status import *
from customer import user
from product import product
from order import order
from flask_jwt_extended import JWTManager
from rating import rating
from forum import forum
from stats import stats


def creat_app(test_config = None):

    app = Flask(__name__)
    app.config["JWT_SECRET_KEY"] = "super-secret"  # it should be oculted!
    jwt = JWTManager(app)

    @app.route("/", methods = ["get"])
    def route():
        # read README file and return it
        return jsonify({"code": SUCCESS_CODE, "message" : "Welcome to our data base"})

    app.register_blueprint(user)
    app.register_blueprint(product)
    app.register_blueprint(order)
    app.register_blueprint(rating)
    app.register_blueprint(forum)
    app.register_blueprint(stats)
    

    return app

