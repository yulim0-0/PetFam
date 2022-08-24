<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>UserList</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="css/admin_user_indigo-pink.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
<link rel="stylesheet" href="css/admin_user.css">
<link rel="stylesheet" href="css/admin_user_del.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

<script type="text/javascript">
let i=0;
let u=0;
/*
$(function(){
    $('#delBtn').on("click",function(){
        let pwd=$('#del_pwd').val();
        if(pwd.trim()=="")
      	{
      	 alert('사용자 삭제를 위해서는 관리자의 비밀번호가 필요합니다. 비밀번호를 입력하여 주세요.');
      	 $('#del_pwd').focus();
      	 return;
      	}
        $.ajax({
		    type:'post',
		    url:'../admin/admin_user_del.do',
		    data:{"pwd":pwd},
		    success:function(result)
		    {
		        let res=result.trim();
		        if(res==="yes")
		        {
		            alert('정상 삭제 처리 되었습니다.');
		            location.href="../admin/admin_user.do";
		        }
		        else
		        {
		           alert("비밀번호 오류");
		           $('#del_pwd').val("");
		           $('#del_pwd').focus();
		        }
		    }
		})
    })
})
*/
</script>
</head>
<body>
<!-- 	<div id="modal-container">
		<div class="modal-background">
			<div class="modal">
				<h2>삭제 확인 비밀번호</h2>
				<input type="password" placeholder="비밀번호">
				<svg class="modal-svg" xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" preserveAspectRatio="none">
                    <rect x="0" y="0" fill="none" width="226"height="162" rx="3" ry="3"></rect>
                </svg>
                <button>확인</button>
			</div>
		</div>
	</div>
	<div class="modalcontent">
		<h1>Modal Animations</h1>
		<div class="buttons">
			<div id="one" class="button">Unfolding</div>

		</div>
	</div> -->


	<!-- partial:index.partial.html -->
	<div class="app-page" ng-app="clientsApp" ng-controller="ClientsCtrl">
		<div class="mdl-grid">
			<div class="mdl-cell mdl-cell--12-col">
				<div class="mdl-textfield mdl-js-textfield">
					<input class="mdl-textfield__input" type="text" ng-model="search">
					<label class="mdl-textfield__label" for="sample1">Search...</label>
				</div>
			</div>
			<div class="mdl-cell mdl-cell--9-col">
				<form method="post" action="../admin/admin_user_del.do" name="del_frm" id="del_frm">
					<table style="" class="mdl-data-table mdl-data-table_full mdl-js-data-table mdl-shadow--4dp">
						<colgroup>
							<col style="width: 1px" />
							<col style="width: 1px" />
							<col />
							<col style="width: 128px" />
							<col style="width: 128px" />
							<col style="width: 128px" />
						</colgroup>
						
						<thead>
							<tr>
								<th>
									<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect">
										<input type="checkbox" class="mdl-checkbox__input">
									</label>
								</th>
								<th>ID</th>
								<th>Name</th>
								<th class="mdl-data-table__cell--non-numeric">Address</th>
								<th>BirthDay</th>
								<th>JoinDate</th>
								<th class="controls mdl-data-table__cell--non-numeric">Actions</th>
							</tr>
						</thead>
						
						<c:forEach var="vo" items="${list }">
							<tbody ng-repeat="client in clients | filter:search">
								<tr ng-if="client != activeClient">
									<td><mdl-checkbox></mdl-checkbox></td>
									<td>${vo.id }<input type=hidden name=id id=id value="${vo.id }"></td>
									<td>${vo.name }
									<td class="mdl-data-table__cell--non-numeric">[${vo.zipcode }] ${vo.addr1 } ${vo.addr2 }</td>
									<td>${vo.birthday }
									<td>${vo.joindate }</td>
									
									
<!-- 									<td class="controls mdl-data-table__cell--non-numeric">
 -->
 <td>
