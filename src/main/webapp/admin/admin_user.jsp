<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="styleshee" href="css/icomoon.css">
    
    <title>[ADMIN] User Info</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script nonce="14adec1a-1bec-47e6-a200-8b20ea03d768">
      (function(w, d) {
        ! function(a, e, t, r) {
          a.zarazData = a.zarazData || {};
          a.zarazData.executed = [];
          a.zaraz = {
            deferred: []
          };
          a.zaraz.q = [];
          a.zaraz._f = function(e) {
            return function() {
              var t = Array.prototype.slice.call(arguments);
              a.zaraz.q.push({
                m: e,
                a: t
              })
            }
          };
          for (const e of ["track", "set", "ecommerce", "debug"]) a.zaraz[e] = a.zaraz._f(e);
          a.zaraz.init = () => {
            var t = e.getElementsByTagName(r)[0],
              z = e.createElement(r),
              n = e.getElementsByTagName("title")[0];
            n && (a.zarazData.t = e.getElementsByTagName("title")[0].text);
            a.zarazData.x = Math.random();
            a.zarazData.w = a.screen.width;
            a.zarazData.h = a.screen.height;
            a.zarazData.j = a.innerHeight;
            a.zarazData.e = a.innerWidth;
            a.zarazData.l = a.location.href;
            a.zarazData.r = e.referrer;
            a.zarazData.k = a.screen.colorDepth;
            a.zarazData.n = e.characterSet;
            a.zarazData.o = (new Date).getTimezoneOffset();
            a.zarazData.q = [];
            for (; a.zaraz.q.length;) {
              const e = a.zaraz.q.shift();
              a.zarazData.q.push(e)
            }
            z.defer = !0;
            for (const e of [localStorage, sessionStorage]) Object.keys(e || {}).filter((a => a.startsWith("_zaraz_"))).forEach((t => {
              try {
                a.zarazData["z_" + t.slice(7)] = JSON.parse(e.getItem(t))
              } catch {
                a.zarazData["z_" + t.slice(7)] = e.getItem(t)
              }
            }));
            z.referrerPolicy = "origin";
            z.src = "/cdn-cgi/zaraz/s.js?z=" + btoa(encodeURIComponent(JSON.stringify(a.zarazData)));
            t.parentNode.insertBefore(z, t)
          };
          ["complete", "interactive"].includes(e.readyState) ? zaraz.init() : a.addEventListener("DOMContentLoaded", zaraz.init)
        }(w, d, 0, "script");
      })(window, document);
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
            <h2 class="mb-5">User Information</h2>
            <button id=saveBtn class=saveBtn type="submit">Save</button>
        </div>
    
    <div class="user_content">
      <div class="user_container">
       
        <div class="table-responsive">
          <table class="table table-striped custom-table">
            <thead>
              <tr>
                <th scope="col">
                    <label class="control control--checkbox"><input type="checkbox" class="js-check-all" />
                        <div class="control__indicator"></div>
                    </label></th>
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">Occupation</th>
                <th scope="col">Contact</th>
                <th scope="col">Address</th>
                <th scope="col"></th>
              </tr>
            </thead>
            
            
            <tbody>
                <c:forEach var="vo" items="${list }">
	              <tr scope="row">
                    <td>
	                   <label class="control control--checkbox"><input type="checkbox" />
	                       <div class="control__indicator"></div>
	                   </label>
                    </td>
	                <td>${vo.id }</td>
	                <td class="pl-0">
	                  <div class="d-flex align-items-center">
	                    <label class="custom-control ios-switch">
	                    
	                    
	                    <c:if test="${vo.admin  == 'y'}">
	                       <input type="checkbox" id=adminBtn class="ios-switch-control-input" checked>
	                       
	                    <div id="modal-container">
						  <div class="modal-background">
						    <div class="modal">
						      <h2>I'm a Modal</h2>
						      <p>Hear me roar.</p>
						      <button type="button">확인</button>
						      <svg class="modal-svg" xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" preserveAspectRatio="none">
						        <rect x="0" y="0" fill="none" width="226" height="162" rx="3" ry="3"></rect>
						            </svg>
						    </div>
						  </div>
						</div>
                 
	                    </c:if>
	                    
	                   <c:if test="${vo.admin == 'n'}">
                           <input type="checkbox" id=adminBtn class="ios-switch-control-input">
                        </c:if>
                        
                        
	                   <span class="ios-switch-control-indicator"></span>
	                    </label>
	                    <a href="#">${vo.name } ${vo.admin }</a></div>
	                </td>
	                <td>Web Designer <small class="d-block">Far far away, behind the word mountains</small></td>
	                <td>${vo.phone }</td>
	                <td>[${vo.zipcode }] ${vo.addr1 } ${vo.addr2 }</td>
	                <td><a href="#" class="more">Details</a></td>
	              </tr>
              </c:forEach>
            </tbody>
            
            
          </table>
        </div>
      </div>
    </div>
    <script src="js/admin_user.js"></script>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js+bootstrap.min.js+main.js.pagespeed.jc.DNp8q8Nv6O.js"></script>
    <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v652eace1692a40cfa3763df669d7439c1639079717194" 
        integrity="sha512-Gi7xpJR8tSkrpF7aordPZQlW2DLtzUlZcumS8dMQjwDHEnw9I7ZLyiOj/6tZStRBGtGgN6ceN6cMH8z7etPGlw==" 
        data-cf-beacon='{"rayId":"73f01bf9ba5bc062","token":"cd0b4b3a733644fc843ef0b185f98241","version":"2022.8.0","si":100}' 
        crossorigin="anonymous">
    </script>
  </main>
  </body>
</html>