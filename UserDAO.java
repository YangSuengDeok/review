package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn; /*데이터베이스를 접급하기 위한 객체 */
	private PreparedStatement pstmt;
	private ResultSet rs; /*어떠한 정보를 담을 수 있는 객체 */
	
	
	
	public UserDAO() {
		
		try {
			String dbURL = "jdbc:mysql://localhost:3306/RIVEIW?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); /*dbURL에 아이디와 패스워드를 이용해서 접속*/
			System.out.println("정상");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

	// 아이디를 입력받아서 실제로 존재하는지 존재한다면 비밀번호가 뭔지 데이터베이스에서 가져오는 거
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) { // 결과가 존재한다면 실행
				if(rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				}
				else {
					return 0; // 비밀번호 불일치
				}
			}
			return -1; //  아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  user.getUserName());
			pstmt.setString(2,  user.getUserJumin());
			pstmt.setString(3,  user.getUserJumin2());
			pstmt.setString(4,  user.getUserID());
			pstmt.setString(5,  user.getUserPassword());
			pstmt.setString(6,  user.getQuiz());
			pstmt.setString(7,  user.getQuiz2());
			pstmt.setString(8,  user.getUserEmail());
			pstmt.setString(9,  user.getUserPhone());
			pstmt.setString(10,  user.getUserPhone2());
			pstmt.setString(11,  user.getUserPhone3());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public String getUserEmail(String userID) {
		String SQL = "SELECT userEmail FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return null;
	}
	
	public User getUser(String userID) {
		User user = new User();
		//String SQL = "SELECT userName, userJumin, userJumin2, userID, userPassword, quiz, quiz2, userEmail, userPhone, userPhone2, userPhone3 FROM USER WHERE userID like ?";
		String SQL = "SELECT * FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) { // 결과가 존재한다면 실행
				user.setUserName(rs.getString("userName"));
				user.setUserJumin(rs.getString("userJumin"));
				user.setUserJumin2(rs.getString("userJumin2"));
				user.setUserID(rs.getString("userID"));
				user.setUserPassword(rs.getString("userPassword"));
				user.setQuiz(rs.getString("quiz"));
				user.setQuiz2(rs.getString("quiz2"));
				user.setUserEmail(rs.getString("userEmail"));
				user.setUserPhone(rs.getString("userPhone"));
				user.setUserPhone2(rs.getString("userPhone2"));
				user.setUserPhone3(rs.getString("userPhone3"));
				}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return user; // 데이터베이스 오류
	}
	/*
	public int modify(User user) {
		String SQL = "UPDATE USER SET userName='" + user.getUserName() + "'" +", userJumin='" +user.getUserJumin()+"'" +", userJumin2='" +user.getUserJumin2()+"'" 
					+", userID='" + user.getUserID() + "'" +", userPassword='" + user.getUserPassword() + "'" +", quiz='" +user.getQuiz()+"'"  +", quiz2='" +user.getQuiz2()+"'" 
					+", userEmail='" + user.getUserEmail() + "'"+", userPhone="+ "'" + user.getUserPhone() +"'" +", userPhone2="+ "'" + user.getUserPhone2() +"'" +", userPhone3="+ "'" + user.getUserPhone3() + "' WHERE userID='"+ user.getUserID() +"'";
		try {
			pstmt = (PreparedStatement) conn.createStatement();
			System.out.println("executeupdate_before");
			return pstmt.executeUpdate(SQL);
		}catch(Exception e){
			System.out.println("exeption");
			e.printStackTrace();
		}
		System.out.println("return: -1");
		return -1;
	}*/
	
	
	
	public int profileUpdate(String userName, String userJumin, String userJumin2, String userID, String userPassword, String quiz, String quiz2, String userEmail, String userPhone, String userPhone2, String userPhone3) {
		
		try {
			String sql = "select userID, userPassword from user where userID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userID);
			rs = pstmt.executeQuery();
			if (rs.next()) { // 결과가 존재한다면 실행
				String ruserID = rs.getString("userID");
				String ruserPassword = rs.getString("userPassword");
				if(userID.equals(ruserID) && userPassword.equals(ruserPassword)) {
					String SQL = "UPDATE USER SET userName = ?, userJumin = ?, userJumin2 = ?, userPassword = ?, quiz = ?, quiz2 = ?, userEmail = ?, userPhone = ?, userPhone2 = ?, userPhone3 = ? WHERE userID = ?";
					pstmt = conn.prepareStatement(SQL);
					pstmt.setString(1, userName);
					pstmt.setString(2, userJumin);
					pstmt.setString(3, userJumin2);
					pstmt.setString(4, userPassword);
					pstmt.setString(5, quiz);
					pstmt.setString(6, quiz2);
					pstmt.setString(7, userEmail);
					pstmt.setString(8, userPhone);
					pstmt.setString(9, userPhone2);
					pstmt.setString(10, userPhone3);
					pstmt.setString(11, userID);
					return pstmt.executeUpdate();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 빈 문자열을 반환해주므로서 데이터베이스 오류
	}
	
	
}

