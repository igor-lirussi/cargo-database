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
 <th><font face="Arial, Helvetica, sans-serif">ID Movimentazione</font></th>
 <th><font face="Arial, Helvetica, sans-serif">Data Movimentazione</font></th>
 <th><font face="Arial, Helvetica, sans-serif">Id Merce</font></th>
 <th><font face="Arial, Helvetica, sans-serif">Nome Merce</font></th>

 </tr>

    <?php
      $targa=$_GET["targa"];
      $query = "SELECT movimentazioni.idMov, movimentazioni.Data, merce.idMerce, merce.Nome
                FROM movimentazioni join compiere on movimentazioni.idMov = compiere.Movimentazioni_idMov join merce on compiere.Merce_idMerce = merce.idMerce
                where movimentazioni.Camion_Targa = '$targa' AND movimentazioni.Data > 
                   (select Riparazione_Data
                    from svolta join camion on svolta.Camion_Targa = camion.Targa
                    where camion.Targa = '$targa'
                    order by svolta.Riparazione_Data desc limit 1)";
      $result = mysqli_query($conn,$query);

      if(mysqli_num_rows($result)>0){
        
          while($row=mysqli_fetch_assoc($result)){
            echo" <tr><td><font face=\"Arial, Helvetica, sans-serif\"> ";
            echo $row['idMov']."</br>";
            echo"</font></td>";
            echo" <td><font face=\"Arial, Helvetica, sans-serif\">";
            echo $row['Data']."</br>";
            echo"</font></td>";
            echo" <td><font face=\"Arial, Helvetica, sans-serif\">";
            echo $row['idMerce']."</br>";
            echo"</font></td>";
           echo" <td><font face=\"Arial, Helvetica, sans-serif\">";
            echo $row['Nome']."</br>";
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

