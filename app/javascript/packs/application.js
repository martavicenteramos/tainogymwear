import algoliasearch from "algoliasearch";
import "bootstrap";

var client = algoliasearch('IBVWT5Z8Y5', '92014f06c232528778ca6dea55cfb907');
var index = client.initIndex('Product');

document.addEventListener("DOMContentLoaded", () => {
  const searchBar = document.getElementById('algolia-search');

  searchBar.addEventListener("keyup", () => {
    index.search({
      query: searchBar.value,

    }).then(({ hits }) => {
      const ids = hits.map(product => product.objectID);

      Rails.ajax({
        url: `/products/search_results?ids=${ids.join(',')}`,
        type: 'GET',
      })
      //window.location.reload(`/products/`)
    });
  });
});

// document.addEventListener("DOMContentLoaded", function(){
//   const addButtons = document.querySelectorAll(".btn-counter-add");

//   addButtons.forEach(function(button) {
//     button.addEventListener("click", (event) => {
//       const url = event.target.dataset["url"];
//       Rails.ajax({ url: url, type: "PATCH" });
//     });
//   });
// });
