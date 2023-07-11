let dropdownMenu = d3.select("#selDataset");

d3.json("/drafts/ryan/delays.json").then(function(data) {
    console.log(data);
    // Extract the necessary data
    const carriers = data.map(d => d.carrier_name);
    const numFlights = data.map(d => d.arr_flights);
    const arrDelay = data.map(d => d.arr_delay);
    const airlineNames = [];
    const dec = [];
    const decDelay = [];
    const decWeather = [];
    const decNumFlights = [];

    for (i=0; i<12; i++) {
      dec.push(data[i]);
      airlineNames.push(data[i].carrier_name);
      decDelay.push(data[i].arr_delay / 60);
      decWeather.push(data[i].weather_delay);
      decNumFlights.push(data[i].arr_flights / 10);
    };

    console.log(decDelay);

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
      x: decDelay,
      y: decWeather,
      text: airlineNames,
      mode: 'markers',
      marker: {
        color: ["#fafa6e", "#cdef72", "#a4e27a", "#7dd382", "#58c389", "#35b28e", "#0ea18f", "#008f8c", "#007d85", "#146b79", "#23596a", "#2a4858"],
        size: decNumFlights
      }
    };

    let layout2 = {
      title: "December 2022 Flight Delays",
      showlegend: false,
      height: 500,
      width: 500
    };

    Plotly.newPlot("bubble", [trace2], layout2);

  }).catch(function(error) {
    // Handle error if the JSON file fails to load
    console.error("Error loading the JSON file:", error);
  });