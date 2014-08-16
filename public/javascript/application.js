$(document).ready(function() {

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});

$('a.nice-link').each(function () {
  $(this).attr('data-text', $(this).text());
});