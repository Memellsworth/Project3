d3.json("/drafts/ryan/delays.json").then(function(data) {
    console.log(data);
    // Extract the necessary data
    const carriers = data.map(d => d.carrier_name);
    const numFlights = data.map(d => d.arr_flights);
    const arrDelay = data.map(d => d.arr_delay);
    const months = [12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1];

    console.log(arrDelay);

    let trace = {
      x: carriers,
      y: numFlights,
      type: "bar"
    };

    let layout = {
      title: "Number of Flights in 2022",
      height: 500,
      width: 500
    };

    Plotly.newPlot("bar", [trace], layout);


    let trace1 = {
      values: arrDelay,
      labels: carriers,
      type: 'pie'
    };

    let layout1 = {
      title: "2022 Delays by Airline",
      height: 500,
      width: 500
    };

    Plotly.newPlot('pie', [trace1], layout1);

    let trace2 = {
      x: carriers,
      y: arrDelay,
      mode: 'markers',
      marker: {
        size: numFlights / 2
      }
    };

    let layout2 = {
      title: "something",
      height:500,
      width:500
    };

    Plotly.newPlot("crazy", [trace2], layout2);

  }).catch(function(error) {
    // Handle error if the JSON file fails to load
    console.error("Error loading the JSON file:", error);
  });
