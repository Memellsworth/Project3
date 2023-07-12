function checkDocumentCounts() {
    // Send AJAX request to Flask API endpoint
    $.ajax({
      url: '/api/document_counts',
      method: 'GET',
      success: function(response) {
        // Handle the retrieved document counts
        displayDocumentCounts(response);
      },
      error: function(error) {
        console.log('Error:', error);
      }
    });
  }
  
  function displayDocumentCounts(counts) {
    // Display the document counts in the placeholder element
    var countsElement = document.getElementById('counts');
    countsElement.innerHTML = '';
  
    Object.entries(counts).forEach(function([collection, count]) {
      var countText = `Documents in ${collection}: ${count}`;
      var countNode = document.createElement('p');
      countNode.textContent = countText;
      countsElement.appendChild(countNode);
    });
  }
  