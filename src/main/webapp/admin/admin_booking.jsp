<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ADMIN] Booking Confirmation</title>
<link rel="stylesheet" href="css/admin_booking.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<style>
 .pagination {
    margin: 20px 0;
    overflow: hidden;
    position: relative;
    max-width : fit-content;
}
.pagination li {
    float: left;
}
.pagination ul {
    float: left;
    left: 50%;
    position: relative;
}
.pagination ul > li {
    left: -50%;
    position: relative;
}
.pagination li a {
    transition: all 100ms ease-in-out 0s;
    background-color: transparent;
    border-radius: 5px 5px 5px 5px;
    color: #69696E;
    display: block;
    font: 16px/30px Noto Sans KR, sans-serif;
    height: 30px;
    margin: 0 3px;
    overflow: hidden;
    position: relative;
    text-align: center;
    text-decoration: none;
    width: 30px;
}
.pagination li a:hover {
    background-color: #F34100;
    color: #FFFFFF;
}
.pagination li.active a {
    background-color: #F34100;
    color: #FFFFFF;
}
.pagination li.active a:hover {
    color: #F34100;
}
</style>
<script type="text/javascript">
var alert = function(title, type) {
	swal({
		title : title,
		text : '',
		type : type,
		timer : 5000,
		customClass : 'sweet-size',
		showConfirmButton : true
	});
}
var stop = function(msg, title, type){
        swal({
              title : title,
              text : msg,
              type : type,
              timer : 5000,
              customClass : 'sweet-size',
              showConfirmButton : true
          })
      }
	var confirm = function(msg, title, resvNum) {
		swal({
			title : title,
			text : msg,
			type : "warning",
			showCancelButton : true,
			confirmButtonClass : "btn-danger",
			confirmButtonText : "Y",
			cancelButtonText : "N",
			closeOnConfirm : false,
			closeOnCancel : true,
		}, function(isConfirm) {
			if (isConfirm) {
				var oi_no=document.getElementById('oi_no').value;
				location.href="../admin/admin_booking_ok.do?oi_no="+oi_no
				swal('', '예약이 승인되었습니다.', "success");
			}
			else {
				swal('', '예약이 승인이 취소되었습니다.', "warning",{
					closeOnClickOutside : true,
					closeOnEsc : true,
					buttons : {
						confirm : {
							text : 'OK',
							value : true
						}
					}
				});
			}
		});
	}
	
	var cancel = function(msg, title, resvNum) {
        swal({
            title : title,
            text : msg,
            type : "warning",
            showCancelButton : true,
            confirmButtonClass : "btn-danger",
            confirmButtonText : "Y",
            cancelButtonText : "N",
            closeOnConfirm : false,
            closeOnCancel : true
        }, function(isConfirm) {
            if (isConfirm) {
            	var oi="";
                var oi=document.getElementById('oi').value;
                location.href="../admin/admin_cancel.do?oi_no="+oi
                swal('', '예약이 취소되었습니다.', "success");
            }
            else {
                swal('', '취소에 실패하였습니다.', "failed");
            }

        });
    }

	function Cancel() {
		cancel('', '예약을 취소할까요?');
	}
	function Confirm() {
		confirm('한번 승인하면 취소할 수 없습니다.', '예약을 승인할까요?');
	}  
	function Alert() {
        alert('예약을 보류합니다');
    }
	    
	
</script>
</head>
<body>
	<main class="main">
		<h1 style="text-align: center;">예약 관리<br /> <span class="badge badge-pill badge-primary"
				style="text-align: center;">Booking Management</span>
		</h1>
		<p style="text-align: center;"></p>

		<section class="card__list row" style="padding-bottom:160px; padding-top:20px;">
			<c:forEach var="vo" items="${list }">
				<!-- /card__box -->
				<div class="cards col-md-6 col-sm-12" style="width:650px; margin: 0 auto;">
					<div class="card">

						<div style="float: left">
							<img class="card__image" src="http://${vo.poster }">
						</div>

						<div style="display: flex">
							<div class="card-title">
								<a href="#" class="toggle-info btn"> <span class="left"></span>
									<span class="right"></span>
								</a>

								<div style="width:70%; float:left;">
									<h2>${vo.store }
										<small>${vo.name }</small>
									</h2>
								</div>
                                <div>
								    <input type="hidden" name=oi_no id=oi_no value="${vo.oi_no }">
									<c:if test="${vo.state=='n' }">
										<a class="">승인대기</a>
									</c:if>
									<c:if test="${vo.state=='y' }">
										<span class="">승인완료</span>
									</c:if>
								</div>
								
								<div>
								    
								</div>
								
								
                                <p class="card__description">
                                    ${vo.msg }
                                </p>

								<div class="card__bottom">
									<div class="options">
										<span class="date"><i class="fa fa-calendar" aria-hidden="true"></i>
                                        ${vo.order_date }   ${vo.order_time }
										</span> 
										<span class="category">
										  <i class="fa fa-tag" aria-hidden="true"></i>
										</span>
									</div>
									<div class="card__price">
									   <input type="hidden" value="${vo.price }" id=price>
									   <script>
		                                var n1 = document
		                                        .getElementById("price").value;
		
		                                function numberWithCommas(x) {
		                                    return x
		                                            .toString()
		                                            .replace(
		                                                    /\B(?=(\d{3})+(?!\d))/g,
		                                                    ",");
		                                }
		                                numberWithCommas(n1);
		                                document
		                                        .write(numberWithCommas(n1));
			                            </script> 원
									</div>
								</div>



							</div>
						</div>

						<div class="card-flap flap1">
							<div class="card-description"></div>
							<div class="card-flap flap2">
								<div class="card-actions">
								<div style="text-align : left">
								    예약자 아이디 : ${vo.id } <br>
								    예약자 이름 :    <br>
								    예약자 연락처 : 
								</div>
									<c:if test="${vo.state=='n' }">
                                        <button class="btn" onclick="Confirm();" style="color:red; border:solid 0.5px;">승인</button>
                                        <button class="btn" onclick="Alert();" style="color:darkgreen; border:solid 0.5px;">보류</button>
                                    </c:if>
                                    <c:if test="${vo.state=='y' }">
                                        <!-- <button class="btn" onclick="Cancel();">취소</button> -->
                                    </c:if>

								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- /card__box -->
    
			</c:forEach>
		</section>
		
       <div class="container" align="center">
			<ul class="pagination">
				<c:if test="${startPage>1 }">
					<li><a href="../admin/admin_booking.do?page=${startPage-1 }">&laquo;</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${i==curpage }">
					   <li class="active" ><a href="../admin/admin_booking.do?page=${i }">${i }</a></li>
					</c:if>
					<c:if test="${i!=curpage }">
					   <li><a href="../admin/admin_booking.do?page=${i }">${i }</a></li>
					</c:if>
				</c:forEach>
				
				<c:if test="${endPage<totalpage }">
					<li><a href="../admin/admin_booking.do?page=${endPage+1 }">&raquo;</a></li>
				</c:if>
			</ul>
		</div>


		<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
		<script src='//cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js'></script>
		<script src="js/admin_booking.js"></script>
	</main>
</body>
</html>