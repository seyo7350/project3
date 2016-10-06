package sist.co.dao;

import java.util.List;

import sist.co.model.FFDTO;
import sist.co.model.FollowDTO;
import sist.co.model.MemberDTO;

public interface FollowDAO {

	public List<FFDTO> getFollowList(MemberDTO memberDTO) throws Exception;
	public List<FFDTO> getFollowerList(MemberDTO memberDTO) throws Exception;
	public int getFollow1(FollowDTO followDTO) throws Exception;
	public int getFollow2(FollowDTO followDTO) throws Exception;
	public boolean delFollow(FollowDTO followDTO) throws Exception;
	public boolean IntFollow(FollowDTO followDTO) throws Exception;
	public boolean updateFollow(FollowDTO followDTO) throws Exception;
	public int getFollowConnect(FollowDTO followDTO) throws Exception;
}
