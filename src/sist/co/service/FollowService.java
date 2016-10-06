package sist.co.service;

import java.util.List;

import sist.co.model.FFDTO;
import sist.co.model.FollowDTO;
import sist.co.model.MemberDTO;

public interface FollowService {

	public List<FFDTO> getFollowList(MemberDTO memberDTO) throws Exception;
	public List<FFDTO> getFollowerList(MemberDTO memberDTO) throws Exception;
	public int getFollow(FollowDTO followDTO) throws Exception;
	public boolean delFollow(FollowDTO followDTO) throws Exception;
	public boolean IntFollow(FollowDTO followDTO) throws Exception;
	public boolean updateFollow(FollowDTO followDTO) throws Exception;
	public int getFollowConnect(FollowDTO followDTO) throws Exception;
}
