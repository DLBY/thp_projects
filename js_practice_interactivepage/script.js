// Fonctionnalité 1 :
// On commence par un petit échauffement : lorsque l'utilisateur va cliquer sur le footer (portant le tag <footer>), tu vas afficher le mot "clique" en console.

//Fonctionnalité 1 + 1 bis

function countFooter(){
  let footer = document.querySelector("footer");
  let x = 1
  footer.addEventListener("click", function(){ 
    console.log(`clique numéro ${x}`);
    x++;
  })};
  countFooter();

//Fonctionnalité 2 :

function burgerMenu () {
let btn = document.querySelector(".navbar-toggler");
let navEl= document.querySelector("#navbarHeader")

btn = btn.addEventListener("click", function(){
  navEl.classList.toggle("collapse");
})
};

burgerMenu();

//Fonctionnalité 3 :
function redText(){
  let btnEdit  = document.querySelectorAll(".btn-outline-secondary")[0];
  let cardEdit = document.querySelectorAll(".card-text")[0]
  btnEdit.addEventListener("click", function(){
    if (cardEdit.style.color === 'red') {
      cardEdit.style.color = 'black'
    } else {
      cardEdit.style.color = 'red'
    }
  })};
 redText();

 //Fonctionnalité 4 :

 function greenText(){
  let textCard = document.querySelectorAll('.card-text')[1]
  let btnEdit  = document.querySelectorAll(".btn-outline-secondary")[1]
  btnEdit.addEventListener("click", function(){
    if (textCard.style.color === 'green') {
      textCard.style.color = 'black'
    } else {
      textCard.style.color = 'green'
    }
  })};
 greenText();

//Fonctionnalité 5 :

function noBoot() {
  let navbar = document.querySelector('header')
  let link = document.querySelector("head > link")
  navbar.addEventListener('dblclick', function() {
    if(link.disabled === false) {
  link.disabled = true;
} else {
  link.disabled = false;
}})};
noBoot();

//Fonctionnalité 6 :

function removeCard() {
  let btnView = document.querySelectorAll('.btn-success');
  let image = document.querySelectorAll('.card-img-top');
  let text = document.querySelectorAll('.card-text');
  for (let i = 0; i < btnView.length ; i++)
  btnView[i].addEventListener('mouseover', function(){
    if(text[i].style.visibility !== "hidden") {
    image[i].style.width = "20%";
    text[i].style.visibility = 'hidden';
  } else {
    image[i].style.width = "";
    text[i].style.visibility = 'visible';
  };
  })};
removeCard()

//Fonctionnalité 7 :
var lastCard = document.querySelector('.row').length -1
function wtf(){
  let btnArrow = document.querySelector(".btn-secondary");
  // Obtient une référence à l'élément parent
  let parent = document.querySelectorAll('.row')[1];
  btnArrow.addEventListener("click", function(){
    let cardMove = document.querySelectorAll('.col-md-4')[5]
    parent.prepend(cardMove);
  })
  
};
wtf()

// Fonctionnalité 8 :

function wtfReverse(){
  let btnArrowLeft = document.querySelector(".btn-primary");
  let parent = document.querySelectorAll('.row')[1];
  btnArrowLeft.addEventListener("click", function(e){
    e.preventDefault()
    let cardMove = document.querySelectorAll('.col-md-4')[0]
    parent.append(cardMove);
  })
};
wtfReverse()

// Fonctionnalité 9 :

function movePage(){
  logo = document.querySelector("body > header > div.navbar.navbar-dark.bg-dark.box-shadow > div > a");
 
    logo.addEventListener('keydown', event => {
      if (event.keyCode === 65) { // A 
        document.querySelector('body').className="body col-4";
      } else if(event.keyCode === 89 ) { // Y
        document.querySelector('body').className="body col-4 offset-md-4";
      } else if (event.keyCode === 80) { // P
        document.querySelector('body').className="body col-4 offset-md-8";
      } else if (event.keyCode === 66) { // B
        document.querySelector('body').className="body";
      };      
    }) 
};
movePage()