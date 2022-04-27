from flask import Flask, jsonify
from status.status import *
from user import user
from product import product

def creat_app(test_config = None):

    app = Flask(__name__)

    @app.route("/", methods = ["get"])
    def route():
        # read README file and return it
        return jsonify({"code": SUCCESS_CODE, "message" : "Welcome to our data base"})

    app.register_blueprint(user)
    app.register_blueprint(product)

    return app
