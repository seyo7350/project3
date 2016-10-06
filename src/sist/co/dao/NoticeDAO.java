package sist.co.dao;

import java.util.List;
import sist.co.model.NoticeDTO;

public interface NoticeDAO {
	
	public List<NoticeDTO> getNoticeList(int member_seq) throws Exception;
	public boolean updateNoticeList(int member_seq) throws Exception;
	
	public boolean IntNotice0(NoticeDTO noticeDTO) throws Exception;
	public boolean IntNotice1(NoticeDTO noticeDTO) throws Exception;
	public boolean IntNotice2(NoticeDTO noticeDTO) throws Exception;

}
