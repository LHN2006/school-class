<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

	alert('상품 판매 등록에 문제가 발생 했습니다. 다시 시도해 주세요.');
	location.href = <%="\'" + request.getContextPath() + "/views/sales_form.jsp'"%>;

</script>
