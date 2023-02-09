package msg;

public class RcvMsgDTO {
	
	private int rcvCode;
	private String rcvSender;
	private String rcvTitle;
	private String rcvContent;
	private java.sql.Date rcvDate;
	private String rcvFName;
	private String rcvFPath;
	
	public int getRcvCode() {
		return rcvCode;
	}
	public void setRcvCode(int rcvCode) {
		this.rcvCode = rcvCode;
	}
	public String getRcvSender() {
		return rcvSender;
	}
	public void setRcvSender(String rcvSender) {
		this.rcvSender = rcvSender;
	}
	public String getRcvTitle() {
		return rcvTitle;
	}
	public void setRcvTitle(String rcvTitle) {
		this.rcvTitle = rcvTitle;
	}
	public String getRcvContent() {
		return rcvContent;
	}
	public void setRcvContent(String rcvContent) {
		this.rcvContent = rcvContent;
	}
	public java.sql.Date getRcvDate() {
		return rcvDate;
	}
	public void setRcvDate(java.sql.Date rcvDate) {
		this.rcvDate = rcvDate;
	}
	public String getRcvFName() {
		return rcvFName;
	}
	public void setRcvFName(String rcvFName) {
		this.rcvFName = rcvFName;
	}
	public String getRcvFPath() {
		return rcvFPath;
	}
	public void setRcvFPath(String rcvFPath) {
		this.rcvFPath = rcvFPath;
	}
	
	
}
