let config = {
  minZoom: 4,
  maxZoom: 18,
  maxBounds: [
    [24.396308, -125.000000], // Southwest coordinates
    [49.384358, -66.934570] // Northeast coordinates
  ]
}

// magnification with which the map will start
const zoom = 6;
// coordinates
const lat = 29.749907;
const lng = -95.358421;

// calling map
const map = L.map("map", config).setView([lat, lng], zoom);

// ----------------------------------------------------

// hexabin analysis 

// ----------------------------------------------------

fetch('./flaskapp/data/airports_key.json')
.then(response => response.json())
.then(data => {
  console.log(data);
  data.features.forEach(feature => {
    if (feature.geometry && feature.geometry.coordinates) {
      const [lng, lat] = feature.geometry.coordinates;
      const title = feature.properties.name;
      const municipality = feature.properties.municipality;
      const elevation = feature.properties.elevation_ft;
      const rating = feature.properties.score;
    }
  })
  .catch(error => console.error('Error:', error));

  var colorScale = d3.scaleSequential()
  .domain(d3.extent(data.features, function(d) { return d.properties.score; }))
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
  var hexbinData = hexbin(
    data.features
    .map(function(d) {
      if (d.geometry && d.geometry.coordinates) {
        const [lng, lat] = d.geometry.coordinates;
        return {...map.latLngToLayerPoint([lat, lng]), score: d.properties.score};
      }
    })
    .filter(item => item !== undefined) 
  );

  console.log(hexbinData); // Check the structure of your data

  // Create the hexagonal bins
  svg.append("g")
    .selectAll("path")
    .data(hexbinData)
    .enter()
    .append("path")
    .attr("class", "hexbin")
    .attr("d", function(d) { return hexbin.hexagon(); })
    .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; })
    .attr("fill", function(d) { return colorScale(d3.mean(d, function(v) { return v.score; })); })
    .on("mouseover", function(d) {
    console.log("Bin count:", d.length);
    })
    .on("mouseout", function(d) {
    });

  // Update the SVG layer when the map is panned or zoomed
  map.on("moveend", update);

  function update() {
    // Recompute the hexbin data based on updated airport locations
    hexbinData = hexbin(
      data.features
      .map(function(d) {
        if (d.geometry && d.geometry.coordinates) {
          const [lng, lat] = d.geometry.coordinates;
          return {...map.latLngToLayerPoint([lat, lng]), score: d.properties.score};
        }
      })
      .filter(item => item !== undefined)
    );

    // Update the hexagonal bins' positions
    svg.selectAll("path")
    .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });
  } 
});


// ----------------------------------------------------

// Create custom icon for Houston IAH airport
let houstonIcon = L.icon({
  iconUrl: './img/htown.png',
  iconSize: [40, 40], 
  iconAnchor: [20, 20], 
  popupAnchor: [-3, -76] 
});

// Create marker for Houston IAH airport
const houstonLat = 29.9902; // Latitude of Houston IAH airport
const houstonLng = -95.3368; // Longitude of Houston IAH airport
const houstonMarker = L.marker([houstonLat, houstonLng], {icon: houstonIcon}).addTo(map);
houstonMarker.bindPopup("Houston IAH Airport");

// Adding the US boundary 
let serviceLayer = L.esri.featureLayer({
url: 'https://gisportal.ers.usda.gov/server/rest/services/Atlas_Reference_Data/Reference_Labels/MapServer/1',
style: function(feature) {
  return {
    color: '#000', 
    weight: 1,  
    opacity: 1,  
    fill: false, 
  }
}
}).addTo(map);

// Adding the tile layer
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: '© <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors'
}).addTo(map);
  