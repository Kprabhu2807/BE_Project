package com.twitter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.twitter.connection.ConnectionUtils;

public class Dao {
	
	public boolean update1(String email, String generatedotp) {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql = "INSERT INTO userlogin(email,otp) VALUES(?,?)";
		int update = 0;
		Connection connection = (Connection) ConnectionUtils.getConnection();
		try {
			PreparedStatement pstmt=(PreparedStatement) connection.prepareStatement(sql);
			
			pstmt.setString(1, email);
			
			pstmt.setString(2, generatedotp);
		
			
			int index=pstmt.executeUpdate();
			if(index>0)
			{
				flag=true;
			}
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
	
		return flag;
	}
	
	public String selectotp(String sql1) {
		// TODO Auto-generated method stub
		String genotp = "";
		Connection connection = (Connection) ConnectionUtils.getConnection();
		try {
			Statement st=connection.createStatement();
			
		
			ResultSet rs = st.executeQuery(sql1);
			while(rs.next()){
				genotp = rs.getString(1);
			System.out.println(genotp);
			}
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		
		return genotp;
	}


	public String selectotp1(String sql2) {
		// TODO Auto-generated method stub
		String genotp = "";
		Connection connection = (Connection) ConnectionUtils.getConnection();
		try {
			Statement st=connection.createStatement();
			
			ResultSet rs = st.executeQuery(sql2);
			while(rs.next()){
				genotp = rs.getString(1);
			System.out.println(genotp);
			}
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
	
		return genotp;
	}

}
