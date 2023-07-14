document.addEventListener("DOMContentLoaded", function() {
    // Creating the map object centered in Houston
    let map = L.map("map1", {
      center: [29.749907, -95.358421],
      zoom: 4
    });
  
    // Adding the tile layer
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '© <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors'
    }).addTo(map);
  
    // Load the airport locations from the JSON file using D3
    d3.json('./flaskapp/data/airports.json')
      .then(function(data) {
        // Set up a scale for color based on the airport's score
        var colorScale = d3.scaleSequential()
          .domain(d3.extent(data, function(d) { return d.score; }))
          .interpolator(d3.interpolateBlues);
  
        // Create an SVG layer for drawing the hexbins
        var svgLayer = L.svg();
        svgLayer.addTo(map);
  
        // Get the SVG container
        var svg = d3.select(svgLayer._container);
  
        // Generate the hexbin layout
        var hexbin = d3.hexbin()
          .radius(10) // Adjust the hexbin size as needed
          .extent([[0, 0], [map.getSize().x, map.getSize().y]]);
  
        // Compute the hexbin data based on airport locations
        var hexbinData = hexbin(data.map(function(d) {
          return map.latLngToLayerPoint([d.latitude_deg, d.longitude_deg]);
        }));
  
        // Create the hexagonal bins
        svg.append("g")
          .selectAll("path")
          .data(hexbinData)
          .enter()
          .append("path")
          .attr("d", function(d) { return hexbin.hexagon(); })
          .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; })
          .attr("fill", function(d) { return colorScale(d3.mean(d, function(v) { return v.score; })); })
          .attr("stroke", "white")
          .attr("stroke-width", 0.5)
          .on("mouseover", function(d) {
            // Add tooltip or other interactions as needed
            console.log("Bin count:", d.length);
          })
          .on("mouseout", function(d) {
            // Remove tooltip or other interactions as needed
          });
  
        // Update the SVG layer when the map is panned or zoomed
        map.on("moveend", update);
  
        function update() {
          // Recompute the hexbin data based on updated airport locations
          hexbinData = hexbin(data.map(function(d) {
            return map.latLngToLayerPoint([d.latitude_deg, d.longitude_deg]);
          }));
  
          // Update the hexagonal bins' positions
          svg.selectAll("path")
            .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });
        }
      });
  });
  