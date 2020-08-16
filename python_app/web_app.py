from flask import Flask, render_template, request
import numpy as np
import base64
import sys
import json
import pickle

# Assign the html folder.
app = Flask(__name__, template_folder="templates")
print("App started")

# Render the index.html
@app.route('/')
def index():
    return render_template('index.html')

model = pickle.load("MODEL_PATH")

@app.route('/predict', methods=["POST"])
def predict():
    # Get the data row, for now just a row of csv

    model.predict(data)

    return json.dumps({"class" : int(classid), "confidence":float(confidence)}), 200, {"ContentType":"application/json"}

if __name__ == "__main__":
    app.run()





