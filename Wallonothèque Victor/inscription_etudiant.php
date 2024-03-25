<!DOCTYPE html>
<html>
<head>
	<title>Inscription étudiant</title>
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
         <form action="inscription_etudiant.php" method="POST">
            <h2><strong>Inscription pour étudiant<strong></h2>
          	<br> <br>
          <input type="text" name="nom" placeholder="Nom" required>
          <br> <br>
          <input type="text" name="prenom" placeholder="Prénom" required>
          <br> <br>
          <input type="text" name="rue" placeholder="Rue" required>
          <br> <br>
          <input type="text" name="ville" placeholder="Ville" required>
          <br> <br>
          <input type="text" name="cpostal" placeholder="Code postal" required>
          <br> <br>
          <input type="text" name="tel" placeholder="Numéro de téléphone" required>
          <br><br><br>
          <input type="text" name="identifiant" placeholder="Identifiant" required>
          <br><br>
          <input type="password" name="mdp" placeholder="Mot de passe" required>
          <br><br><br>
          <input type="submit" name="valider">
          <br><br>
          <?php
          session_start();

          if(isset($_POST["valider"])) {
            inscription();
          }

          function inscription() 
          {
          try {
            $nom = $_POST["nom"] ?? "";
            $prenom = $_POST["prenom"] ?? "";
            $rue = $_POST["rue"] ?? "";
            $ville = $_POST["ville"] ?? "";
            $cpostal = $_POST["cpostal"] ?? "";
            $tel = $_POST["tel"] ?? "";
            $identifiant = $_POST["identifiant"] ?? "";
            $mdp = $_POST["mdp"] ?? "";
            $mdp_hash = password_hash($mdp, PASSWORD_BCRYPT);


              $pdo = new PDO ("mysql:host=localhost;dbname=projet_2", "root", "") ?? "";

              $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

              $date_sql = $pdo->prepare("SELECT CURRENT_DATE");

              $date_sql->execute();

              $date_inscri = $date_sql->fetchColumn();

              $sql = $pdo->prepare("INSERT INTO adherent VALUES(?,?,?,?,?,?,?,?,?,?,?)");

              $sql->execute(array("",$nom,$prenom,$rue,$ville,$cpostal,$tel,$identifiant,$mdp_hash,$date_inscri,"L59003"));

              echo "Ajout réussie";

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

