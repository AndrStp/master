from flask import Flask, render_template
from os import environ

app = Flask(__name__)

NAME = environ.get("NAME", "name")
LOCATION = environ.get("LOCATION", "location")

@app.route('/')
def hello():
	return render_template("index.html", 
						   name=NAME.upper(), 
						   location=LOCATION.upper()) 

if __name__ == '__main__':
	app.run(host='0.0.0.0', port=5000)
