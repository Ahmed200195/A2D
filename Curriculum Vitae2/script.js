const menu = document.getElementById("menu");
const header = document.getElementsByTagName("header")[0];
let mytop = document.getElementById("top");
function toggleIcone(){
    menu.classList.toggle("fa-times");
    header.classList.toggle("headerToggle");
}
function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
      mytop.style.display = "block";
    } else {
      mytop.style.display = "none";
    }
  }
window.onscroll = function(){
    scrollFunction();
    menu.classList.remove("fa-times");
    header.classList.remove("headerToggle");
}