package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class commentDAO {


	private Connection conn; /*데이터베이스를 접급하기 위한 객체 */
	private ResultSet rs; /*어떠한 정보를 담을 수 있는 객체 */
	
	public commentDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/RIVEIW?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); /*dbURL에 아이디와 패스워드를 이용해서 접속*/
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int write(String commentText, int mainRiveiwID, String userID, String star1) {
		String SQL = "INSERT INTO comment (mainRiveiwID, commentText, userID, commentAvailable, reg_date, star1)VALUE (?, ?, ?, ?, now(), ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, mainRiveiwID);
			pstmt.setString(2, commentText);
			pstmt.setString(3, userID);
			pstmt.setInt(4, 1);
			pstmt.setString(5, star1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 빈 문자열을 반환해주므로서 데이터베이스 오류
	}

	public ArrayList<comment> getList(int mainRiveiwID) {
		String SQL = "SELECT * FROM comment WHERE mainRiveiwID = ? ORDER BY reg_date ASC";
		ArrayList<comment> list = new ArrayList<comment>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, mainRiveiwID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				comment comment = new comment();
				comment.setCommentID(rs.getInt(1));
				comment.setMainRiveiwID(rs.getInt(2));
				comment.setCommentText(rs.getString(3));
				comment.setUserID(rs.getString(4));
				comment.setCommentAvailable(rs.getInt(5));
				comment.setReg_date(rs.getString(6));
				comment.setStar1(rs.getString(7));
				list.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	} // 글 목록 보여주기
}
