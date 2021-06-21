from flask import Flask
import os
app = Flask(__name__)

VERSION = 0.7

@app.route("/")
def hello():
    return "Hello World! (Version: {}) [{}]\n".format(VERSION, os.uname()[1])

if __name__ == "__main__":
    app.run()
