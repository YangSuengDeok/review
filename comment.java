package comment;

public class comment {
	
	private int commentID;
	private int mainRiveiwID;
	private String commentText;
	private String userID;
	private int commentAvailable;
	private String reg_date;
	private String star1;
	
	public int getCommentID() {
		return commentID;
	}
	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}
	public int getMainRiveiwID() {
		return mainRiveiwID;
	}
	public void setMainRiveiwID(int mainRiveiwID) {
		this.mainRiveiwID = mainRiveiwID;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getCommentAvailable() {
		return commentAvailable;
	}
	public void setCommentAvailable(int commentAvailable) {
		this.commentAvailable = commentAvailable;
	}
	public String getStar1() {
		return star1;
	}
	public void setStar1(String star1) {
		this.star1 = star1;
	}
	
}
