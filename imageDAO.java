package image;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class imageDAO {

	private Connection conn; /*데이터베이스를 접급하기 위한 객체 */
	private ResultSet rs; /*어떠한 정보를 담을 수 있는 객체 */
	
	public imageDAO() {
		
		try {
			String dbURL = "jdbc:mysql://localhost:3306/IMAGE?serverTimezone=UTC";
			String dbID = "did";
			String dbPassword = "21811016";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); /*dbURL에 아이디와 패스워드를 이용해서 접속*/
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
		return -1; // 빈 문자열을 반환해주므로서 데이터베이스 오류
	}
	

}
