<?php
// Create connection
$con=mysqli_connect("Sofia","root","","mydb");
// Check connection
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }
else
  {
   echo "Connection to mysql ok";
}
echo "<br/>";
$result = mysqli_query($con,"SELECT * FROM table1");

while($row = mysqli_fetch_array($result))
  {
  echo "field1 = " . $row['field1'];
  echo "<br>";
  }

mysqli_close($con);
?> 
