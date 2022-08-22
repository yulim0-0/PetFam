// INSPIRED BY SEB KAY'S 'SIGN UP FORM'
// https://dribbble.com/shots/1776663-Purple-Sign-Up-Form
// https://dribbble.com/shots/1779149--Free-PSD-Purple-Sign-Up-Form-Payment-Details
// @purple: #c68eaa;
// @green: #f0a500;
// #64ac15  bd8200

// #7ed321 light f0a500

function ck_email(){
        var email = document.getElementById("email")
        var MsgId = document.getElementById("emailcheck_msg")
        var isEmail = /([\w\-]+\@[\w\-]+\.[\w\-]+)/

        if(!isEmail.test(email.value)){
            MsgId.style.display="block";
            MsgId.className='error'
            MsgId.innerHTML="이메일 형식을 확인하세요"
            email.focus()
            return false;
        } else{
            MsgId.className='vaild'
            MsgId.innerHTML="ok"
        }   
}

function ck_pwd(){
        var pwd = document.getElementById("pwd")
        var MsgPw = document.getElementById("MsgPw")
        var isPwd = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/
        
        if(!isPwd.test(pwd.value)){
            MsgPw.style.display="block";
            MsgPw.className='error'
            MsgPw.innerHTML="숫자포함 최소 6자리 이상"
            pwd.focus()
            return false;
        } else{
            MsgPw.className='vaild'
            MsgPw.innerHTML="ok"
        }   
}


function ck_pwd2(){
        var pwd_ck = document.getElementById("pwd_check")
        var pwd = document.getElementById("pwd").value
        var MsgPwck = document.getElementById("pwdck_msg")
        
        if(pwd_ck.value!=pwd){
            MsgPwck.style.display="block";
            MsgPwck.className='error'
            MsgPwck.innerHTML="비밀번호가 일치하지 않습니다."
            pwd.focus()
            return false;
        } else{
            MsgPwck.className='vaild'
            MsgPwck.innerHTML="ok"
        }   
}


function ck_name(){
        var name = document.getElementById("name")
        var MsgName = document.getElementById("MsgName")
        
        if(name.value==''){
            MsgName.style.display="block";
            MsgName.className='error'
            MsgName.innerHTML="2자 이상 입력하세요."
            name.focus()
            return false;
        } else{
            MsgName.className='vaild'
            MsgName.innerHTML="ok"
        }   
}


function ck_gender(){
    var wrap_gender = document.getElementById("wrap_gender")
    var man = document.getElementById("man")
    var woman = document.getElementById("woman")
    var MsgGender = document.getElementById("MsgGender")

    
    if(man.checked){
        document.getElementById("wrap_man").className='gender_act';
        document.getElementById("wrap_woman").className='gender';
    }
    
    if(woman.checked){
        document.getElementById("wrap_woman").className='gender_act';
        document.getElementById("wrap_man").className='gender';
    }
    
    
}

function ck_id(){
    var id = document.getElementById("id")
    var idMsg=document.getElementById("idMsg");
    
    if(id.value=='')
    {
        $("id").focus();
        idMsg.style.display="block";
        idMsg.className='miss'
        idMsg.innerHTML="아이디를 입력하세요"
        id.focus()
        return;
    }
    /*
    $.ajax({
        type:'post',
        url : '../user/id_check.do',
        data : {"id" : id},
        success : function(result)
        {
            let count=parseInt(result.trim())
            if(count==0)
            {
                idMsg.style.display="block";
                idMsg.style=color="forestgreen";
                idMsg.className='valid'
                idMsg.innerHTML="사용 가능한 아이디입니다"
            }
            else
            {
                idMsg.style.display="block";
                idMsg.style.color="red";
                idMsg.innerHTML="사용중인 아이디입니다"
                id.focus();
            }
        }
    })
    */
}

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
	    let emailcheck_msg=document.getElementById("emailcheck_msg");
	    
	    if(email.trim()=="")
		{
		 $("email").focus();
		 $('#emailcheck_msg').text("이메일을 입력하세요")
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
                    emailcheck_msg.style.display="block";
                    emailcheck_msg.style.color="forestgreen";
                    emailcheck_msg.className='valid'
				    $('#emailcheck_msg').text("사용가능한 이메일입니다");
				}
			    else
				{
                    emailcheck_msg.style.display="block";
                    emailcheck_msg.style.color="red";
				    $('#emailcheck_msg').text("사용중인 이메일입니다");
				    $('#email').val("")
				    $('#email').focus()
				}
		    }
	    })
	})

     $('#tBtn').click(function(){
        let phone=$('#phone').val();
        var phoneck_msg = document.getElementById("phoneck_msg")

        if(phone.trim()=="")
        {
         $("phone").focus();
         $('#phoneck_msg').text("전화번호를 입력하세요")
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
                    phoneck_msg.style.display="block";
                    phoneck_msg.style.color="forestgreen";
                    phoneck_msg.className='valid'
                    phoneck_msg.innerHTML="사용가능한 전화번호입니다"
                }
                else
                {
                    phoneck_msg.style.display="block";
                    phoneck_msg.style.color="red";
                    phoneck_msg.className='error'
                    $('#phoneck_msg').text("사용중인 번호입니다");
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
/*    
    if(man.checked == false && woman.checked == false){
        MsgGender.style.display="block";
        MsgGender.className='error'
        MsgGender.innerHTML="필수 정보입니다."        wrap_gender.style.borderColor="red";
        return false;
    }
    */
