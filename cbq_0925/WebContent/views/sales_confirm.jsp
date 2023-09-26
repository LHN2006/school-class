<%@page import="com.bundang.cbq_0925.SalesDto"%>
<%@page import="com.bundang.cbq_0925.SalesDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	SalesDao salesDao = new SalesDao();

	int result = -1;

	String c_id = request.getParameter("c_id");
	int p_no = Integer.parseInt(request.getParameter("p_no"));
	int s_price = Integer.parseInt(request.getParameter("s_price"));

	SalesDto salesDto = new SalesDto();
	salesDto.setC_id(c_id);
	salesDto.setP_no(p_no);
	salesDto.setS_price(s_price);
	
	result = salesDao.salesConfirm(salesDto);
	
	if (result > 0) {
		System.out.println("SALES SUCCESS!!");
		response.sendRedirect(request.getContextPath() + "/views/sales_success.jsp");
		
	} else {
		System.out.println("SALES FAIL!!");
		response.sendRedirect(request.getContextPath() + "/views/sales_fail.jsp");
	}
	
%>
