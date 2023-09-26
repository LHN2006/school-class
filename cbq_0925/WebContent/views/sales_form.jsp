<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="../css/sales_form.css" rel="stylesheet" type="text/css">

<script type="text/javascript">

function salesForm() {
	console.log('salesForm() CALLED!!');
	
	var form = document.sales_form;
	if (form.c_id.value == '') {
		alert('INPUT CUSTOMER ID');
		form.c_id.focus();
		
	} else if (form.p_no.value == '') {
		alert('INPUT PRODUCT NO');
		form.p_no.focus();
		
	} else if (form.s_price.value == '') {
		alert('INPUT SALES PRICE');
		form.s_price.focus();
		
	} else {
		form.submit();
		
	}
	
}

</script>

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
				
				<form action="<%=request.getContextPath()%>/views/sales_confirm.jsp" name="sales_form" method="post">
					
					<table>
						<tr>
							<td>고객 아이디</td>
							<td>
								<input type="text" name="c_id" placeholder="INPUT CUSTOMER ID">
							</td>
						</tr>
						<tr>
							<td>상품 번호</td>
							<td>
								<input type="text" name="p_no" placeholder="INPUT PRODUCT NO">
							</td>
						</tr>
						<tr>
							<td>판매 금액</td>
							<td>
								<input type="text" name="s_price" placeholder="INPUT SALES PRICE">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="button" value="상품 판매 등록" onclick="salesForm();">
								<input type="reset" value="초기화">
							</td>
						</tr>
					</table>
					
				</form>
				
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
