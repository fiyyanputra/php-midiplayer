<?php 
require_once 'dbconfig.php'; //initiasi database
$id = $_POST['id_penyanyi'];
//$id = 1;
if($id == 0){
	$sql="select lagu.ID_LAGU, lagu.JUDUL from lagu ORDER BY lagu.ID_LAGU ASC";
}else{
	$sql="select lagu.ID_LAGU, lagu.JUDUL from lagu WHERE lagu.ID_PENYANYI =".$id." ORDER BY lagu.ID_LAGU ASC";
}

if(!mysqli_query($mysqlCon, $sql)){
	die("Error: " .mysqli_error($mysqlCon));
}
else{
	$lagu = mysqli_query($mysqlCon, $sql);
}

$data = array();
$i=0;
while($row = mysqli_fetch_assoc($lagu)){	
	$data[$i]['id'] = $row['ID_LAGU'];
	$data[$i]['judul'] = $row['JUDUL'];
	$i++;
}

print_r(json_encode($data));

?>