<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>LOGIN</title>
  <link rel="stylesheet" href="css/login_style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	/* 엔터로 로그인 하기 (엔터 누르면 => 로그인 버튼 클릭으로 작동) */
	$('#pwd').on('keypress', function(e){ 
	    if(e.keyCode == '13'){ 
	        $('#logBtn').click(); 
	    }
	}); 
	$('#logBtn').on("click",function(){
		let id=$('#id').val();
		if(id.trim()=="")
		{
			$('#id').focus();
			return;
		}
		let pwd=$('#pwd').val();
		if(pwd.trim()=="")
		{
			$('#pwd').focus();
			return;
		}
		
		$.ajax({
			type:'post',
			url:'../user/login_ok.do',
			data:{"id":id,"pwd":pwd},
			success:function(result)
			{
				let res=result.trim();
				if(res=='NOID')
				{
					alert("등록되지 않은 회원입니다");
					$('#id').val("")
					$('#pwd').val("")
					$('#id').focus();
					
				} else if(res=='NOPWD')
				{
					alert("비밀번호 오류");
					$('#pwd').val("");
					$('#pwd').focus();
				}
				else
				{
					location.href="../main/main.do";
				}
			}
		})
	})
})
</script>
</head>
<body>
<!-- partial:index.partial.html -->
<div class="logincontainer">
  <div class="loginoverlay" id="overlay">
    <div class="sign-in" id="sign-in">
      <h1>Good to See</h1><h1>You Again !</h1>
      <p>아직 회원이 아니라면 회원가입을 통해 펫팸의 멤버가 되어보세요</p>
      <button class="switch-button" id="slide-right-button">Join</button>
    </div>
    <div class="sign-up" id="sign-up">
      <h1>Hello, Friend!</h1>
      <p>이미 회원이신가요?</p>
      <button class="switch-button" id="slide-left-button">Log In</button>
    </div>
  </div>
  <div class="form">
    <div class="sign-in" id="sign-in-info">
      <h1 style="color:#192f61;">회원가입</h1>
      <div class="social-media-buttons">
        <div class="icon">
          <svg viewBox="0 0 24 24">
            <path fill="#000000" d="M17,2V2H17V6H15C14.31,6 14,6.81 14,7.5V10H14L17,10V14H14V22H10V14H7V10H10V6A4,4 0 0,1 14,2H17Z" />
        </svg>
        </div>
        <div class="icon">
        <svg viewBox="0 0 24 24">
            <path fill="#000000" d="M23,11H21V9H19V11H17V13H19V15H21V13H23M8,11V13.4H12C11.8,14.4 10.8,16.4 8,16.4C5.6,16.4 3.7,14.4 3.7,12C3.7,9.6 5.6,7.6 8,7.6C9.4,7.6 10.3,8.2 10.8,8.7L12.7,6.9C11.5,5.7 9.9,5 8,5C4.1,5 1,8.1 1,12C1,15.9 4.1,19 8,19C12,19 14.7,16.2 14.7,12.2C14.7,11.7 14.7,11.4 14.6,11H8Z" />
        </svg>
        </div>
        <div class="icon">
        <svg viewBox="0 0 24 24">
          <path fill="#000000" d="M21,21H17V14.25C17,13.19 15.81,12.31 14.75,12.31C13.69,12.31 13,13.19 13,14.25V21H9V9H13V11C13.66,9.93 15.36,9.24 16.5,9.24C19,9.24 21,11.28 21,13.75V21M7,21H3V9H7V21M5,3A2,2 0 0,1 7,5A2,2 0 0,1 5,7A2,2 0 0,1 3,5A2,2 0 0,1 5,3Z" />
        </svg>
        </div>
      </div>
      <p class="small">or use your email account:</p>
        <button class="control-button in" style="color:#192f61;"><a href="../user/join.do">회원가입</a></button>
    </div>
    <div class="sign-up" id="sign-up-info">
      <h1>로그인</h1>
      <div class="social-media-buttons">
        <div class="icon">
          <svg viewBox="0 0 24 24">
            <path fill="#000000" d="M17,2V2H17V6H15C14.31,6 14,6.81 14,7.5V10H14L17,10V14H14V22H10V14H7V10H10V6A4,4 0 0,1 14,2H17Z" />
        </svg>
        </div>
        <div class="icon">
        <svg viewBox="0 0 24 24">
            <path fill="#000000" d="M23,11H21V9H19V11H17V13H19V15H21V13H23M8,11V13.4H12C11.8,14.4 10.8,16.4 8,16.4C5.6,16.4 3.7,14.4 3.7,12C3.7,9.6 5.6,7.6 8,7.6C9.4,7.6 10.3,8.2 10.8,8.7L12.7,6.9C11.5,5.7 9.9,5 8,5C4.1,5 1,8.1 1,12C1,15.9 4.1,19 8,19C12,19 14.7,16.2 14.7,12.2C14.7,11.7 14.7,11.4 14.6,11H8Z" />
        </svg>
        </div>
        <div class="icon">
        <svg viewBox="0 0 24 24">
          <path fill="#000000" d="M21,21H17V14.25C17,13.19 15.81,12.31 14.75,12.31C13.69,12.31 13,13.19 13,14.25V21H9V9H13V11C13.66,9.93 15.36,9.24 16.5,9.24C19,9.24 21,11.28 21,13.75V21M7,21H3V9H7V21M5,3A2,2 0 0,1 7,5A2,2 0 0,1 5,7A2,2 0 0,1 3,5A2,2 0 0,1 5,3Z" />
        </svg>
        </div>
      </div>
      <p class="small">or use your email for registration:</p>
      <form id="sign-up-form" method="post" action="../user/login_ok.do">
        <input type="text" id=id name=id placeholder="Id"/>
        <input type="password" id=pwd name=pwd placeholder="Password"/>
        <p class="forgot-password">Forgot your password?</p>
 		<!-- <button class="control-button up" id="logBtn">로그인</button> -->
		<input type="button" class="control-button up" id="logBtn" value="로그인" 
				style="cursor: pointer;
					  display: block;
					  width: 140px;
					  height: 40px;
					  text-transform: uppercase;
					  background: #f34100;
					  border-radius: 20px;
					  color: white;
					  font:14px GmarketSansMedium;
					  Margin : 15px 130px 0px 130px;
					  padding : 1px 6px
					  ">
	</form>
    </div>
  </div>
</div>
<!-- partial -->
  <script  src="js/login.js"></script>

</body>
</html>
