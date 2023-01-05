import os
from flask import Flask, redirect, render_template, request, url_for
from flask_sock import Sock
import mysql.connector


app = Flask(__name__)
sock = Sock(app)
config = {
    'user': 'root',
    'password': 'password',
    'host': 'mariadb',
    'database': 'users',
    'raise_on_warnings': True
    }
    
@app.route("/")
def index():
    return render_template('index.html')


@sock.route("/echo")
def echo(sock):
    while True:
        data = sock.receive()
        domen = os.popen("nslookup " + data).read()
        sock.send(domen)

@app.route("/admin-page", methods=["GET", "POST"])
def adminLogin():
    print("TESTTESTTESTTESTTESTTESTTESTTSETTSETTEST")
    if request.method == 'POST':
        cnx = mysql.connector.connect(**config)
        cursor = cnx.cursor()

        login = request.form['login']
        password = request.form['password']
        query = (f"SELECT * FROM users_info WHERE login = '{login}' AND password = '{password}'")
        user = cursor.execute(query)
        print(user)
        cnx.close()
    return render_template('admin-login.html')


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=False)