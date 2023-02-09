package member;

import java.util.ArrayList;

public class MemberBox {

	private ArrayList<MemberDTO> memberDTOList = new ArrayList<MemberDTO>();
	
	public MemberBox() {
	
		
	}
	
	
	public ArrayList<MemberDTO> memberList() {
		return memberDTOList;
	}
}
