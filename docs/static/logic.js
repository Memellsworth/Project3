document.addEventListener("DOMContentLoaded", function() {
    // Creating the map object centered in houston
    let map = L.map("map", {
      center: [29.749907, -95.358421],
      zoom: 7.5
    });
  
    // Adding the tile layer
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '© <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors'
    }).addTo(map);



    
});

