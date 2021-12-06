( function () {
  function getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split('&');
    for (var i = 0; i < vars.length; i ++) {
      var pair = vars[i].split('=');
      if (pair[0] === variable) {
        return decodeURIComponent(pair[ 1 ].replace(/\+/g, '%20'));
      }
    }
  }
  var searchTerm = getQueryVariable('query');
  if (searchTerm) {
    document.getElementById('search-box').setAttribute("value", searchTerm);
    // Initalize lunr with the fields it will be searching on. I've given title
    // a boost of 10 to indicate matches on this field are more important.
    var idx = lunr( function () {
      this.field('id');
      this.field('title2', { boost: 10 });
      this.field('sub_title');
      this.field('label', { boost: 5 });
      this.field('excerpt');
      // Add data to lunr
      for (var key in window.store) {
        this.add({
          'id': key,
          'title2': window.store[key].title2,
          'sub_title': window.store[key].sub_title,
          'label': window.store[key].label,
          'excerpt': window.store[key].excerpt
        });
      }
    });
    var results = idx.search(searchTerm); // Get lunr to perform a search
    displaySearchResults(results, window.store); // We'll write this in the next section
  }
  
  function displaySearchResults(results, store) {
    var searchResults = document.getElementById('levels-page-card-container');
    if (results.length) { // Are there any results?
      var appendString = '';
    for (var i = 0 ; i < results.length; i ++) { // Iterate over the results
    var item = store[results[i].ref];
        //appendString += '<li><a href=" ' + item.url + ' "><h3> ' + item.title + ' </h3></a> ';
        //appendString += '<p>' + item.content.substring(0,150) + ' ...</p></li> ';
        appendString += '<div class="levels-page-card levels-page-card-three-columns" onclick="location.href=' + item.url +'/;"><div class="levels-page-card-icon"><a href=" ' +item.url + '/"><i class = " ' + item.icon + ' icon"></i></a></div><div class="levels-page-card-description"><h3 class="levels-page-card-title"><a href= " '+ item.url + '/">' + item.title2 + '</a></h3><sub class="levels-page-card-sub"><i>' + item.sub_title + '</i></sub><p>This is a description of this article. When available, this message would change</p></div></div>';
      }
      searchResults.innerHTML = appendString;
    } else {
      searchResults.innerHTML = '<li>No results found</li>';
    }
  }
  
})();