package com.bundang.cbq_0925;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SalesDao {

	//DB 접속(connect)
	//일꾼
	//SQL
	//작업지시
	
	final private String DRIVER = "oracle.jdbc.driver.OracleDriver";
	final private String URL 	= "jdbc:oracle:thin:@localhost:1521:xe";
	final private String USER 	= "system";
	final private String PASS 	= "1234";
	
	public int salesConfirm(SalesDto salesDto) {
		System.out.println("[SalesDao] salesConfirm()");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = -1;
		
		try {
			
			//1.데이터베이스 드라이버 로드 in 메모리
			Class.forName(DRIVER);
			
			//2.커넥션 생성(다리 연결)
			conn = DriverManager.getConnection(URL, USER, PASS);
					

			//3. 작업 명세서 작성(SQL)
			String sql = "insert into tbl_sales values(seq_sales.nextval, ?, ?, ?, systimestamp, systimestamp)";
			
			//4. 일꾼 생성
			pstmt = conn.prepareStatement(sql);
			
			//5. 일꾼한테 데이터 주입
			pstmt.setString(1, salesDto.getC_id());
			pstmt.setInt(2, salesDto.getP_no());
			pstmt.setInt(3, salesDto.getS_price());
			
			//6. 일꾼한테 작업 지시하기
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			
			try {
			
				//7. 외부 자원 해제
				if (pstmt != null) pstmt.close();
				if (pstmt != null) conn.close();
			
			} catch (Exception e2) {
				e2.printStackTrace();
			}

		} 
		return result;		// 0 or 1
	}
	
	public ArrayList<SalesDto> salesList() {
		System.out.println("[SalesDao] salesList()");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<SalesDto> salesDtos = new ArrayList<>();
		
		try {
			
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PASS);
			
			String sql =  "SELECT * FROM tbl_sales s "
						+ "JOIN tbl_customer c  "
						+ "ON s.c_id = c.c_id  "
						+ "JOIN tbl_product p  "
						+ "ON s.p_no = p.p_no  "
						+ "JOIN tbl_manufacture m  "
						+ "ON p.m_no = m.m_no  "
						+ "ORDER BY s.s_reg_date DESC";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				SalesDto salesDto = new SalesDto();
				salesDto.setC_id(rs.getString("c_id"));
				salesDto.setC_name(rs.getString("c_name"));
				salesDto.setC_mail(rs.getString("c_mail"));
				salesDto.setC_phone(rs.getString("c_phone"));
				salesDto.setC_reg_date(rs.getString("c_reg_date").substring(0, 19));
				
				salesDto.setP_no(rs.getInt("p_no"));
				salesDto.setP_name(rs.getString("p_name"));
				salesDto.setP_price(rs.getInt("p_price"));
				salesDto.setP_quantity(rs.getInt("p_quantity"));
				salesDto.setP_reg_date(rs.getString("p_reg_date").substring(0, 19));
				salesDto.setP_mod_date(rs.getString("p_mod_date").substring(0, 19));
				
				salesDto.setM_no(rs.getInt("m_no"));
				salesDto.setM_name(rs.getString("m_name"));
				salesDto.setM_address(rs.getString("m_address"));
				salesDto.setM_phone(rs.getString("m_phone"));
				salesDto.setM_manager(rs.getString("m_manager"));
				salesDto.setM_reg_date(rs.getString("m_reg_date").substring(0, 19));
				salesDto.setM_mod_date(rs.getString("m_mod_date").substring(0, 19));
				
				salesDto.setS_no(rs.getInt("s_no"));
				salesDto.setS_price(rs.getInt("s_price"));
				salesDto.setS_reg_date(rs.getString("s_reg_date").substring(0, 19));
				salesDto.setS_mod_date(rs.getString("s_mod_date").substring(0, 19));
				
				salesDtos.add(salesDto);

			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			
			try {
				
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			
		}
		
		return salesDtos;
		
	}

	public int salesReturn(int s_no) {
		System.out.println("[SalesDao] salesReturn()");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = -1;
		
		try {
			
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PASS);
			
			String sql =  "DELETE FROM tbl_sales WHERE s_no = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s_no);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			
			try {
				
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			
		}
		
		return result;
		
	}

}
