from flask import Flask, render_template, request
import numpy as np
import base64
import sys
import json
import pickle
import pandas as pd


# Assign the html folder.
# app = Flask(__name__, template_folder="templates")

app = Flask(__name__)
print("App started")

df = pd.read_csv("..//data//dummy_leads_data2.csv")
X = df.iloc[:, 0:5].values[42]
X = X.reshape(1, -1)

with open("..//data//model.pkl", "rb") as f:
    model = pickle.load(f)

# y = df.iloc[:, 9].values

# Render the index.html
@app.route('/')
def index():
    print()
    return "Alive"

@app.route('/predict', methods=["GET"])
def predict():
    # Get the data row, for now just a row of csv
    out = model.predict(X)
    classid = out[0]
    # print(out)

    print()
    return json.dumps({"class" : int(classid)}), 200, {"ContentType":"application/json"}

if __name__ == "__main__":
    app.run()

