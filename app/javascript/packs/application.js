import algoliasearch from "algoliasearch";
import "bootstrap";

var client = algoliasearch('IBVWT5Z8Y5', 'cf50e0757b779100f4ea1e8822f923f5');
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


const sizes = document.querySelectorAll('.size');
const loadingSign = '<div class="spinner-border" role="status" style="width:20px; height:20px;"></div>';
const check = '<i class="fas fa-check"></i>';

Array.from(sizes).forEach(size => {
  const sizeText = size.innerHTML;

  size.addEventListener('ajax:success', async function(event) {
    size.innerHTML = check;

    // setTimeout(() => {
    //   size.innerHTML = sizeText;
    // }, 2000)
  });

  size.addEventListener('ajax:beforeSend', async function() {
    size.innerHTML = loadingSign;
  });
});

//rafas
//application_id: 'IBVWT5Z8Y5',
//api_key: 'cf50e0757b779100f4ea1e8822f923f5'
//leos
//'9S8X4M6OGV', 'c4250c1e9bd4adf63c9b8a8867df959f


// document.addEventListener("DOMContentLoaded", function(){
//   const addButtons = document.querySelectorAll(".btn-counter-add");

//   addButtons.forEach(function(button) {
//     button.addEventListener("click", (event) => {
//       const url = event.target.dataset["url"];
//       Rails.ajax({ url: url, type: "PATCH" });
//     });
//   });
// });
