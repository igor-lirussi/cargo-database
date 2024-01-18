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
 <th><font face="Arial, Helvetica, sans-serif">Codice Deposito</font></th>
 <th><font face="Arial, Helvetica, sans-serif">Totale merce nel depositoe</font></th>

 </tr>

    <?php
      $merce=$_GET["merce"];
      $query = "SELECT Deposito.idDeposito, COUNT(*) AS 'Totale merce nel deposito'
                FROM Merce JOIN Contenere ON Merce.idMerce = Contenere.Merce_idMerce JOIN Deposito ON Contenere.Deposito_idDeposito = Deposito.idDeposito 
                WHERE Merce.idMerce = '$merce' 
                GROUP BY Deposito.idDeposito";
      $result = mysqli_query($conn,$query);

      if(mysqli_num_rows($result)>0){
        
          while($row=mysqli_fetch_assoc($result)){
            echo" <tr><td><font face=\"Arial, Helvetica, sans-serif\"> ";
            echo $row['idDeposito']."</br>";
            echo"</font></td>";
            echo" <td><font face=\"Arial, Helvetica, sans-serif\">";
            echo $row['Totale merce nel deposito']."</br>";
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

