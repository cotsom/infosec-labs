from functools import wraps
import os
from flask import Flask, redirect, render_template, request, session, url_for
from flask_sock import Sock
import mariadb

app = Flask(__name__)
app.secret_key = 'g8y348f3h4f34jf93ij4g3u49gh3487fh34fj8347hfg3487fh348jf34hf837fg'
sock = Sock(app)
config = {
    "user": os.getenv("DB_USER", "root"),
    "password": os.getenv("DB_PASS", "password"),
    "host": os.getenv("DB_HOST", "web-sqlmap-lab"),
    "port": 3306,
    "database": "users"
    }

def dbConn():
    try:
        conn = mariadb.connect(**config)
    except mariadb.Error as e:
        print(f"Error connecting to MariaDB Platform: {e}")
    cur = conn.cursor()
    return cur

def auth(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'user' not in session:
            session['user'] = False
        return f(*args, **kwargs)
    return decorated_function
    
@app.route("/")
def index():
    return render_template('index.html')


@sock.route("/echo")
def echo(sock):
    while True:
        data = sock.receive()
        domen = os.popen("nslookup " + data).read()
        sock.send(domen)

@app.route("/admin-login", methods=["GET", "POST"])
def adminLogin():
    if request.method == 'POST':
        username = ''
        cur = dbConn()
        login = request.form['login']
        password = request.form['password']

        cur.execute(
            f"SELECT * FROM users_info WHERE login = '{login}' AND password = '{password}'"
            )

        for (id, log, pas, voc) in cur:
            username = log
            print(id, log, pas, voc)
        
        if username:
            session['user'] = username
            return redirect(url_for('adminPage'))
        else: 
            return render_template('admin-login.html', error="invalid credentials")

    return render_template('admin-login.html')

@auth
@app.route("/admin-page", methods=["GET", "POST"])
def adminPage():
    is_user = session.get('user', False)
    if not (is_user):
        return redirect(url_for('adminLogin'))

    cur = dbConn()
    employee = request.args.get('employee')

    if employee:
        vocation = ''
        cur.execute(
            f"SELECT vocation FROM users_info WHERE login = '{employee}'"
            )
        for voc in cur:
            vocation = voc
            print(voc)
        
        if vocation:
            employee_name = employee
        else:
            return render_template("admin-page.html")

        return render_template("admin-page.html", employee=employee_name, vocation=vocation)
    return render_template("admin-page.html")


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=False)