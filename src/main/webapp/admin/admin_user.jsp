<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" >
<head>
	<meta charset="UTF-8">
	<title>CodePen - Bootstrap Table - Filter control</title>
	<link rel="stylesheet" href="https://use.typekit.net/evl6ifb.css">
	<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.0/bootstrap-table.min.css'>
	<link rel='stylesheet' href='//rawgit.com/vitalets/x-editable/master/dist/bootstrap3-editable/css/bootstrap-editable.css'>
	<link rel="stylesheet" href="admin_user_dist/style.css">
</head>

<body>
<!-- partial:index.partial.html -->
<main class="main">
	
		<div class="container">
	<h1>User List</h1>
	<p> Mémo pour les options du Bootstrap Table : <a href="http://bootstrap-table.wenzhixin.net.cn/documentation/">Bootstrap Table Documentation</a></p>
	<p>Eléments de Bootstrap Table utilisés : <a href="http://jsfiddle.net/wenyi/e3nk137y/3178/">Data Checkbox</a>
	, pour cocher les éléments à sélectionner, 
	<a href="https://github.com/wenzhixin/bootstrap-table-examples/blob/master/extensions/filter-control.html">
	extension Filter control</a>, pour les filtres via les colonnes, 
	<a href="https://github.com/kayalshri/tableExport.jquery.plugin">extension Data export</a> pour exporter</p>
	
	<div id="toolbar">
			<select class="form-control">
					<option value="">Export Basic</option>
					<option value="all">Export All</option>
					<option value="selected">Export Selected</option>
			</select>
	</div>
	
	<table id="table" 
				 data-toggle="table"
				 data-search="true"
				 data-filter-control="true" 
				 data-show-export="true"
				 data-click-to-select="true"
				 data-toolbar="#toolbar">
		<thead>
			<tr>
				<th data-field="state" data-checkbox="true"></th>
				<th data-field="prenom" data-filter-control="input" data-sortable="true">이름</th>
				<th data-field="date" data-filter-control="select" data-sortable="true">가입 날짜</th>
				<th data-field="examen" data-filter-control="select" data-sortable="true">권한</th>
				<th data-field="note" data-sortable="true">노트</th>
				
			</tr>
		</thead>
		<tbody>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td class="bs-checkbox "><input data-index="0" name="btSelectItem" type="checkbox"></td>
				<td>${vo.id }</td>
				<td>${vo.joindate }</td>
				<td>${vo.admin }</td>
				<td onClick="location.href='../admin/admin_user_detail.do?no=${vo.name }'" style="cursor:pointer;">상세보기</td>
				<td><input type="button" value="상세보기"></td>
				
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
</main>

<!-- partial -->
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.0/bootstrap-table.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.9.1/extensions/editable/bootstrap-table-editable.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.9.1/extensions/export/bootstrap-table-export.js'></script>
<script src='//rawgit.com/hhurz/tableExport.jquery.plugin/master/tableExport.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.9.1/extensions/filter-control/bootstrap-table-filter-control.js'></script>
<script src="admin_user_dist/script.js"></script>

</body>
</html>
