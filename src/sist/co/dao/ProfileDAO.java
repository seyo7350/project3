package sist.co.dao;

import java.util.List;

import sist.co.model.MemberDTO;
import sist.co.model.PeedDTO;

public interface ProfileDAO {

	public int countPeed(MemberDTO memberDTO) throws Exception;
	public int countFollow(MemberDTO memberDTO) throws Exception;
	public int countFollower(MemberDTO memberDTO) throws Exception;
	public MemberDTO findMemberDTO(int seq) throws Exception;
	public List<PeedDTO> getPeedList(int member_seq) throws Exception;
}
