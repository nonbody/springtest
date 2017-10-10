<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"
	type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>

</head>
<body>
	<br>
	<table id="example" class="display" cellspacing="0" width="100%">
		<thead>
			<tr>
				<th>pk</th>
				<th>Topic</th>
				<th>comments count</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
<script>

	$(document).ready(function() {
		
	
		var table = $('#example').DataTable( {
	        "lengthMenu": [[20, 25, -1], [20,  25, "All"]]
	    } );
		
		$.get("../init", function(data, status){

            
            for (var i = 0; i < data.length; i++) {
            	table.row.add( [
            		data[i][0],
            		data[i][1],
            		data[i][2]
                ] );
            }
            
            table.draw( false );
        });
		
		$('#example tbody').on( 'click', 'tr', function () {
		    alert( table.row( this ).data()[0]);
		} );
		
	});
	
</script>
</body>
</html>