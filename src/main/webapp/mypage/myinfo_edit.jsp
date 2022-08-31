<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
<link rel="stylesheet" href="css/myinfo.css">

<style>
input[type=text], input[type=date] {
    border : 0px;
    width : 100%;
}
</style>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
    // 우편번호 검색 처리 
    $('#zipBtn').click(function() {
        new daum.Postcode({
            oncomplete : function(data) {
                $('#zipcode').val("["+data.zonecode+"] " + data.address)
            }
        }).open()
    })

$('#editBtn').click(function(){
        $('#edit_frm').submit();
    })
})
</script>
</head>
<body>
    <main class="main">
        <div class="top-menu">
            <h1>개인정보 수정</h1>
        </div>
        
        <form method="post" action="../mypage/myinfo_edit_ok.do" name="edit_frm" id="edit_frm">
        <div id="demo">
            <div class="table-responsive-vertical shadow-z-1"
                style="width: 900px; margin: 0 auto;">
                <!-- Table starts here -->
                <table id="table" class="table table-hover table-mc-light-blue">
                        <tbody>
                            <tr>
                                <td></td>
                                <td data-title="ID" class="info_cate">아이디</td>
                                <td><input data-title="Name" name=id id=id value=${vo.id } readonly></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td data-title="ID" class="info_cate">비밀번호</td>
                                <td><input type=password name="pwd" id="pwd" placeholder="사용중인 비밀번호 입력"></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td data-title="ID" class="info_cate">이름</td>
                                <td><input type=text name=name id=name value=${vo.name }></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td data-title="ID" class="info_cate">전화번호</td>
                                <td><input type=text name=phone id=phone value=${vo.phone }></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td data-title="ID" class="info_cate">이메일</td>
                                <td><input type=text name=email id=email value=${vo.email }></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td data-title="ID" class="info_cate">생일</td>
                                <td><input type=date name=birthday id=birthday data-placeholder=${vo.birthday }></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td data-title="ID" class="info_cate">주소</td>
                                <td>
                                    <input type=text name=zipcode id=zipcode value="${vo.zipcode }" readonly>
                                    <input type=text name=addr1 id=addr1 value="${vo.addr1}">
                                </td>
                                <td class="checkBtn"><input type=button name=zipBtn id=zipBtn class=zipBtn value="우편번호" /></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td data-title="ID" class="info_cate">상세주소</td>
                                <td>
                                    <input type=text name=addr2 id=addr2 value="${vo.addr2 }">                                    
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td data-title="ID" class="info_cate">성별</td>
                                <td data-title="Name">
                                    <input type=radio value="남자" name=gender ${vo.gender=='남자'?"checked":"" }>남자
                                    <input type=radio value="여자" name=gender ${vo.gender=='여자'?"checked":"" }>여자
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                </table>
            </div>
            <div class="bottom-button">
                <input style="margin-left: 300px; margin-right: 0px;" type="submit" class="editBtn" id="editBtn" value="수정하기" >
                <input style="margin-left: 0px; margin-right: 300px;" type="button" class="cancelBtn" id="cancelBtn" value="취소" >
            </div>
        </div>
        </form>

    </main>

</body>
</html>