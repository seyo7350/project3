package sist.co.dao;

import java.util.List;

import sist.co.model.FollowDTO;
import sist.co.model.MemberDTO;

public interface FollowDAO {

	public List<MemberDTO> getFollowList(MemberDTO memberDTO) throws Exception;
	public List<MemberDTO> getFollowerList(MemberDTO memberDTO) throws Exception;
}
