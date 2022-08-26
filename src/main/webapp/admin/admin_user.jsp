<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="styleshee" href="css/icomoon.css">
<title>[ADMIN] User Info</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script type="text/javascript">
    var alert = function(msg, type) {
        swal({
            title : '',
            text : msg,
            type : type,
            timer : 1500,
            customClass : 'sweet-size',
            showConfirmButton : false
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
        confirm('한번 실행하면 취소할 수 없습니다.', '계정을 삭제할까요?');
    }  
    function Alert() {
        alert('예약을 보류합니다');
    }
        
    
</script>
    
    
<style>
/* 전체 설정 */
.main {
    width : 1200px;
    margin : 160px auto 0 auto;
    font-size  : 12px;
}

/* 페이지 헤더 */
.user_header {
    display : flex;
}
/* 확인 버튼 */
.saveBtn {
    width : 60px;
    height : 30px;
    margin : 0 0 0 auto;
}

/* 버튼 */
.custom-table{
    min-width:900px
}
.custom-table thead tr,.custom-table thead th{
    padding-bottom:30px;
    border-top:none;
    border-bottom:none!important;
    color:#000;
    border-right-width : 10px; 
    border-right-color : transparent;

}
.custom-table tbody th,.custom-table tbody td{
    color:#777;
    font-weight:400;
    padding-bottom:20px;
    padding-top:20px;
    font-weight:300;
    border:none;
    -webkit-transition:.3s all ease;
    -o-transition:.3s all ease;
    transition:.3s all ease
}
.custom-table tbody th small,.custom-table tbody td small{
    color:#b3b3b3;
    font-weight:300
}
.custom-table tbody tr{
    -webkit-transition:.3s all ease;
    -o-transition:.3s all ease;
    transition:.3s all ease
}
.custom-table .td-box-wrap{
    padding:0
}
.custom-table .box{
    background:#fff;
    border-radius:4px;
    margin-top:15px;
    margin-bottom:15px
}
.custom-table .box td,.custom-table .box th{
    border:none!important
}
.custom-control.ios-switch{
    --color:#4cd964;
    padding-left:0
}
.custom-control.ios-switch .ios-switch-control-input{
    display:none
}
.custom-control.ios-switch .ios-switch-control-input:active ~ .ios-switch-control-indicator::after {
    width:20px
}
.custom-control.ios-switch .ios-switch-control-input:checked ~ .ios-switch-control-indicator {
    border:10px solid var(--color)
}
.custom-control.ios-switch .ios-switch-control-input:checked ~ .ios-switch-control-indicator::after {
    top:-8px;
    left:4px
}
.custom-control.ios-switch .ios-switch-control-input:checked:active ~ .ios-switch-control-indicator::after {
    left:0
}
.custom-control.ios-switch .ios-switch-control-input:disabled ~ .ios-switch-control-indicator {
    opacity:.4
}
.custom-control.ios-switch .ios-switch-control-indicator{
    display:inline-block;
    position:relative;
    margin:0 10px;
    top:4px;
    width:32px;
    height:20px;
    background:#fff;
    border-radius:16px;
    -webkit-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
    border:2px solid #ddd
}
.custom-control.ios-switch .ios-switch-control-indicator::after{
    content:'';
    display:block;
    position:absolute;
    width:16px;
    height:16px;
    border-radius:16px;
    -webkit-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
    top:0;
    left:0;
    background:#fff;
    -webkit-box-shadow:0 0 2px #aaa , 0 2px 5px #999;
    box-shadow:0 0 2px #aaa , 0 2px 5px #999
}
.control{
    display:block;
    position:relative;
    margin-bottom:25px;
    cursor:pointer;
    font-size:18px
}
.control input{
    position:absolute;
    z-index:-1;
    opacity:0
}
.control__indicator{
    position:absolute;
    top:2px;
    left:0;
    height:20px;
    width:20px;
    border-radius:4px;
    border:2px solid #ccc;
    background:transparent
}
.control--radio .control__indicator{
    border-radius:50%
}
.control:hover input ~ .control__indicator, .control input:focus ~ .control__indicator {
    border:2px solid #007bff
}
.control input:checked ~ .control__indicator {
    border:2px solid #007bff;
    background:#007bff
}
.control input:disabled ~ .control__indicator {
    background:#e6e6e6;
    opacity:.6;
    pointer-events:none;
    border:2px solid #ccc
}
.control__indicator:after{
    font-family:'icomoon';
    content:'\e5ca';
    position:absolute;
    display:none
}
.control input:checked ~ .control__indicator:after {
    display:block;
    color:#fff
}
.control--checkbox .control__indicator:after{
    top:50%;
    left:50%;
    -webkit-transform:translate(-50%,-52%);
    -ms-transform:translate(-50%,-52%);
    transform:translate(-50%,-52%)
}
.control--checkbox input:disabled ~ .control__indicator:after {
    border-color:#7b7b7b
}
.control--checkbox input:disabled:checked ~ .control__indicator {
    background-color:#007bff;
    opacity:.2;
    border:2px solid #007bff
}

/* 모달 */
/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
</style>
</head>




<body>
	<main class="main">
		<div class="user_header">
			<h2 class="mb-5">회원 정보</h2>

		</div>


		<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">...</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save changes</button>
					</div>
				</div>
			</div>
		</div>



		<div class="user_content">
			<div class="user_container">

				<div class="table-responsive">
					<table class="table table-striped custom-table">
						<thead>
							<tr>
								<th scope="col"><label class="control control--checkbox"><input
										type="checkbox" class="js-check-all" />
										<div class="control__indicator"></div> </label></th>
								<th scope="col">ID</th>
								<th scope="col">Name</th>
								<th scope="col">Email</th>
								<th scope="col">Contact</th>
								<th scope="col">Address</th>
								<th scope="col">JoinDate</th>
								<th scope="col"></th>
							</tr>
						</thead>


						<tbody>
							<c:forEach var="vo" items="${list }">
								<tr scope="row">
									<td><label class="control control--checkbox"><input
											type="checkbox" />
											<div class="control__indicator"></div> </label></td>
									<td>${vo.id }</td>
									<td class="pl-0">
										<div class="d-flex align-items-center">
											<label class="custom-control ios-switch"> <c:if
													test="${vo.admin  == 'y'}">
													<input type="checkbox" id=adminBtn
														class="ios-switch-control-input" onchange="YnCheck(this);"
														checked>
												</c:if> <c:if test="${vo.admin == 'n'}">
													<input type="checkbox" id=adminBtn
														class="ios-switch-control-input">
												</c:if> <span class="ios-switch-control-indicator"></span>
											</label> <a href="#">${vo.name }</a>
										</div>
									</td>
									<td>${vo.email }</td>
									<td>${vo.phone }</td>
									<td>[${vo.zipcode }]<small class="d-block"> ${vo.addr1 } ${vo.addr2 }</small></td>
									<td>${vo.joindate }</td>
									<td><a href="#" class="more" onclick="Confirm();">Delete</a></td>
								</tr>
							</c:forEach>
						</tbody>


					</table>
				</div>
			</div>
		</div>
		<script src="js/admin_user.js"></script>
	</main>
</body>
</html>