<div class="navbar navbar-inverse navbar-fixed-top scroll-me" id="menu-section" >
<style>
  ul li:hover {
    background-color: rgb(204, 0, 153);
  }

  a:active {
    background-color: rgb(204, 0, 153);
  }
  
  body
  {	  
	  background-color: #808080;
  }
  
  .btn-custom-one:hover {
	background-color: rgb(204, 0, 153);
	text-decoration: none;
	color: #fff;
}

	.btn-custom-one {
	background-color: transparent;
	color: #fff;
	border: 2px solid rgb(204, 0, 153);
	}
	
	
</style>
<div class="container">
<div class="navbar-header">
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class="navbar-brand" href="index.php">
LETLINE
</a>
</div>
<div class="navbar-collapse collapse">
<ul class="nav navbar-nav navbar-right">
<li><a href="index.php">POČETNA</a></li>
<li><a href="onama.php">O NAMA</a></li>
<li><a href="galerija.php">GALERIJA</a></li>
<li><a href="prognoza.php">VREMENSKA PROGNOZA</a></li>
<?php
  if(!empty($_SESSION['user'])){
    ?>
    <li><a href="rezervisi.php">REZERVISI LET</a></li>
    <?php
    if($_SESSION['user']['admin']){
      ?>
      <li><a href="admin.php">ADMINISTRATOR</a></li>
      <?php
    }
    ?>
    <li><a href="logout.php">ODJAVA</a></li>
    <?php
  }else{
    ?>
    <li><a href="register.php">REGISTROVANJE</a></li>
    <li><a href="login.php">PRIJAVA NA SISTEM</a></li>
    <?php
  }
 ?>

</ul>
</div>
<script type = "text/javascript">
  $("a").click(function(){
      $("a").css("background-color","");
      $(this).css("background-color","rgb(204, 0, 153)");
  });
</script>
</div>

</div>

