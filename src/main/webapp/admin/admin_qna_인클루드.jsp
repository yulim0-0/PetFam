<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>PetFam</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="../assets/img/logo.png" rel="icon">
  <link href="../assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="../assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../assets/css/style.css" rel="stylesheet">

	<link rel="stylesheet" href="css/admin_qna.css">

</head>
<body>
    <!-- ======= Header ======= -->
    <jsp:include page="../main/header.jsp"></jsp:include>
    <!-- End Header -->
    
	<div class="site">
		<a class="skip-link screen-reader-text" href="#content">Skip to content</a>
		<main id="content" class="main-content">
		  <h3>미답변 내역</h3>
            <p></p>
            <c:forEach var="vo" items="${list }">
             
                <table>
                    <tr>
                        <th id="subject"></th>
                        <td onclick="location.href='../admin/admin_qna_sidebar.do'" style="cursor:pointer;">${vo.subject }</td>
                        <th id="id"></th>
                        <td>${vo.id }</td>
                    </tr>
                    
                </table>
            </c:forEach>
			
		</main>

		<aside class="sidebar">
			<%-- <h2>Main content area</h2>
            <p>
                The main content area is where the magic happens. Right now, the main
                content is on the left and the sidebar is on the right. If you go into
                the markup for this document and add
                <code>dir="rtl"</code>
                to the
                <code>html</code>
                element, the two elements will swap spaces because CSS Grid honors text
                direction.
            </p> --%>
            <jsp:include page="${qna_sidebar }"></jsp:include>
			
		</aside>
		<aside class="twin">This should take up half the space</aside>
		<aside class="twin">This should take up the other half of the
			space</aside>
	</div>
	
    <!-- ======= Footer ======= -->
    <jsp:include page="../main/footer.jsp"></jsp:include>
    <!-- End Footer -->
</body>
</html>