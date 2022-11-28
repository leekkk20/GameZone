<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>GameZone | 새로운 게임 등록</title>
   <link rel="stylesheet" type="text/css" href="resources/css/myStyle.css">
   <link rel="stylesheet" href="resources/css/owl.carousel.css" />
   <link rel="stylesheet" href="resources/css/style.css" />
   <link rel="stylesheet" href="resources/css/animate.css" />
   <link rel="shortcut icon" href="resources/img/icon2.ico">
   <script src="resources/js/jquery-3.2.1.min.js"></script>
   <script>
      function insertGame() {

         if (confirm("게임을 등록하시겠습니까? (Yes : 확인 / No : 취소)")) {
            alert('게임을 등록하겠습니다.');
            return true;
            
         } else {
            alert('등록이 취소되었습니다.');
            return false;
         }
      } // insertGame
   </script>
</head>
<body>
	<!-- Header section -->
   	<header class="header-section">
    	<div>
        	<!-- logo -->
         	<a class="site-logo" href="home">
	        	<img src="resources/img/logo22.png" alt="gamelogo">
	        </a>
         	<!-- site menu -->
         	<nav class="main-menu">
            	<ul>
               		<li><a href="home">Home</a></li>
               		<li><a href="axPcGame">PC 게임조회</a></li>
               		<li><a href="axMobileGame">모바일 게임조회</a></li>
	               	<li><a href="axFlashGame">플래시 게임</a></li>
	               	<li><a href="boardList">자유 게시판</a></li>
	               	<li><a href="qnaBoardList">Q&amp;A</a></li>
            	</ul>
         	</nav>
         	<div class="user-panel">
            	<c:choose>
               		<c:when test="${not empty loginID && loginID != 'admin'}">
                  		<a href="detailUser">내 정보 보기</a> / <a href="logout">로그아웃</a>
               		</c:when>
               		<c:when test="${loginID == 'admin'}">
                  		<a href="userList">회원 리스트</a> / <a href="logout">로그아웃</a>
               		</c:when>
               		<c:otherwise>
                  		<a href="loginUser">로그인</a> / <a href="joinForm">회원가입</a>
               		</c:otherwise>
            	</c:choose>
         	</div>
      	</div>
   	</header>
   	<!-- Header section end -->
	<form action="insertPcGame" id="insert_game_form" method="post" enctype="multipart/form-data">
		<table id="insert_game">
			<tr class="insert_game_row">
				<th>게임 사진</th>
               	<td style=" vertical-align: bottom;">
                  	<img src="" class="new_img"><br>
                  	<input type="file" name="uploadimgfile" id="uploadimgfile">
                  	<script>
                    	$('#uploadimgfile').change(function() {
                       		if(this.files && this.files[0]) {
                       			var reader = new FileReader;
                       			reader.readAsDataURL(this.files[0]);
                       			reader.onload = function(e) {
                          			$(".new_img").attr("src", e.target.result).width(233).height(303);
                        		} // onload_function
                       		} // if
                     	}); // change
                  	</script>
                </td>
            </tr>
            	
        	<tr>
           		<th>장르</th>
           		<td><input type="text" name="category" placeholder="카테고리(영문) 예) action, rpg"></td>
        	</tr>
  
        	<tr>
           		<th>게임이름</th>
           		<td><input type="text" name="game_name" placeholder="게임 이름"></td>
        	</tr>
        
        	<tr>
           		<th>발매일</th>
           		<td><input type="text" name="launch" placeholder="발매일(YYYY-MM-DD)"></td>
        	</tr>
  
        	<tr>
           		<th>배급사</th>
           		<td><input type="text" name="publisher" placeholder="배급사"></td>
        	</tr>
        
        	<tr>
           		<th>가격</th>
           		<td><input type="text" name="price" placeholder="가격"></td>
        	</tr>
  
        	<tr>
           		<th>이용 등급</th>
           		<td><input type="text" name="grade" placeholder="등급"></td>
        	</tr>
        
        	<tr>
           		<th>공식 사이트</th>
           		<td><input type="text" name="site" placeholder="사이트"></td>
        	</tr>
        
        	<tr>
           		<th>게임 소개</th>
           		<td><input type="text" name="intro" placeholder="게임 소개"></td>
        	</tr>
        
        	<tr>
           		<th>영상 링크</th>
           		<td><input type="text" name="video" placeholder="영상 링크"></td>
        	</tr>
        
        	<tr>
           		<td></td>
           		<td>
           			<input class="insert_game_btn" type="submit" value="등록" onclick="return insertGame()">&nbsp;&nbsp;&nbsp;
              		<input class="insert_game_btn" type="reset" value="취소">
          		</td>
         	</tr>
		</table>
	</form>
	&nbsp;&nbsp;&nbsp;<a href="javascript:history.go(-1)">[이전으로]</a>
	<hr>
	<c:if test="${not empty message}">
         ${message}<br>
	</c:if>
    <!-- Footer section -->
    <footer class="footer-section">
    	<div class="container">
        	<ul class="footer-menu">
            	<li><a href="home">Home</a></li>
             	<li><a href="axPcGame">PC 게임</a></li>
             	<li><a href="axMobileGame">모바일 게임</a></li>
             	<li><a href="boardList">자유 게시판</a></li>
             	<li><a href="qnaBoardList">Q&amp;A</a></li>
          	</ul>
          	<p class="copyright">
            	Copyright &copy;
            	<script>document.write(new Date().getFullYear());</script>
             	All rights reserved | This project is made with 
             	<i class="fa fa-heart-o" aria-hidden="true"></i> by 
             	<a href="#" target="_blank">GameZone</a>
          	</p>
       	</div>
    </footer>
    <!-- Footer section end -->
</body>
</html>