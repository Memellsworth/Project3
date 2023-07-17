d3.csv("./flaskapp/data/carrier_key_table.csv").then(function(data) {
  // Create dropdown options
  let dropdown = d3.select("#airlines-dropdown");
  dropdown.selectAll("option")
    .data(data)
    .enter()
    .append("option")
    .text(d => d['Airline Carrier'])
    .attr("value", d => d['Airline Carrier']);

  // Show data for the first airline initially
  showData(data[0]);

  // Update data when a different option is selected
  dropdown.on("change", function() {
    let selectedName = this.value;
    let selectedData = data.find(d => d['Airline Carrier'] === selectedName);
    showData(selectedData);
  });
});

// Function to show data for a given airline
function showData(data) {
  d3.select("#airline-logo").attr("src", data['Logo']);
  d3.select("#other-data").html(`Headquarter: ${data['Headquarter City']}<br> Nearest Hub Airport Code: ${data['Nearest Base']}<br> Hub City: ${data['Nearest Base City']}`);
}
