# app.py

import os
from flask import Flask, render_template
import socket

background_color=os.environ.get("BACKGROUND_COLOR")
text_color=os.environ.get("TEXT_COLOR")

app = Flask(__name__)

def fetchdetails():
    hostname=socket.gethostname()
    host_ip=socket.gethostbyname(hostname)
    return str(hostname), str(host_ip)

# Route to the root URL
@app.route('/dining')
def dining():
    return render_template('dining.html');

# Route to a custom endpoint
@app.route('/greet/<name>')
def greet(name):
    return f'Hello, {name}! Welcome to Flask on Docker.'

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0', port=5000)