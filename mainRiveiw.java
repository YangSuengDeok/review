package mainRiveiw;

public class mainRiveiw {

	private int mainRiveiwID;
	private String reg_img;
	private String kategori;
	private String mainCentent;
	private String userID;
	private String reg_date;
	private int mainRiveiwAvailable;
	private int bbsCount;
	
	public int getMainRiveiwID() {
		return mainRiveiwID;
	}
	public void setMainRiveiwID(int mainRiveiwID) {
		this.mainRiveiwID = mainRiveiwID;
	}
	public String getReg_img() {
		return reg_img;
	}
	public void setReg_img(String reg_img) {
		this.reg_img = reg_img;
	}
	public String getKategori() {
		return kategori;
	}
	public void setKategori(String kategori) {
		this.kategori = kategori;
	}
	public String getMainCentent() {
		return mainCentent;
	}
	public void setMainCentent(String mainCentent) {
		this.mainCentent = mainCentent;
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
	public int getMainRiveiwAvailable() {
		return mainRiveiwAvailable;
	}
	public void setMainRiveiwAvailable(int mainRiveiwAvailable) {
		this.mainRiveiwAvailable = mainRiveiwAvailable;
	}
	public int getBbsCount() {
		return bbsCount;
	}
	public void setBbsCount(int bbsCount) {
		this.bbsCount = bbsCount;
	}
	
	public mainRiveiw(int mainRiveiwID, String reg_img, String kategori, String mainCentent, String userID,
			String reg_date, int mainRiveiwAvailable, int bbsCount) {
		super();
		this.mainRiveiwID = mainRiveiwID;
		this.reg_img = reg_img;
		this.kategori = kategori;
		this.mainCentent = mainCentent;
		this.userID = userID;
		this.reg_date = reg_date;
		this.mainRiveiwAvailable = mainRiveiwAvailable;
		this.bbsCount = bbsCount;
	}
	public mainRiveiw() {
		// TODO Auto-generated constructor stub
	}

	
}
