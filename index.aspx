<%@ Page Language="VB" ValidateRequest="false" AutoEventWireup="false" CodeFile="index.aspx.vb" Inherits="_Default" Debug ="True"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="//www.w3.org/1999/xhtml">

<head runat="server">
	<title>damla sözlük</title>
	<link rel='icon' type='image/png' href='img/logo.png'>
	<meta name="Description" content="Türkiye'nin ilk ve tek canlı sözlük sitesi">
	<meta name="Keywords" content="damla sözlük, sözlük sitesi">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="content-type" content="text/html; charset=UTF8">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

	<!-- Open Graph data -->
	<meta property="og:title" content="Türkiye'nin ilk ve tek canlı sözlük sitesi"/>
	<meta property="og:type" content="Website"/>
	<meta property="og:image" content="http://damlasozluk.com/img/social.jpg" />
	<meta property="og:site_name" content="damla sozluk" />
	<meta property="og:description" content="Yeni ve capcanlı. Siyasetten bilime, eğitimden sağlığa her konuda bilgi paylaşımı yapabilirsiniz" />
	<meta property="fb:app_id" content="1621636228080390" />
	<meta property="og:url" content="http://damlasozluk.com" />

	<!-- Update your html tag to include the itemscope and itemtype attributes. -->
	<html itemscope itemtype="http://schema.org/Article">

	<!-- Schema.org markup for Google+ -->
	<meta itemprop="name" content="Türkiye'nin ilk ve tek canlı sözlük sitesi">
	<meta itemprop="description" content="damla sozluk">
	<meta itemprop="image" content="http://damlasozluk.com/img/social.jpg">

	<!-- Twitter Card data -->
	<meta name="twitter:card" content="summary">
	<meta name="twitter:site" content="@fatih_rehberlik">
	<meta name="twitter:title" content="Türkiye'nin ilk ve tek canlı sözlük sitesi">
	<meta name="twitter:description" content="damla sozluk">
	<meta name="twitter:creator" content="@fatih_rehberlik">
	<!-- Twitter summary card with large image must be at least 280x150px -->
	<meta name="twitter:image:src" content="http://damlasozluk.com/img/social.jpg">
	<meta name="twitter:domain" content="damlasozluk.com">
		
	<!-- Bootstrap -->
	<link rel="stylesheet" href="css/bootswatch-paper.css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	
	<!-- animation -->
	<link rel="stylesheet" href="css/animation.css">
	
	<!-- tinysort -->
	<script src="js/tinysort/tinysort.min.js"></script>
		
	<!-- norifyjs -->
	<script src="plugins/bootstrap-notify/bootstrap-notify.js"></script>
		
	<!-- sweetalert2 -->
	<script src="plugins/sweetalert2/sweetalert2.min.js"></script>
	<link rel="stylesheet" type="text/css" href="plugins/sweetalert2/sweetalert2.min.css">

	<!-- Font Awesome -->
	<script src="https://use.fontawesome.com/b04ce120e0.js"></script>

	<!-- Firebase Temel -->
	<script src="https://www.gstatic.com/firebasejs/live/3.0/firebase.js"></script>

	<!-- Firebase Extra (Üye girişleri için) -->
	<script src="https://www.gstatic.com/firebasejs/3.0.5/firebase.js"></script>
	<script src="https://www.gstatic.com/firebasejs/3.0.5/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/3.0.5/firebase-auth.js"></script>
	<script src="https://www.gstatic.com/firebasejs/3.0.5/firebase-database.js"></script>

	<script>
		
		$(window).load(function() {
			$(".animation").fadeOut(2000, function() {
				$(".page").fadeIn(1000);  				
			});
		});

		</script>
		
	<script src="js/config.js"></script>
		
</head>

	
<body class="container-fluid" style="height:100hv;overflow-x:hidden;" runat="server">
		
<div id="cssload-pgloading" class="animation" style="z-index: 9999; position:absolute; left:40%; top:40%;">
	<div class="cssload-loadingwrap">
		<ul class="cssload-bokeh">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
