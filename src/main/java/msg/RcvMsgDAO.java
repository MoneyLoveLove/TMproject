package msg;

import common.JDBConnect;

public class RcvMsgDAO extends JDBConnect {

	
public void getMsgById(String uId){
		
	
		String query = "select * from msg where receiver=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uId);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				RcvMsgDTO dto = new RcvMsgDTO();
				dto.setRcvSender(rs.getString("SENDER"));
				dto.setRcvTitle(rs.getString("MSG_TITLE"));
				dto.setRcvContent(rs.getString("MSG_CNT"));
				dto.setRcvDate(rs.getDate("MSG_DATE"));
				dto.setRcvFName(rs.getString("MSG_FNAME"));
				dto.setRcvFPath(rs.getString("MSG_FPATH"));
							
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
//	public int insertRcvMsg(MsgDTO dto) {
//		int result = 0;
//		
//		String query = "insert into rcv_msg (SENDER, RCV_TITLE, RCV_CNT, RCV_DATE) value(?,?,?,?,)";
//		try {
//			psmt = con.prepareStatement(query);
//			psmt.setString(1, dto.getMsgSender());;
//			psmt.setString(2, dto.getMsgTitle());
//			psmt.setString(3, dto.getMsgContent());
//			psmt.setDate(4, dto.getMsgDate());		
//			
//			result = psmt.executeUpdate();
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//			System.out.println("메시지 RCV_MSG T 입력 중 예외 발생");
//		}
//		return result;		
//	}
}
