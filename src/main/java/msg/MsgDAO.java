package msg;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import common.JDBConnect;
import member.MemberDTO;

public class MsgDAO extends JDBConnect {
	
	// 메시지 작성
	public int insertMsg(MsgDTO dto) {
		int result = 0;
		
		String query = "insert into msg (SENDER, RECEiVER, MSG_TITLE, MSG_CNT) value(?,?,?,?)";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getMsgSender());
			psmt.setString(2, dto.getMsgReceiver());
			psmt.setString(3, dto.getMsgTitle());
			psmt.setString(4, dto.getMsgContent());
		
			
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("메시지 msg T 입력 중 예외 발생");
		}
		return result;		
	}
		
	// 보낸 메시지 저장
//	public int insertSndMsg(MsgDTO dto) {
//		int result = 0;
//		
//		String query = "insert into msg (SENDER, RECEiVER, MSG_TITLE, MSG_CNT) value(?,?,?,?)";
//		try {
//			psmt = con.prepareStatement(query);
//			psmt.setString(1, dto.getMsgSender());
//			psmt.setString(2, dto.getMsgReceiver());
//			psmt.setString(3, dto.getMsgTitle());
//			psmt.setString(4, dto.getMsgContent());
//			
//			result = psmt.executeUpdate();
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//			System.out.println("메시지 snd_msg T 입력 중 예외 발생");
//		}
//		return result;		
//	}
	
	// 메시지 view
	public List<MsgDTO> selectMsg(String mId) {
		List<MsgDTO> msgList = new Vector<>();
		
		String query = "select * from msg";
		if(mId != null) {
			query += " where RECEIVER = '" + mId + "'";
		} query += " order by MSG_DATE desc";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				MsgDTO dto = new MsgDTO();
				dto.setMsgCode(rs.getInt("MSG_CODE"));
				dto.setMsgSender(rs.getString("SENDER"));
				dto.setMsgReceiver(rs.getString("RECEIVER"));
				dto.setMsgTitle(rs.getString("MSG_TITLE"));
				dto.setMsgContent(rs.getString("MSG_CNT"));
				dto.setMsgDate(rs.getDate("MSG_DATE"));
				dto.setMsgFName(rs.getString("MSG_FNAME"));
				dto.setMsgFPath(rs.getString("MSG_FPATH"));
				
				msgList.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return msgList;
	}
	
	// 상세보기
	public MsgDTO selectView(int MsgCode) {
		MsgDTO dto = new MsgDTO();
		
		String query = "select * from msg ";
			query += " where MSG_CODE =" + MsgCode ;
						
		try {
			psmt = con.prepareStatement(query);
			
			rs=psmt.executeQuery(); //쿼리 실행
			
			
			//결과 처리
			if(rs.next()) {
				dto.setMsgCode(rs.getInt("MSG_CODE"));
				dto.setMsgSender(rs.getString("SENDER"));
				dto.setMsgReceiver(rs.getString("RECEIVER"));
				dto.setMsgTitle(rs.getString("MSG_TITLE"));
				dto.setMsgContent(rs.getString("MSG_CNT"));
				dto.setMsgDate(rs.getDate("MSG_DATE"));
				dto.setMsgFName(rs.getString("MSG_FNAME"));
				dto.setMsgFPath(rs.getString("MSG_FPATH"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
		
	}
	
	
	// 아이디별로 메시지 리스트 담기
	public ArrayList<MsgDTO> getMsgById(String uId){
		
		ArrayList<MsgDTO> msgList = new ArrayList<>();
		String query = "select * from msg where receiver=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uId);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MsgDTO dto = new MsgDTO();
				dto.setMsgSender(rs.getString("SENDER"));
				dto.setMsgTitle(rs.getString("MSG_TITLE"));
				dto.setMsgContent(rs.getString("MSG_CNT"));
				dto.setMsgDate(rs.getDate("MSG_DATE"));
				dto.setMsgFName(rs.getString("MSG_FNAME"));
				dto.setMsgFPath(rs.getString("MSG_FPATH"));
							
				msgList.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return msgList;
	}
	
	public int insertRcvMsg(MsgDTO dto) {
		int result = 0;
		
		String query = "insert into rcv_msg (SENDER, RCV_TITLE, RCV_CNT, RCV_DATE) value(?,?,?,?,)";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getMsgSender());;
			psmt.setString(2, dto.getMsgTitle());
			psmt.setString(3, dto.getMsgContent());
			psmt.setDate(4, dto.getMsgDate());		
			
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("메시지 RCV_MSG T 입력 중 예외 발생");
		}
		return result;		
	}

}
