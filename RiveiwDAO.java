package reveiw;

import java.sql.Connection;


import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class RiveiwDAO {
	
	private Connection conn; /*데이터베이스를 접급하기 위한 객체 */
	private ResultSet rs; /*어떠한 정보를 담을 수 있는 객체 */
	
	
	
	public RiveiwDAO() {
		
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
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return	""; // 빈 문자열을 반환해주므로서 데이터베이스 오류
	}
	
	public int getNext() {
		String SQL = "SELECT riveiwID FROM RIVEIW ORDER BY riveiwID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫번째 게시물
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 빈 문자열을 반환해주므로서 데이터베이스 오류
	}
	
	public int write(String riveiwTitle, String userID, String riveiwContent, int bbsCount) {
		String SQL = "INSERT INTO RIVEIW VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, riveiwTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, riveiwContent);
			pstmt.setInt(6, 1);
			pstmt.setInt(7, bbsCount);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 빈 문자열을 반환해주므로서 데이터베이스 오류
	}
	
	public ArrayList<Riveiw> getList(int pageNumber) {
		String SQL = "SELECT * FROM RIVEIW WHERE riveiwID < ? AND riveiwAvailable = 1 ORDER BY riveiwID DESC LIMIT 10";
		ArrayList<Riveiw> list = new ArrayList<Riveiw>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Riveiw riveiw = new Riveiw();
				riveiw.setRiveiwID(rs.getInt(1));
				riveiw.setRiveiwTitle(rs.getString(2));
				riveiw.setUserID(rs.getString(3));
				riveiw.setRiveiwDate(rs.getString(4));
				riveiw.setRiveiwContent(rs.getString(5));
				riveiw.setBbsCount(rs.getInt(7));
				list.add(riveiw);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	} // 글 목록 보여주기
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM RIVEIW WHERE riveiwID < ? AND riveiwAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Riveiw getRiveiw(int riveiwID) {
		String SQL = "SELECT * FROM RIVEIW WHERE riveiwID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, riveiwID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Riveiw riveiw = new Riveiw();
				riveiw.setRiveiwID(rs.getInt(1));
				riveiw.setRiveiwTitle(rs.getString(2));
				riveiw.setUserID(rs.getString(3));
				riveiw.setRiveiwDate(rs.getString(4));
				riveiw.setRiveiwContent(rs.getString(5));
				riveiw.setRiveiwAvailable(rs.getInt(6));
				int bbsCount=rs.getInt(7);
				riveiw.setBbsCount(bbsCount);
				bbsCount++;
				countUpdate(bbsCount, riveiwID);
				return riveiw;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	private int countUpdate(int bbsCount, int riveiwID) {
		// TODO Auto-generated method stub
		String SQL = "update riveiw set bbsCount = ? where riveiwID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsCount);
			pstmt.setInt(2, riveiwID);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int update(int riveiwID, String riveiwTitle, String riveiwContent) {
		String SQL = "UPDATE RIVEIW SET riveiwTitle = ?, riveiwContent = ? WHERE riveiwID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, riveiwTitle);
			pstmt.setString(2, riveiwContent);
			pstmt.setInt(3, riveiwID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 빈 문자열을 반환해주므로서 데이터베이스 오류
	}
	
	public int delete(int riveiwID) {
		String SQL = "UPDATE RIVEIW SET riveiwAvailable = 0 WHERE riveiwID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, riveiwID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 빈 문자열을 반환해주므로서 데이터베이스 오류
	}
	
}