</div>
	
	<div class="page" style="display:none;">

	<div id="divlog" style="position:absolute;left:0px;bottom:0px;font-size:small;" class="editor alert alert-info"></div>

	<ul id="tabs" class="nav nav-tabs" role="tablist" style="margin-top:17px;margin-bottom:14px;">

		<li role="presentation" class="hidden-md hidden-lg">
			<a id="buttonpopulermobil" href="#tabpopulermobil" aria-controls="home" role="tab" data-toggle="tab"><i class="fa fa-fire" aria-hidden="true" style="color:#77B3D4;"></i> Popüler
			</a>
		</li>
		<li role="presentation">
			<a id="desktopicerikbutton" href="#tabicerik" aria-controls="home" role="tab" data-toggle="tab">
			<i class="fa fa-tint" aria-hidden="true" style="color:#77B3D4;"></i> sözlük
			</a>
		</li>
		
		<li role="presentation" class="pull-right">
			<a id="girisyap" class="girisdugmeleri" onclick="window.location='giris.htm'" aria-controls="giris" role="tab" data-toggle="tab">
					giriş
					<span class="fa fa-facebook" aria-hidden="true"></span> 
					<span class="fa fa-google-plus" aria-hidden="true"></span>
				</a>
		</li>		

		<li role="presentation">
			<a class="hesapdugmeleri" id="yenisayfa" onclick="$('a[href=#tabyenisayfa]').tab('show');" role="tab" data-toggle="tab">
				<span class="fa fa-plus" aria-hidden="true" style="color:#77B3D4;"></span> yeni
			</a>
		</li>
		
		<li role="presentation">
			<a class="hesapdugmeleri" id="yenisayfa" onclick="$('a[href=#tabsozlukscripti]').tab('show');" role="tab" data-toggle="tab">
				<span class="fa fa-download" aria-hidden="true" style="color:#77B3D4;"></span> indir
			</a>
		</li>
		
		<!-- (Tıklanabilsin diye) -->
		<li role="presentation" style="display:none;"><a href="#tabsozlukscripti" role="tab" data-toggle="tab">sözlük scripti</a></li>
		<li role="presentation" style="display:none;"><a href="#tabyenisayfa" role="tab" data-toggle="tab">yeni sayfa</a></li>
		<li role="presentation" style="display:none;"><a href="#tabayarlar" role="tab" data-toggle="tab">ayarlar</a></li>
		<li role="presentation" style="display:none;"><a href="#tabuyelik" class="girisdugmeleri" aria-controls="uyelik" role="tab" data-toggle="tab">üye ol</a></li>
		<!-- (Tıklanabilsin diye) -->

		
		<li id="hesapmenusu" runat="server" class="hesapdugmeleri dropdown pull-right">

			<a class="dropdown-toggle" data-toggle="dropdown" href="#">
				<span class="fa fa-user" aria-hidden="true" style="color:#77B3D4;"></span>
				<span class="caret"></span>
			</a>
			<ul class="dropdown-menu">
				<li><span id="labeluserid"></span></li>
				<li><a onclick="$('a[href=#tabayarlar]').tab('show');kullaniciozetigetir();"><i class="fa fa-wrench" aria-hidden="true"></i> ayarlar</a></li>
				<li class="hesapdugmeleri"><a onclick="cikisyap()"><i class="fa fa-sign-out" aria-hidden="true"></i> çıkış yap</a></li>
				<li><span id="uid" runat="server" style="font-size:9px;" class="editor"></span></li>
			</ul>
		</li>
		
		<li role="presentation" style="float:right;" class="hidden-sm hidden-xs">
			<div class='shareaholic-canvas' data-app='share_buttons' data-app-id='25367904'></div>
		</li>
		

		<form class="navbar-form navbar-right editor" role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Aramak istediğiniz kelimeyi girin..">
			</div>
			<button type="submit" class="btn btn-default">Ara</button>

		</form>

	</ul>

	<div id="icerik" class="col-md-3">
		<h4>
			<i class="fa fa-fire" aria-hidden="true" style="color:#77B3D4;"></i> popüler
		</h4>

		<div id="sayfalar" style="overflow-y:scroll;overflow-x: hidden;height:80vh;margin-left:-27px;padding-right:7px;">

		</div>


	</div>
		
	<!-- Nav tabs -->
	<div id="tabbolumler" class="tab-content col-md-7 col-sm-12">
		
		<div id="tabicerik" role="tabpanel" class="tab-pane active col-md-12" style="padding:0;">
			<div id="sayfayagit-timestamp" class="editor label label-success" style="float:right;">sayfayagit-timestamp</div>
			<div id="yorumpage" class="editor label label-danger" style="float:right;">yorumpage</div>
			<div id="sayfakey" class="editor label label-info" style="float:right;">sayfakey</div>
			<div id="bironcekisayfakey" class="editor label label-warning" style="float:right;">bironcekisayfakey</div>

				<div id="icerikbaslik">
					<span id="baslikyazisi" style="font-size:x-large;"></span>
					<span id="icerikbaslikekler" class="clearfix" style="float:right;">
						<span class="siteneekle"><a onclick="siteneekle()" class="btn btn-link"><i class="fa fa-code" aria-hidden="true" title="konuyu sitene ekle"></i></a></span>
						<span class="mevcutsayfayorumsayisi"></span>
						<span id="favs"></span>
					</span>
				</div>
			
			<hr style="color:#77B3D4;background-color:#77B3D4;">
			
			<div id="icerikgovde" style="overflow-y:scroll;height:66vh;font-size:15px;">
				<a id="oncekiyorumlarbutton" onclick="oncekilerigetir();">
					<i class="fa fa-angle-double-up" aria-hidden="true"></i> önceki yorumlar.. 
					<span id="oncekileryukleniyor" class="pull-right" style="margin-right:4px;"></span>
				</a>
				<div id="icerikyorumlar" style="overflow-x:hidden;"></div>
				
			</div>
			
			<hr style="color:#77B3D4;background-color:#77B3D4;">
			<div id="yaziekleri">
				<div class="input-group">
					<textarea id="yorum" class="form-control custom-control" rows="1" placeholder="yorum yaz.." autocorrect="on" maxlength="500"></textarea>
					<a id="buttonyorumyaz" class="input-group-addon btn btn-success" onclick="yorumyaz();">gönder</a>
				</div>
				<div id="mobilcanlibildirim"></div>
			</div>
			
			<br />

		</div>
		<!-- tabicerik -->


		<div role="tabpanel" class="tab-pane alert alert-default" id="tabyenisayfa">

			<h2>
				yeni içerik
			</h2>

			<input id="yenisayfabaslik" type="text" class="form-control" placeholder="konu başlığı" maxlength="144">

			<br />

			<textarea rows="9" id="yenisayfagovde" type="text" class="form-control" placeholder="detaylar.." maxlength="500"></textarea>

			<br />
			
			<a class="btn btn-info" onclick='yenisayfaac();'>oluştur</a>

		</div>
		<!-- tabyenisayfa -->


		<div role="tabpanel" class="tab-pane" id="tabuyelik">
			<h2 id="tabuyelikbaslik">
				 üye ol
			</h2>

			<div id="uyelikbaslangic" class="input-group">
				<input id="uyeliknick" type="text" class="form-control" placeholder="nick">
				<a id="a-nickkontrol" onclick="nickkontrol();" class="btn btn-info input-group-addon">kontrol et</a>
			</div>
			<div id="uyeliknickkontroldurum" style="float:right;"></div>

			<div id="uyelikdevam">
				<br /><input id="uyelikemail" runat="server" type="text" class="form-control" placeholder="email adresi">
				<br /><input id="uyelikpassword" type="password" class="form-control" placeholder="şifre">
				<br /><input id="uyelikpasswordtekrar" type="password" class="form-control" placeholder="şifre tekrar">
				<br /><a id="uyeliktamamla" onclick="uyelikolustur();" class="btn btn-info">üyelik Oluştur</a>
				<a href="#tabgiris" class="girisdugmeleri pull-right" aria-controls="giris" role="tab" data-toggle="tab">giriş yap</a>

			</div>


		</div>
		<!-- tabuyelik-->

		<div role="tabpanel" class="tab-pane" id="tabsozlukscripti">
			
		<div id="divgithub" class="alert alert-sm alert-default" style="color:black;">
			<h3>ücretsiz indir</h3>
			<hr>
			<li>en kaliteli ve dinamik sözlük scripti</li>
			<li>chat yaparmışçasına sözlük deneyimi</li>
			<li>otomatik güncellemeler</li>
			<li>canlı içerik</li>
			<li>https desteği</li>
			<li>vs vs..</li>
			<br />
			<a class="btn btn-default btn-lg" href="https://github.com/Mustayildiz/damlasozluk"><li class="fa fa-github"></li> indir</a>
		</div>


			
		</div>
		<!-- tabsozlukscripti -->

		<div role="tabpanel" class="tab-pane" id="tabgiris">
			<h2>
				 üye girişi
			</h2>
			<input id="girisemail" type="text" class="form-control" placeholder="Email adresi">
			<br /><input id="girispassword" type="password" class="form-control" placeholder="Şifre">
			<br /><a onclick="girisyap();" class="btn btn-info">giriş yap</a>					
			<a href="#tabuyelik" class="girisdugmeleri pull-right" aria-controls="uyelik" role="tab" data-toggle="tab">üye ol</a>	
			
				<div id="sosyalgirisler">
					<hr>
					<a class="btn btn-block btn-social btn-google" href="giris.htm">
					 <span class="fa fa-google"></span> google ile giriş yap
					</a>

					<a class="btn btn-block btn-social btn-facebook" href="giris.htm">
					 <span class="fa fa-facebook"></span> facebook ile giriş yap
					</a>

					<a class="btn btn-block btn-social btn-twitter" href="giris.htm">
					 <span class="fa fa-twitter"></span> twitter ile giriş yap
					</a>
				</div>
			
		</div>
		<!-- tabgiris-->


		<div role="tabpanel" class="tab-pane" id="tabayarlar">
			<h2>
				 ayarlar
			</h2>
			<hr>

			<div id="kullaniciozeti" style="font-size:x-large;">

				<div class="input-group">
					<span class="input-group-addon">nick</span>
					<input id="ayarlarnick" type="text" class="form-control" placeholder="nick">
				</div>

				<br />

				<div class="input-group">
					<span class="input-group-addon">mail</span>
					<input id="ayarlaremail" type="text" class="form-control">
				</div>

				<br />

				<div class="input-group">
					<span class="input-group-addon">şifre</span>
					<input id="ayarlarsifre" type="text" class="form-control">
				</div>

				<br />


				<div class="checkbox" style="font-size:small;">
					<label><input id="checkotomatikkaydir" type="checkbox" checked>otomatik kaydır</label>
				</div>

				<br />

				<a onclick="ayarlarkaydet();" class="btn btn-info">kaydet</a>
			</div>
		</div>
		<!-- tabayarlar-->


		<div role="tabpanel" class="tab-pane" id="tabpopulermobil">

		</div>
		


	</div>
	<!-- tabbolumler -->


	<div id="sagtaraf" class="col-md-2 hidden-sm hidden-xs" style="overflow-y:scroll;overflow-x: hidden;height:85vh;">

		<div id="sonyorumlarwidget">

			<div id="sonyorumlarbaslik">

			</div>

			<div id="sonyorumlar4">

			</div>

			<div id="sonyorumlar3">

			</div>

			<div id="sonyorumlar2">

			</div>

			<div id="sonyorumlar1">

			</div>

		</div>

		<div id="sonsayfalarwidget">

			<div id="sonsayfalarbaslik">

			</div>

			<div id="sonsayfalar1">

			</div>

			<div id="sonsayfalar2">

			</div>

			<div id="sonsayfalar3">

			</div>

			<div id="sonsayfalar4">

			</div>

		</div>


		
	</div>
		
		
	</div>
	
	<br />
	
	<script>
		function deneme() {
		
		}
		
	</script>
	
	<a class="editor" onclick="deneme();">deneme</a>
	
	<link rel="stylesheet" href="css/page.css">
	
	<script src="js/page.js"></script>
	
  <link rel="stylesheet" href="plugins/animatecss/animate.css">
	<script>
		$.fn.extend({
				animateCss: function (animationName) {
						var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
						$(this).addClass('animated ' + animationName).one(animationEnd, function() {
								$(this).removeClass('animated ' + animationName);
						});
				}
		});
	</script>

	<script src="js/autolink.js"></script>
	<!--
		<link rel="stylesheet" href="css/bootstrap-social.css">
	-->

	<!-- shareaholic -->		
	<script type='text/javascript' data-cfasync='false' src='//dsms0mj1bbhn4.cloudfront.net/assets/pub/shareaholic.js' data-shr-siteid='4aeeb9c219de392c7e7c79bf9b9f1c18' async='async'></script>

	
</body>




</html>