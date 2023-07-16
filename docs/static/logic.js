d3.tsv("./airlines.tsv").then(function(data) {
  // Create dropdown options
  let dropdown = d3.select("#airlines-dropdown");
  dropdown.selectAll("option")
    .data(data)
    .enter()
    .append("option")
    .text(d => d.name)
    .attr("value", d => d.name);

  // Show data for the first airline initially
  showData(data[0]);

  // Update data when a different option is selected
  dropdown.on("change", function() {
    let selectedName = this.value;
    let selectedData = data.find(d => d.name === selectedName);
    showData(selectedData);
  });
});

// Function to show data for a given airline
function showData(airline) {
  d3.select("#airline-logo").attr("src", airline.logo_url);
  d3.select("#other-data").html(`Headquarter: ${airline.headquarter}<br> Hub 1: ${airline.hub1}<br> Hub 2: ${airline.hub2}`);
}
