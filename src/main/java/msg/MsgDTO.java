package msg;

public class MsgDTO {

	private int msgCode;
	private String msgSender;
	private String msgReceiver;
	private String msgTitle;
	private String msgContent;
	private java.sql.Date msgDate;
	private String msgFName;
	private String msgFPath;

	
	public int getMsgCode() {
		return msgCode;
	}
	public void setMsgCode(int msgCode) {
		this.msgCode = msgCode;
	}
	public String getMsgSender() {
		return msgSender;
	}
	public void setMsgSender(String msgSender) {
		this.msgSender = msgSender;
	}
	public String getMsgReceiver() {
		return msgReceiver;
	}
	public void setMsgReceiver(String msgReceiver) {
		this.msgReceiver = msgReceiver;
	}
	public String getMsgTitle() {
		return msgTitle;
	}
	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	public java.sql.Date getMsgDate() {
		return msgDate;
	}
	public void setMsgDate(java.sql.Date msgDate) {
		this.msgDate = msgDate;
	}
	public String getMsgFName() {
		return msgFName;
	}
	public void setMsgFName(String msgFName) {
		this.msgFName = msgFName;
	}
	public String getMsgFPath() {
		return msgFPath;
	}
	public void setMsgFPath(String msgFPath) {
		this.msgFPath = msgFPath;
	}

	
	
	
}
