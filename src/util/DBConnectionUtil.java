package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnectionUtil {
	/*private static String url = "jdbc:mysql://node208361-shareit.j.layershift.co.uk/shareit?useUnicode=true&characterEncoding=UTF-8";
	private static String user = "root";
	private static String password = "HNXvka24543";*/
	private static String url = "jdbc:mysql://localhost/shareit?useUnicode=true&characterEncoding=UTF-8";
	private static String user = "root";
	private static String password = "";
	private static Connection conn = null;
	
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			System.out.println("Không thể nạp driver");
			e.printStackTrace();
		}
		return conn;
	}
	public static void close(ResultSet rs) {
		if (rs!=null)
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	public static void close(Statement st) {
		if (st!=null)
			try {
				st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	public static void close(Connection conn) {
		if (conn!=null)
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	public static void close(Connection conn2, Statement st, ResultSet rs) {
		close(rs);
		close(st);
		close(conn);
		
	}
}
