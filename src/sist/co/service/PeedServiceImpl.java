package sist.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.dao.PeedDAO;
import sist.co.model.FollowDTO;
import sist.co.model.MemberDTO;
import sist.co.model.PagingParam;
import sist.co.model.PeedDTO;

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
	
	
	
}