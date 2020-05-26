<!DOCTYPE html>
<html>
	<title>Anuncios</title>

	<head>
		<link rel="stylesheet" href="./css/tables.css">
		<style>
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
					<a href="#tab1"><span class="tab-text">Horario</span></a>
				</li>
				<li>
					<a href="#tab2"><span class="tab-text">Gestión</span></a>
				</li>
			</ul>

			<div class="secciones">
				
				<?php 
					//	Comprobamos que este setteada la variable
					//	para generar el html
				?>
				
				<article id="tab1">
					<h1>HORARIO</h1>
					<p>
						AQUI IRIA EL HORARIO
					</p>
				</article>
				
				<?php 
					if(isset($gestionClases)){ 
						//print_r($gestionClases); ?>
					<article id="tab2">
						<h1>GESTION CLASES</h1>
						<table>
							<tr>
								<th>Alumno</th>
								<th>Días sin dar clase</th>
								<th>Última clase</th>
								<th>Profesor</th>
							</tr>
						
						<?php foreach($gestionClases as $num=>$row){
							echo "<tr>";
							echo "<td>" . $row->ALUMNO . "</td>";
							echo "<td>" . $row->DIASSINCLASE . "</td>";
							echo "<td>" . $row->FECHAULTIMACLASE . "</td>";
							echo "<td>" . $row->PROFESOR . "</td>";
							echo "</tr>";
						} ?>
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

	</body>

</html>