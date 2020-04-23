var btnOpenPopup = document.getElementById('openForm');
    btnClosePopup = document.getElementById('closeForm');
    overlay = document.getElementById('contacto');
    popup = document.getElementById('formContacto');

btnOpenPopup.addEventListener('click', function(){
    overlay.classList.add('active');
    popup.classList.add('active');
});

btnClosePopup.addEventListener('click', function(e){
    e.preventDefault();
    overlay.classList.remove('active');
    popup.classList.remove('active');
});