import "bootstrap";

function openNav() {
  document.getElementById("mySidebar").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
  document.getElementById("mySidebar").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
}

// document.addEventListener("DOMContentLoaded", function(){
//   const addButtons = document.querySelectorAll(".btn-counter-add");

//   addButtons.forEach(function(button) {
//     button.addEventListener("click", (event) => {
//       const url = event.target.dataset["url"];
//       Rails.ajax({ url: url, type: "PATCH" });
//     });
//   });
// });

