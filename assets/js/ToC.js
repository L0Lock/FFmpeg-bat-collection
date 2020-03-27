$(document).ready(function() {
  var ToC =
    "<nav role='navigation' class='table-of-contents'>" +
      "<h2>Jump to file description:</h2>" +
      "<ul>";

  var newLine, el, title, link;

  $("main h4").each(function() {

    el = $(this);
    title = el.text();
    link = "#" + el.attr("id");

    newLine =
      "<li>" +
        "<a href='" + link + "'>" +
          title +
        "</a>" +
      "</li>";

    ToC += newLine;

  });

  ToC +=
     "</ul>" +
    "</nav>";

  $(".file-descriptions").prepend(ToC);

});