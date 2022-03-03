package image;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class imageDAO {

	private Connection conn; /*�����ͺ��̽��� �����ϱ� ���� ��ü */
	private ResultSet rs; /*��� ������ ���� �� �ִ� ��ü */
	
	public imageDAO() {
		
		try {
			String dbURL = "jdbc:mysql://localhost:3306/IMAGE?serverTimezone=UTC";
			String dbID = "did";
			String dbPassword = "21811016";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); /*dbURL�� ���̵�� �н����带 �̿��ؼ� ����*/
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int write(String file_name) {
		String SQL = "INSERT INTO IMAGE VALUES (?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);;
			pstmt.setString(1, file_name);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �� ���ڿ��� ��ȯ���ֹǷμ� �����ͺ��̽� ����
	}
	

}
