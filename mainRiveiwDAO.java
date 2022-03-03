package mainRiveiw;

import java.sql.Connection;


import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class mainRiveiwDAO {
	
	private Connection conn; /*데이터베이스를 접급하기 위한 객체 */
	private ResultSet rs; /*어떠한 정보를 담을 수 있는 객체 */
	
	
	
	public mainRiveiwDAO() {
		
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
		String SQL = "SELECT mainRiveiwID FROM MAINRIVEIW ORDER BY mainRiveiwID DESC";
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
	
	public int write(String reg_img, String kategori, String mainCentent,  String userID, int bbsCount) {
		String SQL = "INSERT INTO MAINRIVEIW VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, reg_img);
			pstmt.setString(3, kategori);
			pstmt.setString(4, mainCentent);
			pstmt.setString(5, userID);
			pstmt.setString(6, getDate());
			pstmt.setInt(7, 1);
			pstmt.setInt(8, bbsCount);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 빈 문자열을 반환해주므로서 데이터베이스 오류
	}
	
	public ArrayList<mainRiveiw> getList(int pageNumber) {
		String SQL = "SELECT * FROM MAINRIVEIW WHERE mainRiveiwID < ? AND mainRiveiwAvailable = 1 ORDER BY mainRiveiwID DESC LIMIT 10";
		ArrayList<mainRiveiw> list = new ArrayList<mainRiveiw>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				mainRiveiw mainRiveiw = new mainRiveiw();
				mainRiveiw.setMainRiveiwID(rs.getInt(1));
				mainRiveiw.setReg_img(rs.getString(2));
				mainRiveiw.setKategori(rs.getString(3));
				mainRiveiw.setMainCentent(rs.getString(4));
				mainRiveiw.setUserID(rs.getString(5));
				mainRiveiw.setReg_date(rs.getString(6));
				mainRiveiw.setMainRiveiwAvailable(rs.getInt(7));
				mainRiveiw.setBbsCount(rs.getInt(8));
				list.add(mainRiveiw);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	} // 글 목록 보여주기
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM MAINRIVEIW WHERE mainRiveiwID < ? AND mainRiveiwAvailable = 1";
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
	
	public mainRiveiw getMainRiveiw(int mainRiveiwID) {
		String SQL = "SELECT * FROM MAINRIVEIW WHERE mainRiveiwID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, mainRiveiwID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mainRiveiw mainRiveiw = new mainRiveiw();
				mainRiveiw.setMainRiveiwID(rs.getInt(1));
				mainRiveiw.setReg_img(rs.getString(2));
				mainRiveiw.setKategori(rs.getString(3));
				mainRiveiw.setMainCentent(rs.getString(4));
				mainRiveiw.setUserID(rs.getString(5));
				mainRiveiw.setReg_date(rs.getString(6));
				mainRiveiw.setMainRiveiwAvailable(rs.getInt(7));
				int bbsCount=rs.getInt(8);
				mainRiveiw.setBbsCount(bbsCount);
				bbsCount++;
				countUpdate(bbsCount, mainRiveiwID);
				return mainRiveiw;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	private int countUpdate(int bbsCount, int mainRiveiwID) {
		// TODO Auto-generated method stub
		String SQL = "update mainRiveiw set bbsCount = ? where mainRiveiwID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsCount);
			pstmt.setInt(2, mainRiveiwID);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int mainUpdate(int mainRiveiwID, String reg_img, String kategori, String mainCentent) {
		String SQL = "UPDATE mainRiveiw SET reg_img = ?, kategori = ?, mainCentent = ? WHERE mainRiveiwID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, reg_img);
			pstmt.setString(2, kategori);
			pstmt.setString(3, mainCentent);
			pstmt.setInt(4, mainRiveiwID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 빈 문자열을 반환해주므로서 데이터베이스 오류
	}
	
	public int mainDelete(int mainRiveiwID) {
		String SQL = "UPDATE mainRiveiw SET mainRiveiwAvailable = 0 WHERE mainRiveiwID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, mainRiveiwID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 빈 문자열을 반환해주므로서 데이터베이스 오류
	}
	
}
