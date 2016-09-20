package sist.co.dao;

import java.util.List;

import sist.co.model.FollowDTO;
import sist.co.model.MemberDTO;
import sist.co.model.PagingParam;
import sist.co.model.PeedDTO;

public interface PeedDAO {
	
	public boolean writePeed(PeedDTO peedDTO) throws Exception;
	public List<PeedDTO> getpeedlist(PagingParam param) throws Exception;
	public PeedDTO getPeed(int image_number) throws Exception;
	public int getPeedCount(PagingParam param) throws Exception;

}
