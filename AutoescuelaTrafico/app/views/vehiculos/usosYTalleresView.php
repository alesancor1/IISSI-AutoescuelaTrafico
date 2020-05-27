<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Usos y talleres</title>
		<link rel="stylesheet" href="./css/tables.css">
		<style>
			/* TABS */
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

			ul.tabs .active {
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
		<div class="contenido" id="contenido">

			<ul class="tabs">

				<li>
					<a href="#tab1"><span class="tab-text">Usos</span></a>
				</li>

				<li>
					<a href="#tab2"><span class="tab-text">Talleres SIN HACER</span></a>
				</li>

			</ul>

			<div class="secciones">
				<article id="tab1">
					<h1>Usos de vehículos</h1>

					<table>
						<tr>
							<th>Alumno</th>
							<th>Vehículos usados</th>
						</tr>

						<?php
						foreach ($usosPorAlumno as $key => $usos) {
							echo "<tr>";
							echo "<td>" . $key . "</td>";
							echo "<td>";
							foreach ($usos as $uso) {
								echo $uso -> MODELO . ", " . $uso -> MATRICULA . "<br>";
							}
							echo "</td>";
							echo "</tr>";
						}
						?>
					</table>
				</article>

				<article id="tab2">
					<h1>Talleres SIN HACER</h1>
					<p>
						Texto de prueba
					</p>
				</article>
			</div>

		</div>

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

		<!-- Tabs -->
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

	</body>
</html>