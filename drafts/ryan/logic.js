d3.json("2022_delays.json").then(function(data) {
    // Code to work with the loaded JSON data
    console.log(data);
  }).catch(function(error) {
    // Handle error if the JSON file fails to load
    console.error("Error loading the JSON file:", error);
  });

