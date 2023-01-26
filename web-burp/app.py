import os
from flask import Flask, redirect, render_template, request, url_for
from flask_sock import Sock

app = Flask(__name__)
sock = Sock(app)
    
@app.route("/")
def index():
    return render_template('index.html')


@sock.route("/echo")
def echo(sock):
    while True:
        data = sock.receive()
        domen = os.popen("nslookup " + data).read()
        sock.send(domen)


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=False)