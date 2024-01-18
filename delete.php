<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="cargo.css">
    <title> CARGO software </title>
  </head>
  <body>
    <div id="container">
      <div id="header">
        <img src="logo.png" alt="image not found" width=550 height=250>  
        <img src="cam2.png" alt="image not found" width=400 height=250> 
      </div>

      <div id="menu">
       <style> a:link    {text-decoration: none; color: blue;}
        a:visited {text-decoration: none; color: green;}
        a:hover   {color: red;} 
       </style>
    <?php
      $servername = "localhost";
      $username = "root";
      $password = "";
      $dbname = "mydb";

      $conn = new mysqli($servername, $username, $password, $dbname);


      if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
      }
    ?>
    <?php
      $tab=$_GET["tabella"];
      switch ($tab){
        case "Merce":
          $merce = $_GET["merce"];
          $sql="DELETE FROM Merce WHERE idMerce = $merce";
          break;
        case "Autista":
          $autista = $_GET["autista"];
          $sql="DELETE FROM Persona WHERE CodFiscale = '$autista'";
          break;
        case "Camion":
          $camion = $_GET["camoin"];
          $sql="DELETE FROM Camion WHERE Targa = '$camion'";
          break;
        case "Movimentazioni":
          $mov = $_GET["movimentazioni"];
          $sql="DELETE FROM Movimentazioni WHERE idMov = $mov";
          break;
        case "Magazziniere":
          $mag = $_GET["magazziniere"];
          $sql="DELETE FROM Persona WHERE CodFiscale = '$mag'";
          break;
        case "Deposito":
          $dep = $_GET["deposito"];
          $sql="DELETE FROM Deposito WHERE idDeposito = $dep";
          break;
        case "Meccanico":
          $mec = $_GET["meccanico"];
          $sql="DELETE FROM Persona WHERE CodFiscale = '$mec'";
          break;
        case "Riparazione":
          $tipo = $_GET["tiporip"];
          $data = $_GET["datarip"];
          $sql="DELETE FROM Riparazione WHERE Tipo = '$tipo' AND Data = '$data'";
          break;
        case "Officina":
          $officina = $_GET["officina"];
          $sql="DELETE FROM Officina WHERE Nome_Commerciale = '$officina'";
          break;
        case "Cancella tutta la tabella Merce":
          $sql="DELETE FROM Merce";
          break;
        case "Cancella tutta la tabella Autista":
          $sql="DELETE FROM Persona WHERE Tipo = 'Autista'";
          break;
        case "Cancella tutta la tabella Camion":
          $sql="DELETE FROM Camion";
          break;
        case "Cancella tutta la tabella Movimentazioni":
          $sql="DELETE FROM Movimentazioni";
          break;
        case "Cancella tutta la tabella Magazziniere":
          $sql="DELETE FROM Persona  WHERE Tipo = 'Magazziniere'";
          break;
        case "Cancella tutta la tabella Deposito":
          $sql="DELETE FROM Deposito";
          break;
        case "Cancella tutta la tabella Meccanico":
          $sql="DELETE FROM Persona WHERE Tipo = 'Meccanico'";
          break;
        case "Cancella tutta la tabella Riparazione":
          $sql="DELETE FROM Riparazione";
          break;
        case "Cancella tutta la tabella Officina":
          $sql="DELETE FROM Officina";
          break;
      }
      if($conn->query($sql)=== TRUE ){
        echo "I dati sono stati cancellati correttamente dalla tabella da lei selezionata.";
      }else{
        echo"errore".$sql.$conn->error;
      }

  $conn->close();
 
    ?>
   <br>
   <br>
   <a href="formdelete.html"> Menù cancellazione </a> <br>
  </div>
  <div id="content2">
      <a href="cargostyle.html"> Torna al Menù </a> <br>
        
      </div>
      <div id="footer">
        <p> MSG© software </p>
      </div>
    </div>
  </body>
</html>

