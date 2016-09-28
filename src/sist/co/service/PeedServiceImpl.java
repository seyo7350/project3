package sist.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.dao.PeedDAO;
import sist.co.model.FollowDTO;
import sist.co.model.MemberDTO;
import sist.co.model.PagingParam;
import sist.co.model.PeedDTO;
import sist.co.model.PeedReplyDTO;
import sist.co.model.ThumbsUpDTO;

@Service
public class PeedServiceImpl implements PeedService {
	
	@Autowired 
	private PeedDAO peedDAO;

	@Override
	public boolean writePeed(PeedDTO peedDTO) throws Exception {
		// TODO Auto-generated method stub
		peedDAO.writePeed(peedDTO);
		return true;
	}

	@Override
	public List<PeedDTO> getpeedlist(PagingParam param) throws Exception {
		// TODO Auto-generated method stub
		return peedDAO.getpeedlist(param);
	}
	

	@Override
	public int getPeedCount(PagingParam param) throws Exception {
		// TODO Auto-generated method stub
		return peedDAO.getPeedCount(param);
	}

	@Override
	public PeedDTO getPeed(int image_number) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PeedReplyDTO> getPeedReplylist(int peed_seq) throws Exception {
		// TODO Auto-generated method stub
		return peedDAO.getPeedReplylist(peed_seq);
	}

	@Override
	public void plusLikeCnt(PeedDTO peedDTO) throws Exception {
		peedDAO.plusLikeCnt(peedDTO);
	}

	@Override
	public void minusLikeCnt(PeedDTO peedDTO) throws Exception {
		peedDAO.minusLikeCnt(peedDTO);
	}

	@Override
	public void insertThumbsUp(ThumbsUpDTO thumbsUpDTO) throws Exception {
		peedDAO.insertThumbsUp(thumbsUpDTO);
	}

	@Override
	public void deleteThumbsUp(ThumbsUpDTO thumbsUpDTO) throws Exception {
		peedDAO.deleteThumbsUp(thumbsUpDTO);
	}

	@Override
	public int searchThumbsUp(ThumbsUpDTO thumbsUpDTO) throws Exception {
		return peedDAO.searchThumbsUp(thumbsUpDTO);
	}
	
	@Override
	public boolean insertreply(PeedReplyDTO replyDTO) throws Exception {
		// TODO Auto-generated method stub
		peedDAO.insertreply(replyDTO);
		return true;
	}
	
}