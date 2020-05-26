<!DOCTYPE html>
<html>
	<title>Anuncios</title>

	<head>
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
				padding-left: 1%;
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
					<a href="#tab1"><span class="tab-text">Inicio</span></a>
				</li>
				<li>
					<a href="#tab2"><span class="tab-text">Nosotros</span></a>
				</li>
				<li>
					<a href="#tab3"><span class="tab-text">Servicios</span></a
				</li>
				<li>
					<a href="#tab4"><span class="tab-text">Blog</span></a>
				</li>
			</ul>

			<div class="secciones">
				<article id="tab1">
					<h1>Inicio</h1>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ea numquam odio voluptate. Aliquam incidunt similique, et quasi ducimus quos aut autem non dignissimos dicta sit provident, voluptatibus ut blanditiis perspiciatis cum, vel temporibus minima enim. Asperiores omnis placeat officiis a tenetur sit recusandae, reprehenderit neque. Tempora quibusdam, perferendis id ratione culpa dolorum! Nemo, animi? Eveniet eaque perspiciatis, libero quia, pariatur iusto, ipsum porro quod, ut tempora cum quo non illum. Non eligendi incidunt sequi, molestias quia perspiciatis architecto repudiandae quod.
					</p>
				</article>
				<article id="tab2">
					<h1>Nosotros</h1>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel voluptates unde, consequuntur aliquid architecto rem numquam expedita minima dolorem pariatur recusandae, eius quod quia aspernatur id impedit, tenetur! Aspernatur incidunt molestiae dolores animi ea praesentium ipsam tenetur voluptas cupiditate perspiciatis eum nihil, natus exercitationem libero earum fuga dignissimos impedit numquam, quasi, placeat officiis voluptates, ad reprehenderit fugiat? Fugiat aperiam et magni, molestiae, numquam consectetur vitae sapiente cupiditate totam laboriosam voluptate obcaecati, aliquam placeat? Suscipit dolores fuga laudantium sed, qui magni iusto dolore quia. Quis fugit exercitationem porro. Rerum nihil omnis recusandae ratione fuga alias eligendi, earum sunt veritatis praesentium eum perspiciatis. Molestias deserunt, iure neque animi quod! Impedit reprehenderit cumque, numquam velit quae cum eius quidem similique laudantium hic deleniti!
					</p>
				</article>
				<article id="tab3">
					<h1>Servicios</h1>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ea numquam odio voluptate. Aliquam incidunt similique, et quasi ducimus quos aut autem non dignissimos dicta sit provident, voluptatibus ut blanditiis perspiciatis cum, vel temporibus minima enim. Asperiores omnis placeat officiis a tenetur sit recusandae, reprehenderit neque. Tempora quibusdam, perferendis id ratione culpa dolorum! Nemo, animi?
					</p>
					<br>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatum dignissimos at esse, ipsum rerum assumenda nisi obcaecati! Aliquam iure voluptatem incidunt, explicabo sit labore, perferendis eius ad vel quia. Praesentium, doloribus. Quisquam provident nostrum totam itaque debitis, minima, tempore dolores!
					</p>
				</article>
				<article id="tab4">
					<h1>Blog</h1>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ea numquam odio voluptate. Aliquam incidunt similique, et quasi ducimus quos aut autem non dignissimos dicta sit provident, voluptatibus ut blanditiis perspiciatis cum, vel temporibus minima enim. Asperiores omnis placeat officiis a tenetur sit recusandae, reprehenderit neque. Tempora quibusdam, perferendis id ratione culpa dolorum! Nemo, animi? Eveniet eaque perspiciatis, libero quia, pariatur iusto, ipsum porro quod, ut tempora cum quo non illum. Non eligendi incidunt sequi, molestias quia perspiciatis architecto repudiandae quod.
					</p>
					<br>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam ipsa ducimus amet at cumque sed numquam, explicabo impedit optio quas iste aperiam quidem ipsam rerum libero voluptatibus perferendis officiis voluptatum!
					</p>
				</article>
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