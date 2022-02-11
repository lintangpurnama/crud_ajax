$(document).ready(function () {
	listUsers();
	$('#listUserTable').dataTable({
		"bPaginate": false,
		"bInfo": false,
		"bFilter": false,
		"bLengthChange": false,
		"pageLength": 5
	});
	// list all user in datatable
	function listUsers() {
		$.ajax({
			type: 'ajax',
			url: 'welcome/tampilkanData',
			async: false,
			dataType: 'json',
			success: function (data) {
				var html = '';
				var i;
				var no = 1;
				for (i = 0; i < data.length; i++) {
					html += '<tr id="' + data[i].id + '">' +
						'<td>' + no++ + '</td>' +
						'<td>' + data[i].username + '</td>' +
						'<td>' + data[i].roles + '</td>' +
						'<td>' + data[i].pict + '</td>' +
						'<td>' + data[i].status + '</td>' +
						'<td style="text-align:right;">' +
						
						'<a href="javascript:void(0);" class="btn btn-info btn-sm editRecord" data-id="' + data[i].id + '" data-username="' + data[i].username + '"data-email="' + data[i].email + '">Edit</a>' + ' ' +
						'<a href="javascript:void(0);" class="btn btn-danger btn-sm deleteRecord" data-id="' + data[i].id + '">Delete</a>' +
						'</td>' +
						'</tr>';
						if (data[i].status === 1) {
							'<h1>heheh</h1>'
						} else {
							
						}
				}
				$('#listUser').html(html);
				
			}

		});
	}
	
});
// <?php if ($r->status == 1) { ?>
//     <button class="btn btn-success"><i class="fa fa-check"></i> Sudah Memilih</button>
// <?php } else { ?>
//     <button class="btn btn-danger"><i class="fa fa-close"></i> Belum Sudah Memilih</button>
// <?php } ?>