> second pass at having a GUI 

#### single click initializing
the explorer app setup initializes the virtual environment, and runs the the flask app and provides a link to the project's documentation. Also, an additional button is provided to stop the flask server. 

![[Pasted image 20230710181420.png]]

#### integrated flask and external api actions
much more instructions, currently have the weather API set-up, pending the geoapify and historical buttons to create. 

![[Pasted image 20230710181647.png]]

#### local page build 
Flask app loads a version of the index.html that is particularly built for the user input.

![[Pasted image 20230710182136.png]]

#### bugfixes 
- [ ] weather api still doesn't work with developer api key, will test separately 
- [x] local dashboard launches from the flask app.
	- [x] separate github pages build from local flask app build 

#### new features 
- [ ] historical data button 
- [ ] data processing progress bar 