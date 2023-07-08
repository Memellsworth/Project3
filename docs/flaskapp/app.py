from flask import Flask, request, jsonify, render_template, send_from_directory
import requests
import os
import json
import time
from datetime import datetime, timedelta

app = Flask(__name__)

# ... existing routes ...

@app.route('/setup')
def setup():
    return render_template('setup.html')

@app.route('/home', methods=['GET', 'POST'])
def home():
    return render_template('index.html')

@app.route('/weather', methods=['POST'])
def get_weather():
    api_key = request.form['api_key']
    city = request.form['city']

    if not api_key or not city:
        return render_template('weather_popup.html', error_message='Missing api_key or city')

    # code to handle user input for origin or destination
    # By default, assume Houston is the other city
    other_city = 'Houston'
    user_input = request.form.get('user_input')
    
    if user_input:
        other_city = user_input

    # Write the API key to a file
    with open('api_key.py', 'w') as f:
        f.write(f'api_key = "{api_key}"\n')

    # Get the lat/long for the city
    response = requests.get(f'http://api.openweathermap.org/geo/1.0/direct?q={city},us&limit=1&appid={api_key}')
    
    if response.status_code != 200:
        return render_template('weather_popup.html', error_message='Failed to get weather data')


    lat, lon = response.json()[0]['lat'], response.json()[0]['lon']

    # Get the weather data for the last year
    end = int(datetime(2022, 12, 31).timestamp())
    start = int(datetime(2022, 1, 1).timestamp())

    response = requests.get(f'https://history.openweathermap.org/data/2.5/history/city?lat={lat}&lon={lon}&type=hour&start={start}&end={end}&appid={api_key}')
    
    weather_data = response.json()

    # Save the weather data to a file
    with open('local_weather.json', 'w') as f:
        json.dump(weather_data, f)

    return render_template('weather_popup.html', weather_data=weather_data)

# ... additional routes ...

if __name__ == '__main__':
    app.run()