<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>JOIN</title>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="shadow/js/shadowbox.js"></script>
<link rel="stylesheet" href="css/join_style.css">
<link rel="stylesheet" href="shadow/css/shadowbox.css">
<!-- content에 자신의 OAuth2.0 클라이언트ID를 넣습니다. -->
<meta name ="google-signin-client_id" content="645830406286-hp0qh1v6rfkru3d8ps72p5dtbqdq56d5.apps.googleusercontent.com">
<script type="text/javascript">

//처음 실행하는 함수
function init() {
    gapi.load('auth2', function() {
        gapi.auth2.init();
        options = new gapi.auth2.SigninOptionsBuilder();
        options.setPrompt('select_account');
        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
        options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
        gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
    })
}

function onSignIn(googleUser) {
    var access_token = googleUser.getAuthResponse().access_token
    $.ajax({
        // people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
        url: 'https://people.googleapis.com/v1/people/me'
        // key에 자신의 API 키를 넣습니다.
        , data: {personFields:'birthdays', key:'AIzaSyCjjtR7OpfXr3z_LtCxNu6TMDAYfXC4NBY', 'access_token': access_token}
        , method:'GET'
    })
    .done(function(e){
        //프로필을 가져온다.
        var profile = googleUser.getBasicProfile();
        console.log(profile)
    })
    .fail(function(e){
        console.log(e);
    })
}
function onSignInFailure(t){        
    console.log(t);
}

//숫자가 아닌 정규식
var replaceNotInt = /[^0-9]/gi;

$(document).ready(function(){
    
    $("#phone").on("focusout", function() {
        var x = $(this).val();
        if (x.length > 0) {
            if (x.match(replaceNotInt)) {
               x = x.replace(replaceNotInt, "");
            }
            $(this).val(x);
        }
    }).on("keyup", function() {
        $(this).val($(this).val().replace(replaceNotInt, ""));
    });

});


// 입력을 제한 할 특수문자의 정규식
var replaceId  = /[<>()]/gi;

$(document).ready(function(){
    
    $("#pwd").on("focusout", function() {
        var x = $(this).val();
        if (x.length > 0) {
            if (x.match(replaceId)) {
               x = x.replace(replaceId, "");
               alert("특수문자는 사용 불가능합니다.");
            }
            $(this).val(x);
        }
    }).on("keyup", function() {
        $(this).val($(this).val().replace(replaceId, ""));

    });

});
</script>

</head>
<body>
<main class="main">
    <!-- partial:index.partial.html -->
    <div class="joincontainer">
        <form method="post" action="../user/join_ok.do" name="join_frm" id="join_frm" role="form" >
            
            <h4>Account</h4>
            <div class="row">
                <div class="col-66 input-group input-group-icon">
                    <input type="text" name=id id=id placeholder="아이디" required/>
                    <span class="none" id="idMsg"></span>
                    <div class="input-icon">
                        <i class="fa fa-envelope"></i>
                    </div>
                </div>
                <div class="col-33">
                    <input type="button" name="checkBtn" id="checkBtn" value="중복확인"/>
                    <!-- 아이디 확인 창 띄우지 않고 중복확인을 해당 페이지에서 진행할 수 있을까? -->
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
                    <input class="row-100" type="password" name="pwd_check" id="pwd_check" placeholder="비밀번호 확인" onblur="ck_pwd2()" />
                    <span style="display: none;" id="pwdck_msg"></span>
                    
                    <div class="input-icon" style="margin-top : 4px; ">
                        <i class="fa fa-key"></i>
                    </div>
                </div>
            </div>
            
            <div class="row">
            </div>  
                
            
            <h4>Private Info</h4>
            <!-- 이름 -->
            <div class="row">
                <div class="input-group input-group-icon">
                    <input class="row-100" type="text" id="name" name="name" placeholder="이름"/>
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
                        <input id="gender-male" type="radio" name="gender" value="남자" checked/>
                        <label for="gender-male">Male</label> 
                        <input id="gender-female" type="radio" name="gender" value="여자" /> 
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
                </div>
                <div class="row">
                    <div class="col-66 notify1">
                        <span class="none" id="phoneck_msg">확인</span>
                    </div>
                </div>
            </div>
            
            
            
            <div class="row">
                <div class="col-66 input-group input-group-icon">
                    <input type="email" id="email" name="email" placeholder="이메일" onblur="ck_email()" />
                    <div class="input-icon">
                        <i class="fa fa-envelope"></i>
                    </div>
                </div>
                <div class="col-33">
                    <input type="button" id="eBtn" value="이메일 확인" />
                </div>
            </div>
            <div class="row">
                <div class="col-66 notify2">
                    <span class="none" id="emailcheck_msg">확인</span>
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
                        <input type="button" value="검색" id="postBtn" />
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
                    <input id="terms" type="checkbox" value="terms"/> <label for="terms">펫팸의 이용약관 및 개인정보 수집 및 이용에 대한 안내에 동의합니다.</label>
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
    <script src="js/join.js"></script>
    <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
</main>
</body>
</html>