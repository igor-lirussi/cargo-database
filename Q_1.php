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
        a:visited {text-decoration: none; color: black;}
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
    <table border="0" cellspacing="2" cellpadding="2">
      <tr>
       <th><font face="Arial, Helvetica, sans-serif">Tipo</font></th>
       <th><font face="Arial, Helvetica, sans-serif">Data</font></th>
       <th><font face="Arial, Helvetica, sans-serif">Meccanico</font></th>
       <th><font face="Arial, Helvetica, sans-serif">Ofiicina</font></th>
       <th><font face="Arial, Helvetica, sans-serif">Targa</font></th>
       

      </tr>

    <?php
      $targa=$_GET["targa"];
      $query = "SELECT * 
                FROM Riparazione JOIN Svolta ON Riparazione.Tipo = Svolta.Riparazione_Tipo AND Riparazione.Data = Svolta.Riparazione_Data
                WHERE Svolta.Camion_Targa ='$targa'";
      $result = mysqli_query($conn,$query);

      if(mysqli_num_rows($result)>0){
        
          while($row=mysqli_fetch_assoc($result)){
            echo" <tr><td><font face=\"Arial, Helvetica, sans-serif\"> ";
            echo $row['Tipo']."</br>";
            echo"</font></td>";
            echo" <td><font face=\"Arial, Helvetica, sans-serif\">";
            echo $row['Data']."</br>";
            echo"</font></td>";
            echo" <td><font face=\"Arial, Helvetica, sans-serif\">";
            echo $row['Persona_CodFiscale']."</br>";
            echo"</font></td>";
            echo" <td><font face=\"Arial, Helvetica, sans-serif\">";
            echo $row['Officina_Nome_Commerciale']."</br>";
            echo"</font></td>";
            echo" <td><font face=\"Arial, Helvetica, sans-serif\">";
            echo $row['Camion_Targa']."</br>";
            echo"</font></td>";
            echo " </tr>";
          }
      }else{
        echo "Nessun risultato";
      }       

      $conn->close();
 
    ?>
    </table>
    <br>
     <a href="cargostyle.html"> Torna al Menù </a> <br>
    </div>

      <div id="content2">
   
      </div>
      <div id="footer">
        <p> MSG© software </p>
      </div>
    </div>
  </body>
</html>
