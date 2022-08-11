//exporte les données sélectionnées
var $table = $('#table');
    $(function () {
        $('#toolbar').find('select').change(function () {
            $table.bootstrapTable('refreshOptions', {
                exportDataType: $(this).val()
            });
        });
    })

	var trBoldBlue = $("table");
	$('#detail').on("dblclick", "#detail", function (){
		
			location.href="../admin/admin_user_detail.do?id=${vo.id }";
	});
	$(trBoldBlue).on("click", "#id", function (){
			$(this).toggleClass("bold-blue");
			
	});
