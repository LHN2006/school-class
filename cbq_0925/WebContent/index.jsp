<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="./css/index.css" rel="stylesheet" type="text/css">

</head>
<body>

	<header>
	
		<div class="header_wrap">
			(과정평가형 정보처리) 상품 판매 관리 프로그램 ver 2023-01
		</div>
	
	</header>
	
	<nav>
		
		<div class="nav_wrap">
			<a href="<%=request.getContextPath()%>/">홈</a>
			<a href="<%=request.getContextPath()%>/views/sales_form.jsp">상품 판매 등록</a>
			<a href="<%=request.getContextPath()%>/views/sales_list.jsp">상품 판매 리스트</a>
		</div>
		
	</nav>
	
	<section>
		
		<div class="section_wrap">
			
			<div class="article">
				<h3>상품 판매 관리 프로그램을 작성한다.</h3>
				<br>
				1. 상품 테이블을 생성한다.<br>
				2. 제조사 테이블을 생성한다.<br>
				3. 상품 판매 테이블을 생성한다.<br>
				4. 주어진 화면디자인을 이용하여 화면을 디자인한다.<br>
				5. 업무요건에 따라 프로그램을 작성한다.<br>
			</div>
			
		</div>
		
	</section>
	
	<footer>
		
		<div class="footer_wrap">
			<p>HRDKOREA Copyright 2023 All right reserved.</p>
		</div>
		
	</footer>

</body>
</html>
