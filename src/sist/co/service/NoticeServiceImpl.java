package sist.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.dao.NoticeDAO;
import sist.co.model.NoticeDTO;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	public List<NoticeDTO> getNoticeList(int member_seq) throws Exception {
		return noticeDAO.getNoticeList(member_seq);
	}

	
	
	
	@Override
	public boolean updateNoticeList(int member_seq) throws Exception {
		noticeDAO.updateNoticeList(member_seq);
		return true;
	}

	@Override
	public boolean IntNotice0(NoticeDTO noticeDTO) throws Exception {
		noticeDAO.IntNotice0(noticeDTO);
		return true;
	}

	@Override
	public boolean IntNotice1(NoticeDTO noticeDTO) throws Exception {
		noticeDAO.IntNotice1(noticeDTO);
		return true;
	}

	@Override
	public boolean IntNotice2(NoticeDTO noticeDTO) throws Exception {
		noticeDAO.IntNotice2(noticeDTO);
		return true;
	}
	
	

}
