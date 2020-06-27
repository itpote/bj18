package utils;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.PreparedStatement;



public class ZhixingSQL
{

	
	public static Connection conn = null;
	
	public ZhixingSQL()
	{
		conn = this.getConn();
	}

		public Connection getConn()
		{
		        try
		        { 
		        	if(conn==null||conn.isClosed()){
		        		
		        		 Class.forName("com.mysql.jdbc.Driver");
			        	 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yingyuan","root","1234");
					 }}
		        catch(Exception e)
		        {
		            e.printStackTrace();
		        }
		        return conn;
		}
	
	public void zhixingSqls(String sql,String sid,Integer customerid,String moviename,String date,String speak,String yingting,String shichang,String totalprice,String seats,String seatis,Integer qt)
	{
		int i=0;
		String gmttime=DateUtils.nowDate();
		String upttime=DateUtils.nowDate();
		PreparedStatement pstmt;
		try {
			 pstmt = (PreparedStatement) conn.prepareStatement(sql);
		        pstmt.setInt(1, Integer.valueOf(sid));
		        pstmt.setInt(2, customerid);
		        pstmt.setString(3, moviename);
		        pstmt.setString(4, date);
		        pstmt.setInt(5, 1);
		        pstmt.setString(6, speak);
		        pstmt.setString(7, yingting);
		        pstmt.setString(8, shichang);
		        pstmt.setString(9, totalprice);
		        pstmt.setString(10, seats);
		        pstmt.setString(11, gmttime);
		        pstmt.setString(12, upttime);
		        pstmt.setString(13, seatis);
		        pstmt.setInt(14, qt);
		        i = pstmt.executeUpdate();
		        pstmt.close();
		        conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void zhixingSqls2(String sql,String sid,String iselect)
	{
		int i=0;
		PreparedStatement pstmt;
		try {
			 pstmt = (PreparedStatement) conn.prepareStatement(sql);
		        pstmt.setInt(1, Integer.valueOf(sid));
		        pstmt.setString(2, iselect);
		        pstmt.setInt(3, 0);
		        i = pstmt.executeUpdate();
		        pstmt.close();
		        conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}


