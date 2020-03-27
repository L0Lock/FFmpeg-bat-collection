$(document).ready(function() {
  var ToC =
    "<a href"#" class='active'>" +
    "<nav role='navigation' id='table-of-contents'>" +
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
    "</nav>"
    "<a href='javascript:void(0);' class='icon' onclick='myfunction()'>&#9776;</a>";

  $(".file-descriptions").prepend(ToC);

});

/* Toggle between showing and hiding the navigation menu links when the user clicks on the hamburger menu / bar icon */
function myFunction() {
  var x = document.getElementById("table-of-contents");
  if (x.style.display === "block") {
    x.style.display = "none";
  } else {
    x.style.display = "block";
  }
} 