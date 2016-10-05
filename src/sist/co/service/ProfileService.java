package sist.co.service;

import java.util.List;

import sist.co.model.MemberDTO;
import sist.co.model.PeedDTO;

public interface ProfileService {
	public int countPeed(MemberDTO memberDTO) throws Exception;
	public int countFollow(MemberDTO memberDTO) throws Exception;
	public int countFollower(MemberDTO memberDTO) throws Exception;
	public MemberDTO findMemberDTO(int member_seq) throws Exception;
	public List<PeedDTO> getPeedList(int member_seq) throws Exception;
	public int getMemberSeq(String id);
}
