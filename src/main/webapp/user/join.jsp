<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>CodePen - form</title>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="shadow/js/shadowbox.js"></script>


<link rel="stylesheet" href="joindist/join_style.css">
<link rel="stylesheet" href="shadow/css/shadowbox.css">

<script type="text/javascript">
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
</script>
</head>
<body>
	<!-- partial:index.partial.html -->
	<div class="joincontainer">
		<form method="post" action="../user/join_ok.do" name="join_frm" id="join_frm" >
			
			<h4>Account</h4>
			<div class="row">
				<div class="col-66 input-group input-group-icon">
					<input type="text" name=id id=id placeholder="아이디" />
					<div class="input-icon">
						<i class="fa fa-envelope"></i>
					</div>
				</div>
				<div class="col-33">
					<input type="button" id="checkBtn" value="중복확인" />
				</div>
			</div>
				
			<div class="row">
				<div class="input-group input-group-icon">
					<input class="row-100" type="password" name="pwd" id="pwd" placeholder="비밀번호" />
					<div class="input-icon" style="margin-top : 4px; ">
						<i class="fa fa-key"></i>
					</div>
				</div>
			</div>
				
			<div class="row">
				<div class="input-group input-group-icon">
					<input class="row-100" type="password" name="pwd_check" id="pwd_check" placeholder="비밀번호 확인" />
					<div class="input-icon" style="margin-top : 4px; ">
						<i class="fa fa-key"></i>
					</div>
				</div>
			</div>
				
			<h4>Private Info</h4>
			
			<!-- 이름 -->
			<div class="row">
				<div class="input-group input-group-icon">
					<input class="row-100" type="text" id="name" name="name" placeholder="이름" />
					<div class="input-icon" style="margin-top : 4px; ">
						<i class="fa fa-smile-o"></i>
					</div>
				</div>
			</div>
			<div class="row">
			
				<!-- 생년월일 -->
				<div class="col-half" style="padding-top : 5px">
					<input type="date" name=birthday id="birthday" placeholder="생년월일" />
				</div>

				<!-- 성별 -->
				<div class="col-half">
					<div class="input-group">
						<input id="gender-male" type="radio" name="gender" value="male" />
						<label for="gender-male">Male</label> 
						<input id="gender-female" type="radio" name="gender" value="female" /> 
						<label for="gender-female">Female</label>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-66 input-group input-group-icon">
					<input type="tel" id=phone name="phone" placeholder="전화번호" />
					<div class="input-icon">
						<i class="fa fa-phone"></i>
					</div>
				</div>
				<div class="col-33">
					<input type="button" id="tBtn" value="전화번호 확인">
	        		&nbsp;<span style="color:blue" id="tPrint"></span>
				</div>
			</div>
			
			
			
			<div class="row">
				<div class="col-66 input-group input-group-icon">
					<input type="email" id="email" name="email" placeholder="이메일" />
					<div class="input-icon">
						<i class="fa fa-envelope"></i>
					</div>
				</div>
				<div class="col-33">
					<input type="button" id="eBtn" value="이메일 확인" />
					&nbsp;<span style="color:blue" id="ePrint"></span>
				</div>
			</div>

			<!-- 주소 -->
			<h4>Address</h4>
			
			<div class="row">
					<div class="col-66 input-group input-group-icon">
						<input type="text" name=zipcode id=zipcode placeholder="우편번호" readonly />
						<div class="input-icon">
							<i class="fa fa-automobile"></i>
						</div>
					</div>
					<div class="col-33">
						<input  type="button" value="검색" id="postBtn" />
					</div>
			</div>
			
			<div class="row">
				<div class="input-group input-group-icon">
					<input class="col-100" type="text" name=addr1 id=addr1 placeholder="주소" readonly />
					<div class="input-icon" style="margin-top : 4px; ">
						<i class="fa fa-home"></i>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="input-group input-group-icon ">
					<input class="col-100" type="text" name=addr2 id=addr2 placeholder="상세주소" />
					<div class="input-icon" style="margin-top : 4px; ">
						<i class="fa fa-home"></i>
					</div>
				</div>
			</div>

			<!-- 동의사항 -->
			<div class="row">
				<h4>Terms and Conditions</h4>
				<div class="input-group">
					<input id="terms" type="checkbox" /> <label for="terms">I
						accept the terms and conditions for signing up to this service,
						and hereby confirm I have read the privacy policy.</label>
				</div>
			</div>
			
			
			<!-- 확인 및 취소 -->
			<div>
				<div class="col-16"></div>
				<input class="col-33" style="float:center; margin-left:10px;" type="button" value="취소" onclick="javascript:history.back()">
				<input class="col-33" style="float:center; margin-right:10px;" type="button" id="joinBtn" value="회원가입" />
				<div class="col-16"></div>
			</div>

		</form>

	</div>

	<!-- partial -->
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="joindist/script.js"></script>

</body>
</html>
