<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="../../js/member/member.js?ver=1"></script>
<link href="../../css/member/member.css?ver=1" type="text/css" rel="stylesheet">
<script>
   // alert('hello!')  
</script>
</head>
<body>
	<div class="container">
		<div class="header">
			<div class="logo"></div>
		</div>
		<div class="main">
			<h4>회원가입</h4>
			<div>
				<form action="#">
                    <fieldset>
                        <div>
                            <label for="email"></label>
                            <input type="email" id="email" name="firstname" placeholder="이메일 ( ex@codepen.com)" onblur="ck_email()"> 
                            <span id="MsgId" class="none">aa</span>
                        </div>
                        <div>
                            <label for="pwd"></label> 
                            <input type="password" id="pwd" name="lastname" placeholder="비밀번호" onblur="ck_pwd()"> 
                            <span id="MsgPw" class="none">유효성체크</span>
                        </div>  
                         <div>   
                            <label for="pwd_ck"></label>
                            <input type="password" id="pwd_ck" name="lastname" placeholder="비밀번호 확인" onblur="ck_pwd2()">
                            <span id="MsgPwck" class="none">유효성체크</span>
                        </div>    
                        <div>    
				            <label for="name"></label> 
				            <input type="text" id="name" name="lastname" placeholder="이름" onblur="ck_name()"> 
                            <span id="MsgName" class="none">유효성체크</span>
                        </div>    
                        <div id="wrap_gender"> 
                            <span id="wrap_man" class="gender">
                            	<input type="radio" id="man" name="gender" onclick="ck_gender()"> <label for="man"> 남자 </label>
                            </span>
                            <span id="wrap_woman" class="gender no_line">
						    	<input type="radio" id="woman" name="gender" onclick="ck_gender()"> <label for="woman" onclick="ck_gender()"> 여자 </label>
                            </span>
                         </div> 
                        <span id="MsgGender" class="none">유효성체크</span>
                        <div> 
                            <select id="country" name="country">
                                <option value="australia">20대</option>
                                <option value="canada">30대</option>
                                <option value="usa">40대</option>
                            </select> 
                        </div>

                        <input type="submit" value="Submit">
                    </fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>