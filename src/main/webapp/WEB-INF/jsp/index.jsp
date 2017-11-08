<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"
	type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
	integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
	integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
	crossorigin="anonymous"></script>

</head>
<body style="margin: 15px 15px 15px 15px;">
	<div>
		<button id="addBtn" type="button" class="btn btn-primary"
			data-toggle="modal" data-target="#ModalAdd">Add</button>
		<span id="actionsBtn" data-toggle="modal" data-target="#ModalAdd"></span>
		<div class="modal fade" id="ModalAdd" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLongTitle" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="ModalTitle">Add Topic</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div id="bodyModal" class="modal-body">
						<form>
							<div class="form-group">
								<label class="form-control-label">Topic Name:</label> <input
									type="text" class="form-control" id="topicText">
							</div>
						</form>
					</div>
					<div id="saveModalFooter" class="modal-footer">
						<button id="saveCloseBtn" type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button id="saveSaveBtn" type="button" class="btn btn-primary"
							data-dismiss="modal">Save</button>
					</div>
					<div id="actionsModalFooter" class="modal-footer">
						<button id="actionsDeleteBtn" type="button" class="btn btn-danger"
							data-dismiss="modal">Delete</button>
						<button id="actionsEditBtn" type="button" class="btn btn-warning">Edit</button>
					</div>
					<div id="editModalFooter" class="modal-footer">
						<button id="editCloseBtn" type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button id="editEditBtn" type="button" class="btn btn-warning"
							data-dismiss="modal">Edit</button>
					</div>
				</div>
			</div>
		</div>

	</div>
	<br>
	<br>
	<table id="example" class="display" cellspacing="0" width="100%">
		<thead>
			<tr>
				<th>pk</th>
				<th>Topic</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>

	<script>
		function initData() {

			var table = $('#example').DataTable();
			table.clear();

			var entity;

			$.get("../init", function(data, status) {

				for (var i = 0; i < data.length; i++) {
					table.row.add([ data[i].pk, data[i].topic_name ]);
				}

				table.draw(false);
			});

		}

		function setTopicText(val) {

			$("#topicText").val(val);

		}

		$(document).ready(function() {

			var table = $('#example').DataTable({
				"lengthMenu" : [ [ 5, 10, -1 ], [ 5, 10, "All" ] ]
			});

			initData();

			$('#example tbody').on('click', 'tr', function() {
				if(table.rows().count() !== 0){
					$("#actionsBtn").click();

					entity = {
						pk : table.row(this).data()[0],
						topic_name : table.row(this).data()[1]
					};
				}
			});

			$("#saveSaveBtn").click(function() {
				if ($("#topicText").val() !== '') {
					$.post("../upd", {
						topic_name : $("#topicText").val()
					}, function(data, status) {
						if (status === 'success') {
							initData();
						}
					});
				}
			});

			$("#actionsDeleteBtn").click(function() {
				$.post("../del", entity, function(data, status) {
					if (status === 'success') {
						initData();
					}
				});
			});

			$("#editEditBtn").click(function() {
				entity.topic_name = $("#topicText").val();
				$.post("../upd", entity, function(data, status) {
					if (status === 'success') {
						initData();
					}
				});
				setTopicText('');
			});

			$("#addBtn").click(function() {
				setTopicText('');
				$("#ModalTitle").text("Add Topic");
				$("#bodyModal").show();
				$("#saveModalFooter").show();
				$("#actionsModalFooter").hide();
				$("#editModalFooter").hide();
			});

			$("#actionsBtn").click(function() {
				$("#ModalTitle").text('Actions');
				$('#bodyModal').hide();
				$("#saveModalFooter").hide();
				$("#actionsModalFooter").show();
				$("#editModalFooter").hide();
			});

			$("#actionsEditBtn").click(function() {
				setTopicText(entity.topic_name);
				$("#ModalTitle").text('Edit Topic');
				$('#bodyModal').show();
				$("#saveModalFooter").hide();
				$("#actionsModalFooter").hide();
				$("#editModalFooter").show();
			});

		});
	</script>
</body>
</html>
