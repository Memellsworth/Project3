from flask import Flask, request, jsonify,redirect, render_template, send_from_directory
import requests
import os
import json
import time
from datetime import datetime, timedelta
from pymongo import MongoClient
import os




app = Flask(__name__)
password = "uUn0sOsNLAWe403r"

@app.route('/')



# ... existing routes ...

@app.route('/setup', methods=['GET', 'POST'])
def setup():
    return render_template('setup.html')

@app.route('/home', methods=['GET', 'POST'])
def home():
    return render_template('index.html')

# ... additional routes ...

@app.route('/api/password_get', methods=['GET'])
def password_get():
    return render_template('setup.html')

@app.route('/api/password_submit', methods=['POST'])
def password_submit():
    password = request.form.get('password')
    return redirect('/api/data')

@app.route('/api/data', methods=['GET'])
def connect_to_mongodb():
    global password
    uri = f"mongodb+srv://analysis:{password}@flightdelay0.xkb2gjb.mongodb.net/test?retryWrites=true&w=majority"
    client = MongoClient(uri)
    db = client['maindb']
    coll_airports = db['full_detail_airports']
    coll_current = db['raw_current']
    coll_airlines = db['carrier_key_table']
    return coll_airports, coll_current, coll_airlines

#@app.route('/api/fancycharts', methods=['GET'])
#def connect_to_mongodb2():
    #global password
    #uri = f"mongodb+srv://analysis:{password}@delay2022r0.xduazyv.mongodb.net/?retryWrites=true&w=majority"
    #client = MongoClient(uri)
    #db = client['2022flight']
    #delays_2022 = db['texasdelays']
    #data = list(delays_2022.find())
    #processed_data = processData(data)
    #return jsonify(processed_data)

@app.route('/api/document_counts', methods=['GET'])
def get_document_counts():
    coll_airports, coll_current, coll_airlines = connect_to_mongodb()

    # Retrieve the document counts
    counts = {
        'coll_airports': coll_airports.count_documents({}),
        'coll_current': coll_current.count_documents({}),
        'coll_airlines': coll_airlines.count_documents({})
    }

    # Return the counts as a JSON response
    return jsonify(counts)

if __name__ == '__main__':
    app.run()