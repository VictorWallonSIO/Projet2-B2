<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Accueil documentaliste</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
</head>
<body>
<div id="wrapper">
  <div id="left">
    <h1>Wallonothèque</h1>
  </div>
  <div id="right">
    <div id="nav">
      <ul>
        <li><a href="deco.php">Déconnexion</a></li>
        <li class="last"><a href="connexion.php">Gestion des emprunts</a></li>
      </ul>
    </div>
    <div id="body">
      <div id="body-top">
        <div id="body-bot">
          <?php
          session_start();
          echo 'Bienvenue vieux '.$_SESSION['typeProfil'];
          ?>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
