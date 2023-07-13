d3.json("../../drafts/ryan/delays.json").then(function(data) {
    console.log(data);
    // Extract the necessary data
    const carriers = data.map(d => d.carrier_name);
    const numFlights = data.map(d => d.arr_flights);
    const arrDelay = data.map(d => d.arr_delay);
    const carrierDelay = data.map(d => d.carrier_delay);
    const airlineNames = [];
    const dec = [];
    const decDelay = [];
    const decWeather = [];
    const decNumFlights = [];

    for (let i=0; i<12; i++) {
      dec.push(data[i]);
      airlineNames.push(data[i].carrier_name);
      decDelay.push(data[i].arr_delay / 60);
      decWeather.push(data[i].weather_delay);
      decNumFlights.push(data[i].arr_flights / 10);
    };

    console.log(airlineNames);

    let trace = {
      x: carriers,
      y: numFlights,
      marker: {
        color: "#00203F"
      },
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
      z: [[5507,342,1077,7691,685,212,9609,30759,41089,5601,38002,476],
      [5816,210,1846,7513,1027,268,9409,21285,31308,3891,36159,893],
      [7579,434,1304,9006,1391,366,10949,63,24880,56373,8290,28306,1176],
      [5317,258,1576,6815,997,574,9098,16551,59763,5662,14987,575],
      [8340,182,921,9297,1199,607,11590,23798,58884,3367,25970,650],
      [11504,409,1487,7275,1741,565,6175,14249,56583,4994,20808,1814],
      [10992,292,697,7965,2135,512,6989,9910,54283,8703,23215,1476],
      [12234,474,1008,8354,2936,665,6254,17795,68961,10321,28690,190],
      [9376,490,522,4191,1371,384,6987,8421,30831,4328,14392,515],
      [6189,252,913,6684,3982,167,9045,7423,29348,4512,10625,523],
      [6438,868,1815,8898,2692,738,12052,12659,51128,4468,15186,424],
      [9372,1270,1693,11447,2566,1341,17438,21449,92350,7621,21465,497]],
      x: airlineNames,
      y: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
      type: 'heatmap',
      hoverongaps: false
    };

    let layout2 = {
      title: "2022 Flight Delays by Months",
      showlegend: false,
      height: 500,
      width: 500
    };

    Plotly.newPlot("heatmap", [trace2], layout2);

    let trace3 = {
      x: airlineNames,
      y: arrDelay,
      marker: {
        color: "#00203F"
      },
      name: "Arrival Delay",
      type: 'bar'
    };

    let trace4 = {
      x: airlineNames,
      y: carrierDelay,
      marker: {
        color: "#ADEFD1"
      },
      name: "Carrier Delay",
      type: 'bar'
    };

    var data2 = [trace3, trace4];

    let layout3 = {
      barmode: 'stack',
      title: "2022 Arrival & Carrier Delay by Airlines ",
      height: 500,
      width: 500
    };

    Plotly.newPlot("doublebar", data, layout3);

  }).catch(function(error) {
    // Handle error if the JSON file fails to load
    console.error("Error loading the JSON file:", error);
  });