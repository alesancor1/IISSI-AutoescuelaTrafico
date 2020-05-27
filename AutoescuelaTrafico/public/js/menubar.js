/*acordeones desplegables*/
			$(document).ready(function() {
				$(".siderbar_menu li").click(function() {
					var width = getComputedStyle(document.getElementById("mySidebar")).width;
					var arrows = document.getElementsByClassName("arrow");
					if(width.localeCompare("50px")==0){
						document.getElementById("toggleButtonArrow").className = "fas fa-chevron-left";
						document.getElementById("mySidebar").style.width = "250px";
						document.getElementById("toggleButton").style.left = "250px";
						for(var i = 0; i<arrows.length; i++)
							arrows[i].style.cssText = "visibility: visible; transition: all 0.3s ease;";
						if(window.innerWidth>=700)
							document.getElementById("contenido").style.marginLeft = "260px";
					}
					$(".siderbar_menu li").removeClass("active");
					$(this).addClass("active");
				});
			});

			/*boton de abrir/cerrar*/
			function toggleNav(x){
				document.getElementById("contenido").style.transition = "0.3s ease all";

				var width = getComputedStyle(document.getElementById("mySidebar")).width;
				var arrows = document.getElementsByClassName("arrow");
				if(width.localeCompare("50px")==0){
					document.getElementById("toggleButtonArrow").className = "fas fa-chevron-left";
					document.getElementById("mySidebar").style.width = "250px";
					document.getElementById("toggleButton").style.left = "250px";
					for(var i = 0; i<arrows.length; i++)
						arrows[i].style.cssText = "visibility: visible; transition: all 0.3s ease;";
					if(window.innerWidth>=700)
						document.getElementById("contenido").style.marginLeft = "260px";
				}
				else{
					$(".siderbar_menu li").removeClass("active");
					document.getElementById("toggleButtonArrow").className = "fas fa-chevron-right";
					document.getElementById("mySidebar").style.width = "50px";
					document.getElementById("toggleButton").style.left = "50px";
					for(var i = 0; i<arrows.length; i++)
						arrows[i].style.cssText  = "visibility: hidden; transition: none;";
					document.getElementById("contenido").style.marginLeft = "60px";
					}
				}