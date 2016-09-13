package sist.co.service;

import java.util.List;

import sist.co.model.FollowDTO;
import sist.co.model.MemberDTO;
import sist.co.model.PagingParam;
import sist.co.model.PeedDTO;

public interface PeedService {
	
	public boolean writePeed(PeedDTO peedDTO) throws Exception;
<<<<<<< HEAD
	public List<PeedDTO> getpeedlist(PagingParam param) throws Exception;
	

=======
	public List<PeedDTO> getpeedlist(PagingParam param, MemberDTO member, FollowDTO follow) throws Exception;
	public PeedDTO getPeed(int image_number) throws Exception;
>>>>>>> 4ffb023d05c00c6cb058ebe872e73204a9b460ce
}
