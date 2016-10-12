package sist.co.service;

import java.util.List;

import sist.co.model.NoticeDTO;

public interface NoticeService {
	
	public List<NoticeDTO> getNoticeList(int member_seq) throws Exception;
	public boolean updateNoticeList(int member_seq) throws Exception;
	
	public boolean IntNotice0(NoticeDTO noticeDTO) throws Exception;
	public boolean IntNotice1(NoticeDTO noticeDTO) throws Exception;
	public boolean IntNotice2(NoticeDTO noticeDTO) throws Exception;
	public boolean IntNotice3(NoticeDTO noticeDTO) throws Exception;
	public boolean IntNotice4(NoticeDTO noticeDTO) throws Exception;
	public boolean IntNotice5(NoticeDTO noticeDTO) throws Exception;
	
}
