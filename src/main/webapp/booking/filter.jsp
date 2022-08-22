<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>filter form</title>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="shadow/js/shadowbox.js"></script>

<link rel="stylesheet" href="../booking/filterdist/filter_style.css">
<link rel="stylesheet" href="../booking/searchdist/search_style.css">
<link rel="stylesheet" href="shadow/css/shadowbox.css">


</head>
<body>
<main class="main">
	<!-- partial:index.partial.html -->
	<div class="joincontainer">
		<!-- <form method="post" action="../user/join_ok.do" name="join_frm" id="join_frm" > -->
			<h4>병원 예약</h4>
			<!-- <div class="row">
				생년월일
				<div class="col-half" style="padding-top: 5px">
					<form class="search-container">
						<input type="text" id="search-bar"
							placeholder="What can I help you with today?"> <a
							href="#"><img class="search-icon"
							src="http://www.endlessicons.com/wp-content/uploads/2012/12/search-icon.png"></a>
					</form>
				</div>

				성별
				<div class="col-half">
					<div class="input-group">
						<input id="gender-male" type="radio" name="gender" value="남자" checked/>
						<label for="gender-male">Male</label> 
						<input id="gender-female" type="radio" name="gender" value="여자" /> 
						<label for="gender-female">Female</label>
					</div>
				</div>
			</div> -->

			<!-- 동의사항 -->
			<div class="row">
				<div class="input-group">
					<form class="search-container">
						<input type="text" id="search-bar"
							placeholder="병원명 검색">
							<a href="#"><img class="search-icon"
							src="http://www.endlessicons.com/wp-content/uploads/2012/12/search-icon.png"></a>
					</form>
				</div>
			</div>
			<!-- 동의사항 -->
			<div class="row">
			<h4>지역선택</h4>
			<div class="input-group" >
					<input type="checkbox" id="faa"> <label for="faa" style="display: inline-block; text-align: center; margin-left: 20px">서울&nbsp;</label>
					<input type="checkbox" id="fbb"> <label for="fbb" style="display: inline-block; text-align: center; margin-left: 20px">인천&nbsp;</label>
					<input type="checkbox" id="fcc"> <label for="fcc" style="display: inline-block; text-align: center; margin-left: 20px">경기&nbsp;</label>
					<input type="checkbox" id="fdd"> <label for="fdd" style="display: inline-block; text-align: center; margin-left: 20px">충청&nbsp;</label>
					<input type="checkbox" id="fee"> <label for="fee" style="display: inline-block; text-align: center; margin-left: 20px">대전&nbsp;</label>
					<input type="checkbox" id="fff"> <label for="fff" style="display: inline-block; text-align: center; margin-left: 20px">전라&nbsp;</label>
					<input type="checkbox" id="fgg"> <label for="fgg" style="display: inline-block; text-align: center; margin-left: 20px">경상&nbsp;</label>
				</div>
				</div>
				
			<!-- 동의사항 -->
			<div class="row">
			<h4>항목선택</h4>
			<div class="input-group" >
					<input type="checkbox" id="faaa"> <label for="faaa" style="display: inline-block; text-align: center; margin-left: 20px">중성화&nbsp;</label>
					<input type="checkbox" id="fbbb"> <label for="fbbb" style="display: inline-block; text-align: center; margin-left: 20px">스케일링&nbsp;</label>
					<input type="checkbox" id="fccc"> <label for="fccc" style="display: inline-block; text-align: center; margin-left: 20px">안과수술&nbsp;</label>
					<input type="checkbox" id="fddd"> <label for="fddd" style="display: inline-block; text-align: center; margin-left: 20px">슬개골 탈구&nbsp;</label>
					<input type="checkbox" id="feee"> <label for="feee" style="display: inline-block; text-align: center; margin-left: 20px">반려견접종&nbsp;</label>
					<input type="checkbox" id="ffff"> <label for="ffff" style="display: inline-block; text-align: center; margin-left: 20px">반려묘접종&nbsp;</label>
					<input type="checkbox" id="fggg"> <label for="fggg" style="display: inline-block; text-align: center; margin-left: 20px">심장사상충접종&nbsp;</label>
					<input type="checkbox" id="fhhh"> <label for="fhhh" style="display: inline-block; text-align: center; margin-left: 20px">건강검진&nbsp;</label>
					<input type="checkbox" id="fiii"> <label for="fiii" style="display: inline-block; text-align: center; margin-left: 20px">혈액검사&nbsp;</label>
					<input type="checkbox" id="fjjj"> <label for="fjjj" style="display: inline-block; text-align: center; margin-left: 20px">피부알러지검사&nbsp;</label>
					<input type="checkbox" id="fkkk"> <label for="fkkk" style="display: inline-block; text-align: center; margin-left: 20px">심장사상충검사&nbsp;</label>
				</div>
				<!-- <div class="col-33">
				<div class="input-group" >
				 <h5 style="display: block; text-align: center">수술/치료</h5>
					<input type="checkbox" id="faaa"> <label for="faaa" style="display: block; text-align: center">중성화</label>
					<input type="checkbox" id="fbbb"> <label for="fbbb" style="display: block; text-align: center">스케일링</label>
					<input type="checkbox" id="fccc"> <label for="fccc" style="display: block; text-align: center">안과수술</label>
					<input type="checkbox" id="fddd"> <label for="fddd" style="display: block; text-align: center">슬개골 탈구</label>
				</div>
				</div>
				<div class="col-33">
				<div class="input-group" >
				 <h5 style="display: block;  text-align: center">예방접종</h5>
					<input type="checkbox" id="feee"  style="display: block; text-align: center"> <label for="feee" >반려견</label>
					<input type="checkbox" id="ffff"  style="display: block; text-align: center"> <label for="ffff" >반려묘</label>
					<input type="checkbox" id="fggg"  style="display: block; text-align: center"> <label for="fggg" >심장사상충</label>
				</div>
				</div>
				<div class="col-33">
				<div class="input-group" >
				 <h5 style="display: block;  text-align: center">건강검진</h5>
					<input type="checkbox" id="fhhh"> <label for="fhhh" >건강검진</label>
					<input type="checkbox" id="fiii"> <label for="fiii" >중성화</label>
					<input type="checkbox" id="fjjj"> <label for="fjjj" >스케일링</label>
					<input type="checkbox" id="fkkk"> <label for="fkkk" >안과수술</label>
					<input type="checkbox" id="flll"> <label for="flll" >슬개골 탈구</label>
				</div>
				</div> -->
			</div>


			<!-- 확인 및 취소 -->
			<!-- <div>
				<div class="col-16"></div>
				<input class="col-33" style="float:center; margin-left:10px;" type="button" value="취소" onclick="javascript:history.back()">
				<input class="col-33" style="float:center; margin-right:10px;" type="button" id="joinBtn" value="회원가입" />
				<div class="col-16"></div>
			</div> -->
		</form>
	</div>
	<!-- partial -->
	<!-- <script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="js/join.js"></script> -->
</main>
</body>
</html>
