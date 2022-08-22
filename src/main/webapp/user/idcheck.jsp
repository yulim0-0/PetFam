<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/idcheck.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
    $('#cBtn').click(function(){
	    let id=$('#idck').val();
	    if(id.trim()=="")
	    {
		    $('#idck').focus();
		    return;
	    }
	    
	    // 전송 => 결과값을 받는다
	    $.ajax({
		    type:'post',
		    url:'../user/idcheck_ok.do',
		    data : {"id":id},
		    success:function(result)
		    {
			    let count=parseInt(result.trim());
			    if(count==0)
				{
				    $('#print').html("<span style='color:blue'>"+id+"는(은) 사용 가능합니다</span>")
				    $('#okTr').show();
				    $('id').attr("disabled",true);
				}
			    else    /* count가 1이라면 => 기존에 존재하는 아이디 */
				{
				    $('#print').html("<span style='color:red'>"+id+"는(은) 이미 사용중입니다<br> 다시 입력하세요</span>")
				    $("#id").val("");
				    $('#id').focus();
				}
		    }
		    
	    })
    })	
    
    $('#okBtn').on("click",function(){
	    parent.join_frm.id.value=$('#idck').val();
	    parent.Shadowbox.close();
    })
})
</script>

</head>
<body>
    <div class="container">
        <div class="row">
            <table class="Table">
                <tr>
                    <td>
                        입력 : <input type=text name=idck id=idck size=15 class="input-sm">
                        <input type=button value="중복체크" class="btn btn-sm btn-primary" id="cBtn">
                    </td>
                </tr>

				<tr height="45">
					<td class="text-center"><span id="print"></span></td>
				</tr>

				<tr id="okTr" style="display:none">
			       <td class="text-center">
			        <input type=button value="확인" id="okBtn" class="btn btn-sm btn-success">
			       </td>
			     </tr>
            </table>
        </div>
    </div>
</body>
</html>