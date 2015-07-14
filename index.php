<!DOCTYPE html>
<html lang="en">
<!-- library midiplayer -->
<script src="javascript/midi.js"></script>
<script type="text/javascript"><!-- script untuk midiplayer -->

function doPlay(btn, file) {
    if (btn.value == 'play') {
    	m = new MidiPlayer('./media/'+file+'.mid', btn); 
        m.play();
        btn.value = 'stop';
    }
    else {
        m.stop();
        btn.value = 'play';
    }
}

function do_clear() { 
    document.getElementById('msg').innerHTML=''; 
    document.getElementById('div_clear').style.display='none';
}
function show_clear() {
    document.getElementById('div_clear').style.display='block';
}
</script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- load lib jquery-->
<script>
$(document).ready(function(){	
    $("#pilih_penyanyi").change(function(){
    	//alert($(this).val());
    	var id = $(this).val();
    	$.ajax({
    		  type: 'POST',
    		  url: 'getallsong.php',
    		  dataType: 'json', 
    		  data: {'id_penyanyi': id},
    		}).success(function(data) {
    			//alert(data);
    			if(data.length > 0){
					//var newds = new Array();
					$('#pilih_lagu').html('');
					$('#pilih_lagu').append("<option value='0'> -- ALL -- </option>");
					for (var i=0; i < data.length; i++) {
						//newds[i] = [data[i].id, data[i].judul];
						$('#pilih_lagu').append("<option value='" + data[i].id+ "'>" + data[i].judul + "</option>");
						//alert("benar");
					}
				}
    		  }).fail(function(e) {
					alert("e: "+e.message);
        		  });
    });
});
</script>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>| Music Bank |</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>
<body>
	<?php require_once 'dbconfig.php'; //initiasi database ?>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron" align="center"
					style="background-color: #FF6600">
					<h2>Music Bank</h2>
					<span>midi format</span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal" role="form" method="post">
					<?php 
					$select_penyanyi="select penyanyi.ID_PENYANYI, penyanyi.NAMA from penyanyi ORDER BY penyanyi.NAMA ASC";
					if(!mysqli_query($mysqlCon, $select_penyanyi))
						die("Error: " .mysqli_error($mysqlCon));
					else
						$penyanyi = mysqli_query($mysqlCon, $select_penyanyi);
					?>
					<div class="form-group">
						<label class="col-sm-2" control-label> Penyanyi </label> <select
							id="pilih_penyanyi" name="penyanyi">
							<option value="0">-- ALL --</option>
							<?php 
							while($row = mysqli_fetch_array($penyanyi)){
						if(isset($_POST["penyanyi"]) && ($row['ID_PENYANYI'] == $_POST["penyanyi"]) )
							printf('<option value="%s" selected>%s</option>', $row['ID_PENYANYI'], $row['NAMA'] );
						else
							printf('<option value="%s">%s</option>', $row['ID_PENYANYI'], $row['NAMA'] );
					}?>
						</select>
					</div>
					<div class="form-group">
						<?php 
						$select_lagu="select lagu.ID_LAGU, lagu.JUDUL from lagu ORDER BY lagu.JUDUL ASC";
						if(!mysqli_query($mysqlCon, $select_lagu))
							die("Error: " .mysqli_error($mysqlCon));
						else
							$lagu = mysqli_query($mysqlCon, $select_lagu);
						?>
						<label class="col-sm-2" control-label> Lagu </label> <select
							id="pilih_lagu" name="lagu">
							<option value="0">-- ALL --</option>
							<?php 
							while($row = mysqli_fetch_array($lagu)){
						if(isset($_POST["lagu"]) && ($row['ID_LAGU'] == $_POST["lagu"]) )
							printf('<option value="%s" selected>%s</option>', $row['ID_LAGU'], $row['JUDUL'] );
						else
							printf('<option value="%s">%s</option>', $row['ID_LAGU'], $row['JUDUL'] );
						}?>
						</select>
					</div>
					<div class="form-group">
						<div class="col-sm-5">
							<button type="submit" class="btn btn-primary">Cari</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<?php 
				$sql="select penyanyi.NAMA, lagu.JUDUL, (SELECT file_lagu.NAMA_FILE FROM file_lagu where file_lagu.ID_FILE = lagu.ID_FILE) AS NAMA_FILE from lagu join penyanyi on lagu.ID_PENYANYI = penyanyi.ID_PENYANYI ORDER BY penyanyi.NAMA ASC";
				if (isset($_POST["penyanyi"]) && $_POST["penyanyi"] != 0 ){
					$id_penyanyi = $_POST["penyanyi"];
					$sql="select penyanyi.NAMA, lagu.JUDUL, (SELECT file_lagu.NAMA_FILE FROM file_lagu where file_lagu.ID_FILE = lagu.ID_FILE) AS NAMA_FILE from lagu join penyanyi on lagu.ID_PENYANYI = penyanyi.ID_PENYANYI WHERE lagu.ID_PENYANYI = ".$id_penyanyi." ORDER BY penyanyi.NAMA ASC";
					if (isset($_POST["lagu"]) && $_POST["lagu"] != 0 ){
						$id_lagu = $_POST["lagu"];
						$sql="select penyanyi.NAMA, lagu.JUDUL, (SELECT file_lagu.NAMA_FILE FROM file_lagu where file_lagu.ID_FILE = lagu.ID_FILE) AS NAMA_FILE from lagu join penyanyi on lagu.ID_PENYANYI = penyanyi.ID_PENYANYI WHERE lagu.ID_PENYANYI = ".$id_penyanyi." and lagu.ID_LAGU = ".$id_lagu." ORDER BY penyanyi.NAMA ASC";
					}
				}else{
					if (isset($_POST["lagu"]) && $_POST["lagu"] != 0 ){
						$id_lagu = $_POST["lagu"];
						$sql="select penyanyi.NAMA, lagu.JUDUL, (SELECT file_lagu.NAMA_FILE FROM file_lagu where file_lagu.ID_FILE = lagu.ID_FILE) AS NAMA_FILE from lagu join penyanyi on lagu.ID_PENYANYI = penyanyi.ID_PENYANYI WHERE lagu.ID_LAGU = ".$id_lagu;
					}
				}
				if(!mysqli_query($mysqlCon, $sql)){
					die("Error: " .mysqli_error($mysqlCon));
				}
				else{
					$result = mysqli_query($mysqlCon, $sql);
				}?>
				<table class="table">
					<thead>
						<tr class="info">
							<th>No.</th>
							<th>Penyanyi</th>
							<th>Judul Lagu</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<?php 
						$no = 1;
						while($row = mysqli_fetch_array($result)){ ?>
						<tr class="primary">
							<td><?php echo $no?></td>
							<td><?php echo $row['NAMA']?></td>
							<td><?php echo $row['JUDUL']?></td>
							<td><?php printf('<input type="button" value="play" id="btn2" onclick="doPlay(this, \'%s\');" />', $row["NAMA_FILE"]);?></td>
							<td><?php printf('<a href="./media/%s.mid">download</a>', $row["NAMA_FILE"]);?></td>
						</tr>
						<?php $no++; 
						} ?>
					</tbody>
				</table>
				<div class="row" >
					<div class="col-md-12">
						<address>
						 <strong>Hafiyyan Putra Pratama</strong><br> 03214057<br> D4 TKJMD B9 ITB @2015<br> 
						</address>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
