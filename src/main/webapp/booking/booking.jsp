<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>booking form</title>

<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="shadow/js/shadowbox.js"></script>


<link rel="stylesheet" href="../booking/bookingdist/booking_style.css">

<!-- <script type="text/javascript">
	Shadowbox.init({
		players : [ 'iframe' ]
	})
	$(function() {
		$('#checkBtn').click(function() {
			Shadowbox.open({
				content : '../user/idcheck.do',
				player : 'iframe',
				title : '아이디 중복체크',
				width : 400,
				height : 200
			})
		})
		$('#postBtn').click(function() {
			// 우편번호 검색 처리 
			new daum.Postcode({
				oncomplete : function(data) {
					$('#zipcode').val(data.zonecode)
					$('#addr1').val(data.address)
				}
			}).open()
		})
		
		// 유효성 검사
	    $('#eBtn').click(function(){
		    let email=$('#email').val();
		    if(email.trim()=="")
			{
			 $("email").focus();
			 $('#ePrint').text("이메일을 입력하세요")
			 return;
			}
		    $.ajax({
			    type:'post',
			    url:'../user/email_check.do',
			    data:{"email":email},
			    success:function(result)
			    {
				    let count=parseInt(result.trim())
				    if(count==0)
					{
					    $('#ePrint').text("사용가능한 이메일입니다");
					    $('#email').attr('disabled',true);
					}
				    else
					{
					    $('#ePrint').text("사용중인 이메일입니다");
					    $('#email').val("")
					    $('#email').focus()
					}
			    }
		    })
	    })
    
	     $('#tBtn').click(function(){
	        let phone=$('#phone').val();
	        if(phone.trim()=="")
	        {
	         $("phone").focus();
	         $('#tPrint').text("전화번호를 입력하세요")
	         return;
	        }
	        $.ajax({
	            type:'post',
	            url:'../user/phone_check.do',
	            data:{"phone":phone},
	            success:function(result)
	            {
	                let count=parseInt(result.trim())
	                if(count==0)
	                {
	                    $('#ePrint').text("사용가능한 번호입니다");
	                    $('#phone').attr('disabled',true);
	                }
	                else
	                {
	                    $('#tPrint').text("사용중인 번호입니다");
	                    $('#phone').val("")
	                    $('#phone').focus()
	                }
	            }
	        })
	    })
	    $('#joinBtn').click(function(){
	    	$('#join_frm').submit();
	    })
	})
</script> -->
</head>
<body>
<main class="main">

	<!-- partial:index.partial.html -->
	<div class="joincontainer">
		<form method="post" action="" name="join_frm" id="join_frm" >
			
			<h4>예약자 정보</h4>
			<!-- 회원ID -->
			<div class="row">
				<div class="input-group input-group-icon">
					<input class="row-100" type="text" name=id id=id placeholder="아이디" />
					<div class="input-icon" style="margin-top : 6px; ">
						<i class="fa fa-envelope"></i>
					</div>
				</div>
			</div>
			<!-- 이름 -->
			<div class="row">
				<div class="input-group input-group-icon">
					<input class="row-100" type="text" id="name" name="name" placeholder="이름" />
					<div class="input-icon" style="margin-top : 6px; ">
						<i class="fa fa-smile-o"></i>
					</div>
				</div>
			</div>
			
			<!-- 전화번호 -->
			<div class="row">
				<div class="input-group input-group-icon">
					<input class="row-100" type="tel" id=phone name="phone" placeholder="전화번호" />
					<div class="input-icon" style="margin-top : 6px; ">
						<i class="fa fa-phone"></i>
					</div>
				</div>
			</div>
			<!-- 이메일 -->
			<div class="row">
				<div class="input-group input-group-icon">
					<input class="row-100" type="email" id="email" name="email" placeholder="이메일" />
					<div class="input-icon" style="margin-top : 6px; ">
						<i class="fa fa-envelope"></i>
					</div>
				</div>
			</div>
			
			<h4>예약</h4>
			<!-- 날짜/시간 -->
				<div class="row">
				<!-- 날짜 -->
				<div class="col-half" style="padding-top : 5px">
					<input type="date" name=birthday id="birthday" placeholder="방문날짜" />
				</div>

				<!-- 시간 -->
				<div class="col-half">
					<div class="input-group">
							<select id="time">
								<optgroup label="오전">
									<option value="09">09:00AM</option>
									<option value="10">10:00AM</option>
									<option value="11">11:00AM</option>
									<option value="12">12:00PM</option>
								</optgroup>
								<optgroup label="오후">
									<option value="13">13:00PM</option>
									<option value="14">14:00PM</option>
									<option value="15">15:00PM</option>
									<option value="16">16:00PM</option>
									<option value="17">17:00PM</option>
								</optgroup>
							</select>
						</div>
				</div>
			</div>
			
			<!-- MSG -->
			<div class="row">
            <label for="comments" style="color: #192f61">&#8251;펫펨에게 반려동물에 대해 알려주세요!(필수)<br></label>
			<div class="input-group input-group-icon">
            <textarea class="form-control" id="comments" rows="5" data-max-length="150"></textarea>
			</div>
			</div>
			<!-- 동의사항 -->
			<div class="row">
				<h4>확인사항</h4>
				<div class="input-group">
					<input id="terms" type="checkbox" /> <label for="terms">
						지금 결제하지 마세요!<br>
						펫펨은 선결제 없이 예약하고 나중에 직접 결제해요!</label>
				</div>
			</div>
			
			<!-- 확인 및 취소 -->
			<div>
				<div class="col-16"></div>
				<input class="col-33" style="float:center; margin-left:10px;" type="button" value="취소" onclick="javascript:history.back()">
				<input class="col-33" style="float:center; margin-right:10px;" type="button" id="joinBtn" value="예약신청" />
				<div class="col-16"></div>
			</div>

		</form>

	</div>

	<!-- partial -->
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="joindist/script.js"></script>
</main>
</body>
</html>
