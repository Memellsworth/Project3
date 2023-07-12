const length = document.querySelector(".length");

let otherCity = 'Houston';

function addMarkerToMap(cityACoordinates, cityBCoordinates) {
  const from = L.latLng(cityACoordinates[1], cityACoordinates[0]);
  const to = L.latLng(cityBCoordinates[1], cityBCoordinates[0]);

  // in miles
  const distance = from.distanceTo(to) / 1609.34; // Conversion from meters to miles

  const distanceInMiles = distance.toFixed(5);
  length.textContent = `Length (in miles): ${distanceInMiles}`;
}


window.addEventListener("DOMContentLoaded", function () {
  // Input fields for city A and city B with IDs "cityA" and "cityB"
  const cityAInput = document.querySelector("#cityA");
  const cityBInput = document.querySelector("#cityB");

  // Button to trigger the calculation
  const calculateButton = document.querySelector(".calculate-distance");

  calculateButton.addEventListener("click", () => {
    const cityACoordinates = getCoordinates(cityAInput.value);
    const cityBCoordinates = getCoordinates(cityBInput.value);

    if (cityACoordinates && cityBCoordinates) {
      addMarkerToMap(cityACoordinates, cityBCoordinates);
    } else {
      // Handle error: Invalid input or coordinates not found
      length.textContent = "Error: Invalid input or coordinates not found";
    }
  });
});

function getCoordinates(city) {
  // process to 
  return null;
}
