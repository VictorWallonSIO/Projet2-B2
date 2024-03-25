<!DOCTYPE html>
<html>
<head>
	<title>Connexion documentaliste</title>
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
        <li class="selected"><a href="index.html">Accueil</a></li>
        <li><a href="inscription_etudiant.php">Inscription</a></li>
        <li><a href="connexion_docu.php">Connexion pour documentaliste</a></li>
        <li class="last"><a href="connexion.php">Connexion pour étudiant</a></li>
      </ul>
    </div>
    <div id="body">
      <div id="body-top">
        <div id="body-bot">
         <form action="connexion_docu.php" method="POST">
            <h2><strong>Connexion pour documentaliste<strong></h2>
          	<br> <br>
          <input type="text" name="identifiant" placeholder="Identifiant" required>
          <br><br>
          <input type="password" name="mdp" placeholder="Mot de passe" required>
          <br><br><br>
          <input type="submit" name="valider">
          <br><br>
          <?php
          session_start();

          if(isset($_POST["valider"])) {
            connexion();
          }

          function connexion() 
          {
          try {
            $identifiant = $_POST["identifiant"] ?? "";
            $mdp = $_POST["mdp"] ?? "";


              $pdo = new PDO ("mysql:host=localhost;dbname=projet 2 bibliotheque", "root", "") ?? "";

              $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

              $sql = $pdo->prepare("SELECT mdp FROM documentaliste WHERE matricule=?");

              $sql->execute(array($identifiant));

              $verif = $sql->fetchColumn();

              //requête pour récupérer le prénom 

              if($verif) {

                $nom_docu = $pdo->prepare("SELECT prenom FROM documentaliste WHERE matricule=?");

                $nom_docu->execute(array($identifiant));

                $nom_docu_verif = $nom_docu->fetchColumn();

                if(password_verify($mdp, $verif)) {
                  $_SESSION['pseudo'] = $nom_docu_verif;
                  $_SESSION['typeProfil'] = 'documentaliste';
                  header("location:accueil_docu.php");
                }
                else {
                  echo "<p id='message'>Mauvais mot de passe</p>";
                }
              }
              else {
                echo "<p id='message'>Utilisateur non existant</p>";
              }

            } catch (PDOException $e) {

              echo "<p id='message'>Erreur lors de l'inscription : " . $e->getMessage() . "</p>";

            }
          }

          ?>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
