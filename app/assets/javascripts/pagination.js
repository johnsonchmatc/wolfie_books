(function($) {
  var currentPage = 0;

  function loadData(data) {
    $('#projects').append(Handlebars.compile("{{#projects}} \
      <tr class='ad'> \
        <td><a href='/projects/{{id}}'>{{title}}</a></td> \
        <td><a href='/projects/{{id}}'>{{start_date}}/{{end_date}}</a></td> \
        <td><a href='/projects/{{id}}'>{{client.name}}</a></td> \
        </tr>{{/projects}}")({ projects: data }));
    if (data.length == 0) $('#next_page_spinner').hide();
  }

  function nextPageWithJSON() {
    currentPage += 1;
    var newURL = '/projects.json?page=' + currentPage;

    var splitHref = document.URL.split('?');
    var parameters = splitHref[1];
    if (parameters) {
      parameters = parameters.replace(/[?&]page=[^&]*/, '');
      newURL += '&' + parameters;
    }
    return newURL;
  }

  var loadingPage = 0;
  function getNextPage() {
    if (loadingPage != 0) return;

    loadingPage++;
    $.getJSON(nextPageWithJSON(), {}, updateContent).
      complete(function() { loadingPage-- });
  }

  function updateContent(response) {
    loadData(response);
  }

  function readyForNextPage() {
    if (!$('#next_page_spinner').is(':visible')) return;

    var threshold = 200;
    var bottomPosition = $(window).scrollTop() + $(window).height();
    var distanceFromBottom = $(document).height() - bottomPosition;

    return distanceFromBottom <= threshold;
  }

  function observeScroll(event) {
    console.log("observeScroll");
    if (readyForNextPage()) getNextPage();
  }

  $(document).scroll(observeScroll);

  getNextPage();
})(jQuery);