package member;

import java.util.ArrayList;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	
	public MemberDTO getMemberDTO(String uId, String uPw) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where M_ID=? and M_PW=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uId);
			psmt.setString(2, uPw);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setmId(rs.getString("M_ID"));
				dto.setmPw(rs.getString("M_PW"));
				dto.setmName(rs.getString("M_NAME"));
				dto.settCode(rs.getString("T_CODE"));
				dto.setpCode(rs.getString("P_CODE"));
				dto.setmCall(rs.getString("M_CALL"));
				dto.setmAddr(rs.getString("M_ADDR"));
				dto.setmEmail(rs.getString("M_EMAIL"));
				dto.setmJoin(rs.getDate("M_JOIN"));
				dto.setmLeader(rs.getBoolean("M_LEADER"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public ArrayList<MemberDTO> getAllMember() {
		ArrayList<MemberDTO> memberList = new ArrayList<>();
		String query = "select * from member";
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setmId(rs.getString("M_ID"));
				dto.setmPw(rs.getString("M_PW"));
				dto.setmName(rs.getString("M_NAME"));
				dto.settCode(rs.getString("T_CODE"));
				dto.setpCode(rs.getString("P_CODE"));
				dto.setmCall(rs.getString("M_CALL"));
				dto.setmAddr(rs.getString("M_ADDR"));
				dto.setmEmail(rs.getString("M_EMAIL"));
				dto.setmJoin(rs.getDate("M_JOIN"));
				dto.setmLeader(rs.getBoolean("M_LEADER"));
				
				memberList.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return memberList;
	}
}
