package member;

import java.util.ArrayList;
import java.util.regex.Pattern;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	
	public MemberDTO getMemberDTO(String uId, String uPw) {
		MemberDTO dto = new MemberDTO();
		String query = "select M_ID, M_PW, M_NAME, M.T_CODE, T_NAME, M.P_CODE, P_NAME, M_CALL, M_ADDR, M_EMAIL, M_JOIN, M_LEADER"
				+ " from team T inner join member M"
				+ " on M.T_CODE = T.T_CODE inner join positions P"
				+ " on M.P_CODE = P.P_CODE"
				+ " where M_ID=? and M_PW=?";
		
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
				dto.settName(rs.getString("T_NAME"));
				dto.setpCode(rs.getString("P_CODE"));
				dto.setpName(rs.getString("P_NAME"));
				dto.setmCall(rs.getString("M_CALL"));
				dto.setmAddr(rs.getString("M_ADDR"));
				dto.setmEmail(rs.getString("M_EMAIL"));
				dto.setmJoin(rs.getDate("M_JOIN"));
				dto.setmLeader(rs.getBoolean("M_LEADER"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("getMemberDTO error");
		}
		return dto;
	}
	
	public ArrayList<MemberDTO> getMember() {
		ArrayList<MemberDTO> memberList = new ArrayList<>();
		String query = "select * from team T join member M on M.T_CODE=T.T_CODE join positions P on M.P_CODE=P.P_CODE";
		
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
				dto.settName(rs.getString("T_NAME"));
				dto.setpName(rs.getString("P_NAME"));
				
				memberList.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("getMember error");
		}
		return memberList;
	}
	
	public String nameS(String sender) {
		String query = "select distinct M_NAME from member M join msg S on M.M_ID=S.SENDER where M_ID=?";
		String name=null;
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, sender);
			rs=psmt.executeQuery();
			
			while(rs.next()) {			
			name = rs.getString("M_NAME");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("nameS error");
		}
		return name;
	}
	
	public String nameR(String receiver) {
		String query = "select distinct M_NAME from member M join msg S on M.M_ID=S.RECEIVER where M_ID=?";
		String name=null;
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, receiver);
			rs=psmt.executeQuery();
			
			while(rs.next()) {			
			name = rs.getString("M_NAME");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("nameR error");
		}
		return name;
	}
	
	public void insertMember(MemberDTO dto) {
		//id생성
		String id = dto.getmId();
		int idNum = 0 ;
		
		try {
			psmt = con.prepareStatement("select count(*) from member where T_CODE=?");
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			rs.next();
			idNum = rs.getInt(1) + 1;
			System.out.println(idNum);
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("insertMember -ID 생성 중- error");
		}
		id += String.format("%02d", idNum);
		dto.setmId(id);
		
		//데이터 삽입
		String query = "insert into member("
				+ "M_ID, M_PW, M_NAME, T_CODE, P_CODE, M_CALL, M_ADDR, M_EMAIL, M_JOIN, M_LEADER"
				+ ") VALUES (?,?,?,?,?,?,?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getmId());
			psmt.setString(2, dto.getmPw());
			psmt.setString(3, dto.getmName());
			psmt.setString(4, dto.gettCode());
			psmt.setString(5, dto.getpCode());
			psmt.setString(6, dto.getmCall());
			psmt.setString(7, dto.getmAddr());
			psmt.setString(8, dto.getmEmail());
			psmt.setDate(9, dto.getmJoin());
			psmt.setBoolean(10, dto.getpCode().equals("CH"));
			
			psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("insertMember -SQL insert- error");
		}
		
	}
	
	public void updateMember(MemberDTO dto) {
		String query = "update member set M_PW=?, M_NAME=?, T_CODE=?, P_CODE=?, M_CALL=?, M_ADDR=?, M_EMAIL=?, M_JOIN=?, M_LEADER=?"
				+ " where M_ID=?";
		
		try {
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getmPw());
			psmt.setString(2, dto.getmName());
			psmt.setString(3, dto.gettCode());
			psmt.setString(4, dto.getpCode());
			psmt.setString(5, dto.getmCall());
			psmt.setString(6, dto.getmAddr());
			psmt.setString(7, dto.getmEmail());
			psmt.setDate(8, dto.getmJoin());
			psmt.setBoolean(9, dto.getpCode().equals("CH"));
			psmt.setString(10,dto.getmId());
			
			psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("updateMember error");
		}
	}
	
	public ArrayList<MemberDTO> teamName() {
		ArrayList<MemberDTO> teamList = new ArrayList<>();
		String query = "select * from team";
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.settCode(rs.getString("T_CODE"));
				dto.settName(rs.getString("T_NAME"));
				teamList.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("teamName error");
		}
		return teamList;
			
	}
	
	public ArrayList<MemberDTO> positionName() {
		ArrayList<MemberDTO> positionList = new ArrayList<>();
		String query = "select * from positions";
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setpCode(rs.getString("P_CODE"));
				dto.setpName(rs.getString("P_NAME"));
				positionList.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("positionName error");
		}
		return positionList;
			
	}
	
	public String getCall(String mCall) {
		String regEx = "(\\d{2,3})(\\d{3,4})(\\d{4})";

		if(!Pattern.matches(regEx, mCall)) {
			return null;
		}
		if(mCall.substring(0,2).contains("02") && mCall.length() == 9) {
			return mCall.replaceAll(regEx, "$1-$2-$3");
		} else if(mCall.length() == 9) {
			return null;
		}
	    return mCall.replaceAll(regEx, "$1-$2-$3");
	}
}
