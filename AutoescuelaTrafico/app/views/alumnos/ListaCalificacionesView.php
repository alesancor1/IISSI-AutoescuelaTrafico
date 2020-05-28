<!DOCTYPE html>
<!DOCTYPE html>
<html>
	<title>Lista Calificaciones</title>

	<head>
		<link rel="stylesheet" href="./css/tables.css">
		<style>
			/* ACORDEON */
			.accordionContent {
				background-color: #87B9C7;
				color: #fff;
				cursor: pointer;
				padding: 18px;
				width: 100%;
				border: none;
				text-align: left;
				outline: none;
				font-size: 15px;
				transition: 0.4s;
			}

			.accordionContent .active, .accordionContent:hover {
				background-color: #037FB2;
			}

			.panel {
				padding: 0 18px;
				background-color: white;
				max-height: 0;
				overflow: hidden;
				transition: max-height 0.2s ease-out;
			}

			* {
				margin: 0;
				padding: 0;
				-webkit-box-sizing: border-box;
				-moz-box-sizing: border-box;
				box-sizing: border-box;
			}

			body {
				background: #D4D4D4;
				font-family: 'Open sans';
			}

			ul.tabs {
				width: 100%;
				background: #87B9C7;
				list-style: none;
				display: flex;
			}

			ul.tabs li {
				width: 18%;
			}

			ul.tabs li a {
				color: #fff;
				text-decoration: none;
				font-size: 16px;
				text-align: center;
				display: block;
				padding: 20px 0px;
			}

			.active {
				background: #037FB2;
			}

			ul.tabs li a .tab-text {
				margin-left: 8px;
			}

			.secciones {
				width: 100%;
				height: 100vh;
				background: #fff;
			}

			.secciones article {
				padding: 30px;
			}

			.secciones article p {
				text-align: justify;
			}

			@media screen and (max-width: 700px) {
				ul.tabs li {
					width: none;
					flex-basis: 0;
					flex-grow: 1;
				}
			}

			@media screen and (max-width: 450px) {
				ul.tabs li a {
					padding: 15px 0px;
				}

				ul.tabs li a .tab-text {
					display: none;
				}

				.secciones article {
					padding: 20px;
				}
			}
		</style>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	</head>
	<body>
		<div class ="contenido" id ="contenido">
			<ul class="tabs">

				<li>
					<a href="#tab1"><span class="tab-text">Alumnos</span></a>
				</li>
				<li>
					<a href="#tab2"><span class="tab-text">Último examen</span></a>
				</li>
			</ul>

			<div class="secciones">

				<?php
				//	Comprobamos que este setteada la variable
				//	para generar el html
				?>

				<article id="tab1">
					<h1>CALIFICACIONES DE LOS ALUMNOS</h1>
					<?php
					foreach ($resultado as $alumno => $examenes) {
						echo "<button class='accordionContent'>" . $alumno . "</button>";
						echo "<div class='panel'>";
						foreach ($examenes as $num => $examen) {
							echo "<p>Tipo: " . $examen -> TIPO . "</p>";
							echo "<p>Fecha: " . $examen -> FECHA . "</p>";
							echo "<p>Calificación: " . $examen -> CALIFICACION . "</p>";
							echo "----------------------------------------------------";
						}
						echo "</div>";
					}
					?>
				</article>

				<?php
				// print_r($resultado2);
				if(isset($resultado2)){
				//print_r($resultados2); ?>
				<article id="tab2">
					<h1>Último examen</h1>
					<table>
						<tr>
							<th>Apellidos</th>
							<th>Nombre</th>
							<th>Fecha</th>
							<th>Tipo</th>
							<th>Calificacion</th>
						</tr>

						<?php
						foreach ($resultado2 as $alumno => $examen) {
							echo "<tr>";
							echo "<td>" . $examen -> APELLIDOS . "</td>";
							echo "<td>" . $examen -> NOMBRE . "</td>";
							echo "<td>" . $examen -> FECHA . "</td>";
							echo "<td>" . $examen -> TIPO . "</td>";
							echo "<td>" . $examen -> CALIFICACION . "</td>";
							echo "</tr>";
						}
						?>
					</table>
				</article>
				<?php } ?>

			</div>
		</div>

		<script>
			$('ul.tabs li a:first').addClass('active');
			$('.secciones article').hide();
			$('.secciones article:first').show();

			$('ul.tabs li a').click(function() {
				$('ul.tabs li a').removeClass('active');
				$(this).addClass('active');
				$('.secciones article').hide();

				var activeTab = $(this).attr('href');
				$(activeTab).show();
				return false;
			});
		</script>

		<!-- Acordeon -->
		<script>
			var acc = document.getElementsByClassName("accordionContent");
			var i;

			for ( i = 0; i < acc.length; i++) {
				acc[i].addEventListener("click", function() {
					this.classList.toggle("active");
					var panel = this.nextElementSibling;
					if (panel.style.maxHeight) {
						panel.style.maxHeight = null;
					} else {
						panel.style.maxHeight = panel.scrollHeight + "px";
					}
				});
			}
		</script>

	</body>

</html>

<!-- <html>
<head>
<title>Lista Calificaciones</title>
</head>
<body>
<div class="contenido" id="contenido">
<h1>CALIFICACIONES DE ALUMNOS</h1>
<?php
// foreach ($listaAlumnos as $num => $alumno) {
// echo "<br>";
// print_r($alumno -> getNombre());
// echo "<br>";
// foreach ($resultado[$alumno -> getNombre() . " " . $alumno -> getApellidos()] as $num => $dentro) {
// echo "<br>";
// print_r($dentro);
// }
// }

echo "<br>";
echo "<br>";
echo "<br>";
print_r($resultado2);

?>
</div>
</body>
</html> -->