<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" >
<head>
<meta charset="UTF-8">
<title>[ADMIN]User List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="https://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.3.0.min.js"></script>
<script src="https://unpkg.com/jquery-tablesortable"></script>
<link rel="stylesheet" href="css/admin_user.css">
<script>
	function autoIncrement(startnum){
		var init=startnum;
		var td_list=document.getElementsByClassName("autoInc");
		for(var i=0;i<td.length; i++){
			init++;
			td_list[i].innerhTML="&nbsp"+init;
		}};
		autoIncrement(0);
</script>


</head>
<body>
<main class=main>
<!-- partial:index.partial.html -->
<div class="container" data-ng-app="myApp" data-ng-controller="myCtrl">
    <div class="row mt-5">
      <p class="text-center col-md-12">For Movie s and Web series <a class="btn btn-link" href="https://www.tinyurl.com/sree74pdisk" target='_blank'> Click here</a></p>
      <div class="col-md-2">
        Search:
      </div>
      <div class="col-md-10">
        <input type="text" class="search form-control form-control-md" data-ng-model="table" />
      </div>
    </div>
    
    <table id="myTable" class="table table-bordered table-striped table-hover table-sm mt-4">
	<thead>
      <tr>
	   <th class="nosort">Sr.No</th>
        <th>Name</th>
        <th>Join Date</th>
        <th class="nosort">Admin</th>
        <th class="nosort">Detail</th>
      </tr>
	  </thead>
	  <c:forEach var="vo" items="${list }">
		  <tbody>
	      <tr data-ng-repeat="pdiskmovie in people | filter: table">
		    <td class=autoInc></td>
	        <td>${vo.id }</td>
	        <td>${vo.joindate }</td>
			<td>${vo.admin }</td>
	        <td><a href={{pdiskmovie.share_link}} class="btn-primary btn-sm btn" target="_blank">Link</a></td>
	      </tr>
		  </tbody>
	  </c:forEach>
    </table>
    <div class="mb-4" data-pagination="" data-num-pages="numPages()" data-current-page="currentPage" data-max-size="maxSize" data-boundary-links="true"></div>
  </div>
<!-- partial -->
  <script  src="js/admin_user.js"></script>
</main>
</body>
</html>
