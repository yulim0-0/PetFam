<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.sist.dao.BookingDAO"%>
<%@page import="com.sist.vo.BookingVO"%>
<%@page import="org.apache.ibatis.annotations.Param"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    
    BookingDAO dao=new BookingDAO();
    Cookie[] cookies=request.getCookies(); //쿠키 읽기
    List<BookingVO> bList=new ArrayList<BookingVO>();
    if(cookies!=null)
    {
        for(int i=cookies.length-1;i>=0;i--) // 최신부터 출력 
        {
            if(cookies[i].getName().startsWith("booking")) //movie1
            {
                String o_no=cookies[i].getValue();// 1
                BookingVO vo=dao.hospitalDetailData(Integer.parseInt(o_no));
                bList.add(vo);
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

</head>

<body>
<footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6 footer-contact">
            <h3>쌍용교육센터</h3>
            <p>
              Teheranro 132, 8F <br>
              Seoul, Gangnam 06235<br>
              South Korea <br><br>
              <strong>Phone:</strong> +82 0507 1316 4632<br>
              <strong>Site:</strong> <a href="https://www.sist.co.kr/index.jsp">https://www.sist.co.kr</a><br>
            </p>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>페이지 바로가기</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="../main/main.do">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="../booking/hospital_list.do">Booking</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="../petplace/cafe.do">Recommendation</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="../pboard/list.do">Community</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="../mypage/myinfo.do">MyPage</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>최근 확인 병원</h4>
            <ul>
			<%
			int k = 0;
			for (BookingVO vo : bList) {
				if (k > 6)
					break;
			%>
            <li><i class="bx bx-chevron-right"></i> <a href="../booking/hos_detail.do?o_no=<%=vo.getO_no()%>"><%=vo.getStore() %></a></li>
			<%
			k++;
			}
			%>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Social Networks</h4>
            <p style="word-break:break-all">해당 버튼을 클릭하시면 직원들의 GitHub으로 연결 됩니다. 더 많은 정보는 문의하기를 이용해주세요</p>
            <div class="social-links mt-3">
              <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
              <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
              <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
              <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
              <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
            </div>
          </div>

        </div>
      </div>
    </div>

    <div class="container py-4">
      <div class="copyright">
        &copy; Copyright <strong><span>Ninestars</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/ninestars-free-bootstrap-3-theme-for-creative/ -->
        Designed and Programmed by <a href="https://github.com/sistteamtuna">TeamTuna</a>
      </div>
    </div>
  </footer>
</body>
</html>