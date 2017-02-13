from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World! (Version: 0.1)\n"

if __name__ == "__main__":
    app.run()
