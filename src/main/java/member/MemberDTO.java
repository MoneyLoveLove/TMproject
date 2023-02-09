package member;

public class MemberDTO {

	private String mId;
	private String mPw;
	private String mName;
	private String tCode;
	private String pCode;
	private String mCall;
	private String mAddr;
	private String mEmail;
	private java.sql.Date mJoin;
	private boolean mLeader;
	
	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPw() {
		return mPw;
	}
	public void setmPw(String mPw) {
		this.mPw = mPw;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String gettCode() {
		return tCode;
	}
	public void settCode(String tCode) {
		this.tCode = tCode;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getmCall() {
		return mCall;
	}
	public void setmCall(String mCall) {
		this.mCall = mCall;
	}
	public String getmAddr() {
		return mAddr;
	}
	public void setmAddr(String mAddr) {
		this.mAddr = mAddr;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public java.sql.Date getmJoin() {
		return mJoin;
	}
	public void setmJoin(java.sql.Date mJoin) {
		this.mJoin = mJoin;
	}
	public boolean ismLeader() {
		return mLeader;
	}
	public void setmLeader(boolean mLeader) {
		this.mLeader = mLeader;
	}
	
	
	
}