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
      
      $targa=$_GET["targa"];
      $marca = $_GET["marca"];
      $mod=$_GET["modello"];
      $tipo = $_GET["tipo"];
      $ida=$_GET["cfAut"];
      $sql="INSERT INTO Camion(Targa, Modello, Marca, Tipo, Persona_CodFiscale)
            VALUES ('$targa', '$mod', '$marca', '$tipo', '$ida')";
      if($conn->query($sql)=== TRUE ){
        echo "I dati sono stati inseriti correttamente nel database.";
      }else{
        echo"errore".$sql.$conn->error;
      }
  $conn->close();
 
    ?>
   <br>
   <br>
   <a href="GDI_Camion.html"> Nuovo inserimento nella tabella </a> <br>
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

