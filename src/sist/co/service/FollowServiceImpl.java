package sist.co.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.dao.FollowDAO;
import sist.co.model.FollowDTO;
import sist.co.model.MemberDTO;

@Service
public class FollowServiceImpl implements FollowService {
	
	@Autowired FollowDAO followDAO;
	
	@Override
	public List<MemberDTO> getFollowList(MemberDTO memberDTO) throws Exception {
		List<MemberDTO> followList = new ArrayList<MemberDTO>();
		followList = followDAO.getFollowList(memberDTO);
		return followList;
	}
	
	@Override
	public List<MemberDTO> getFollowerList(MemberDTO memberDTO) throws Exception {
		List<MemberDTO> followerList = new ArrayList<MemberDTO>();
		followerList = followDAO.getFollowerList(memberDTO);
		return followerList;
	}
	
	@Override
	public int getFollow(FollowDTO followDTO) throws Exception {
		return followDAO.getFollow1(followDTO) + followDAO.getFollow2(followDTO);
	}

	@Override
	public boolean delFollow(FollowDTO followDTO) throws Exception {
		followDAO.delFollow(followDTO);
		return true;
	}

	@Override
	public boolean IntFollow(FollowDTO followDTO) throws Exception {
		followDAO.IntFollow(followDTO);
		return true;
	}

	@Override
	public boolean updateFollow(FollowDTO followDTO) throws Exception {
		followDAO.updateFollow(followDTO);
		return true;
	}

}
