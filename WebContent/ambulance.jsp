<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ambulance Portal</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.slim.js"></script>
<script src="js/popper.js"></script>
<script src="js/popper.min.js"></script>
</head>
<body>
	<div class="container table-responsive">
		<label style="margin-top:30px;">You Will be Notified when a patient requires ambulance</label>
		<table id="example" class="table" style="margin-top:30px;">
			<thead>
				<tr>
					<th>Patient Name</th>
					<th>Phone Number</th>
					<th>Description</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				</tr>
			</tbody>
		</table>
	</div>
	<script>
		var websocket=new WebSocket("ws://localhost:8080/HospitalProject/VitalCheckEndpoint");
		websocket.onmessage=function processMessage(message){
			var jsonData=JSON.parse(message.data);
			if(jsonData.message!=null)
			{
				var details=jsonData.message.split(',');
				var row=document.getElementById('example').insertRow();
				row.innerHTML="<td>"+details[0]+"</td><td>"+details[1]+"</td><td>"+details[2]+"</td>";
				alert(details[0]+" requires an ambulance");
			}
		}
	</script>
</body>
</html>