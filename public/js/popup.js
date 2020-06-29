//para utilizar este script, en el marcado deben introducirse las id iguales
var btnOpenPopup = document.getElementById('openPopup');
	btnClosePopup = document.getElementById('closePopup');
	overlay = document.getElementById('overlay');
	popup = document.getElementById('popup');

btnOpenPopup.addEventListener('click', function(){
	overlay.classList.add('active');
	popup.classList.add('active');
});

btnClosePopup.addEventListener('click', function(e){
	e.preventDefault();
	overlay.classList.remove('active');
	popup.classList.remove('active');
});


