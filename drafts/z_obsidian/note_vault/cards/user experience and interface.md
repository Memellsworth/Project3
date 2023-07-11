> describing the user interface and user experience 

#### getting started 

Users would have two types of experience with our application 

1. online 
2. repo - interactive 

## online 
> this is what github pages showcases as a [static website](https://memellsworth.github.io/Project3/index.html)

## repo-interactive 

in short this is the flow this experience looks like;  

1. users clone our repo
2. users run the flask app.js
	1. the flask app first asks for the API key, and creates the api_key.py
	2. the flask app then asks for the desired city of origin or destination from IAH
	3. the flask app looks at the past 12 mo of weather data and spits out a "local_weather.json"	
	4. folks are redirected to the local version of our website, [https://memellsworth.github.io/Project3/index.html](https://memellsworth.github.io/Project3/index.html) and the data from "local_weather.json" is integrated somewhere in the dashboard

# updates 
- [[user experience_update01]]
- [[user experience_update02]]



back to [[Project Development Journal Entries]]
