package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class commentDAO {


	private Connection conn; /*�����ͺ��̽��� �����ϱ� ���� ��ü */
	private ResultSet rs; /*��� ������ ���� �� �ִ� ��ü */
	
	public commentDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/RIVEIW?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); /*dbURL�� ���̵�� �н����带 �̿��ؼ� ����*/
			
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
		return -1; // �� ���ڿ��� ��ȯ���ֹǷμ� �����ͺ��̽� ����
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
	} // �� ��� �����ֱ�
}
