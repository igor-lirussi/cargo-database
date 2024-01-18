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

      $conn = new mysqli($servername, $username,  $password, $dbname);


      if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
      }
    ?>
    <?php
      $tipo=$_GET['tipo'];
      $data=$_GET['data'];
      $targa=$_GET['targa'];
      $sql="INSERT INTO svolta(Riparazione_Tipo, Riparazione_Data, Camion_Targa)
            VALUES ( '$tipo', '$data', '$targa')";
      if($conn->query($sql)=== TRUE ){
        echo "I dati sono stati inseriti correttamente nel database.";
      }else{
        echo"errore".$sql.$conn->error;
      }

  $conn->close();
 
    ?>
    
  <br>
   <br>
   <a href="GDI_Svolta.html"> Nuovo inserimento nella correlazione </a> <br>
  </div>
  <div id="content2">
      <a href="cargostyle.html"> Torna al Menu</a> <br>
        
      </div>
      <div id="footer">
        <p> MSG© software </p>
      </div>
    </div>
  </body>
</html>
