package sist.co.dao;

import java.util.List;

import sist.co.model.FollowDTO;
import sist.co.model.MemberDTO;
import sist.co.model.PagingParam;
import sist.co.model.PeedDTO;
import sist.co.model.PeedReplyDTO;
import sist.co.model.ThumbsUpDTO;

public interface PeedDAO {
	
	public boolean writePeed(PeedDTO peedDTO) throws Exception;
	public List<PeedDTO> getpeedlist(PagingParam param) throws Exception;
	public PeedDTO getPeed(int image_number) throws Exception;
	public int getPeedCount(PagingParam param) throws Exception;
	public List<PeedReplyDTO> getPeedReplylist(int peed_seq) throws Exception;
	public void plusLikeCnt(PeedDTO peedDTO) throws Exception;
	public void minusLikeCnt(PeedDTO peedDTO) throws Exception;
	public void insertThumbsUp(ThumbsUpDTO thumbsUpDTO) throws Exception;
	public void deleteThumbsUp(ThumbsUpDTO thumbsUpDTO) throws Exception;
	public int searchThumbsUp(ThumbsUpDTO thumbsUpDTO) throws Exception;
	public boolean insertreply(PeedReplyDTO replyDTO) throws Exception;
	public boolean linkedContent(PeedDTO peedDTO);
	public void changeLikeState(ThumbsUpDTO thumbsUpDTO) throws Exception;
	public int countThumbsUp(PeedDTO peedDTO) throws Exception;
	public void delReply(PeedReplyDTO peedReplyDTO) throws Exception;
	public PeedReplyDTO getReplyDTO(PeedDTO peedDTO) throws Exception;
}