<!--  
 										<button style="background:#192f61;" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect" 
										      id="editBtn" name="editBtn" ng-click="edit(client)">Edit</button>
										<button style="background:#f34100;"class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent mdl-js-ripple-effect" 
										      id="delBtn" name="delBtn" onclick="openModal()">Delete</button>
                                     -->
										<button id="myBtn">Open Modal</button> <!-- The Modal -->
										<div id="myModal" class="modal">

											<!-- Modal content -->
											<div class="modal-content">
												<span class="close">&times;</span>
												<p>Some text in the Modal..</p>
											</div>

										</div> <!--
										<div class="modal-container">
											<input id="modal-toggle" type="checkbox"> 
											     <label class="modal-btn" for="modal-toggle" >Delete</label> 
											     <label class="modal-backdrop" for="modal-toggle"></label>
                                                <div class="modal-content">
												    <label class="modal-close" for="modal-toggle">&#x2715;</label>
												<h2>계정 삭제 확인</h2>
												<hr />
												<p><input type="password" placeholder="Password" id=del_pwd></p>
												<label class="modal-content-btn" for="modal-toggle" id=delBtn name=delBtn>OK</label>
											</div>
										</div>
-->
                                    </td>
									
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</form>
			</div>
			
			
			<!-- <div class="mdl-cell mdl-cell--3-col">
				<form class="mdl-card mdl-shadow--2dp" novalidate role="form"
					name="clientForm">
					<div class="mdl-card__title mdl-card--expand">
						<h2 class="mdl-card__title-text">Create User</h2>
					</div>
					<div class="mdl-card__supporting-text">
						<div
							class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" name="name"
								ng-model="newClient.name" required> <label
								class="mdl-textfield__label" for="">Name:</label> <span
								class="mdl-textfield__error"
								ng-show="clientForm.name.$error.required">Name is
								required</span>
						</div>
						<div
							class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="number"
								ng-model="newClient.age" name="age" required max="100" min="1">
							<label class="mdl-textfield__label" for="">Age:</label> <span
								class="mdl-textfield__error"
								ng-show="clientForm.age.$error.required">Age is required</span>
							<span class="mdl-textfield__error"
								ng-show="clientForm.age.$error.integer">Age should be an
								integer</span> <span class="mdl-textfield__error"
								ng-show="clientForm.age.$error.min">Age should be greater
								than 1</span> <span class="mdl-textfield__error"
								ng-show="clientForm.age.$error.max">Age should be lesser
								than 100</span>
						</div>
						<div
							class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="number"
								ng-model="newClient.percentage" name="percentage" required
								max="1" min="0"> <label class="mdl-textfield__label"
								for="">Percentage:</label> <span class="mdl-textfield__error"
								ng-show="clientForm.percentage.$error.required">Percentage
								is required</span> <span class="mdl-textfield__error"
								ng-show="clientForm.percentage.$error.min">Percentage
								should be greater than 0</span> <span class="mdl-textfield__error"
								ng-show="clientForm.percentage.$error.max">Percentage
								should be lesser than 1</span>
						</div>
					</div>
					<div class="mdl-card__actions mdl-card--border">
						<button class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" ng-click="create()" ng-disabled="clientForm.$invalid">
						Save
						</buttin>
					</div>
				</form>
			</div> -->
		</div>
	</div>
	<!-- partial -->
	<script src='https://storage.googleapis.com/code.getmdl.io/1.0.4/material.min.js'></script>
	<script src='https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js'></script>
	<script src="js/admin_user_del.js"></script>
	<script>
/* 	$('.delBtn').click(function(){
		  var buttonId = $(this).attr('id');
		  $('#modal-container').removeAttr('class').addClass(buttonId);
		  $('body').addClass('modal-active');
		})

		$('#modal-container').click(function(){
		  $(this).addClass('out');
		  $('body').removeClass('modal-active');
		}); */
	</script>
	
	
</main>
</body>
</html>
