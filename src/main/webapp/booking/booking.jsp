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
<!-- <script type="text/javascript" src="shadow/js/shadowbox.js"></script> -->


<link rel="stylesheet" href="../booking/bookingdist/booking_style.css">

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

        $(function() {
            //input을 datepicker로 선언
            $("#datepicker").datepicker({
            	dateFormat: 'yy-mm-dd' //Input Display Format 변경
                    ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시 
                    ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시 
                    /* ,changeYear: true //콤보박스에서 년 선택 가능
                    ,changeMonth: true //콤보박스에서 월 선택 가능    */             
                    /* ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                    ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로 */
                    ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                    ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                    ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                    ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                    ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                    ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                    ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                    ,minDate: "+1D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                    ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
            		,beforeShowDay: disableAllTheseDays
            });                    
            
            //초기값을 오늘 날짜로 설정
            $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
        });
        var disabledDays = ["2022-9-9","2022-9-10","2022-9-11","2022-9-12"];
//////////////////////////////////////////////////////////
    	
    	//특정일 선택막기 
    	function disableAllTheseDays(date) { 
    	   var month = date.getMonth(); 
    	   var day = date.getDate();
    	   var year = date.getFullYear(); 
    	   for (i = 0; i < disabledDays.length; i++) { 
    	       if($.inArray(year + '-' +(month+1) + '-' + day,disabledDays) != -1) { 
    	           return [false]; 
    	       } 
    	   } 
    	   return [true];
    	}

 </script>


<style>
 .joincontainer{
    overflow:hidden;
    height:auto;
    color:red;
   }
  .ui-datepicker{
  width: 18em;
  }
  .reserve_1{
  font-size: 20px;
  color: #192F61;
  text-align: center;
  display: inline-block;
  justify-content: space-around;
  margin-top: 13px;
  }
   .reserve_2{
  font-size: 20px;
  color: #192F61;
  text-align: center;
  display: inline-block;
  justify-content: space-around;
  margin-top: -13px;
  margin-bottom: 25px;
  }
</style>
</head>
<body>
<main class="main">

	<!-- partial:index.partial.html -->
	<div class="joincontainer" height=100%>
		<form method="post" action="" name="join_frm" id="join_frm" >
			<h4>선택한 상품 정보</h4>
		
			<div class="row" style="border-bottom: 2px solid #ebebe">

				<img src ="http://${vo.poster }" width=70%>
			    <p class="reserve_1">업체명 : ${vo.store }</p>	
		        <p class="reserve_2">상품명 : ${vo.name } </p><br>	
			
			</div> 
			
			
			
			<h4>예약자 정보</h4>
			<!-- 회원ID -->
			<c:forEach var="vo" items="${list }">
			<div class="row">
				<div class="input-group input-group-icon">
					<input class="row-100" type="text" name=id id=id value="${vo.id }" readonly/>
					<div class="input-icon" style="margin-top : 6px;">
						<i class="fa fa-envelope"></i>
					</div>
				</div>
			</div>
			<!-- 이름 -->
			<div class="row">
				<div class="input-group input-group-icon">
					<input class="row-100" type="text" id="name" name="name" value="${vo.name }" readonly/>
					<div class="input-icon" style="margin-top : 6px; ">
						<i class="fa fa-smile-o"></i>
					</div>
				</div>
			</div>
			
			<!-- 전화번호 -->
			<div class="row">
				<div class="input-group input-group-icon">
					<input class="row-100" type="tel" id=phone name="phone" value="${vo.phone }" readonly/>
					<div class="input-icon" style="margin-top : 6px; ">
						<i class="fa fa-phone"></i>
					</div>
				</div>
			</div>
			<!-- 이메일 -->
			<div class="row">
				<div class="input-group input-group-icon">
					<input class="row-100" type="email" id="email" name="email" value="${vo.email }" readonly/>
					<div class="input-icon" style="margin-top : 6px; ">
						<i class="fa fa-envelope"></i>
					</div>
				</div>
			</div>
			</c:forEach>
			
			<h4>예약</h4>
			<!-- 날짜/시간 -->
			
				<div class="row">
				<!-- 날짜 -->
				<div class="col-half" style="padding-top : 5px">
					 <input type="text" id="datepicker">
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
	<!-- <script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="joindist/script.js"></script> -->
</main>
</body>
</html>
