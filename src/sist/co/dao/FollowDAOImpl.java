package sist.co.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.FollowDTO;
import sist.co.model.MemberDTO;

@Repository
public class FollowDAOImpl implements FollowDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "follow.";
	
	@Override
	public List<MemberDTO> getFollowList(MemberDTO memberDTO) throws Exception {
		List<MemberDTO> followList = new ArrayList<MemberDTO>();
		followList = sqlSession.selectList(ns+"getFollowList", memberDTO);
		return followList;
	}
	
	@Override
	public List<MemberDTO> getFollowerList(MemberDTO memberDTO) throws Exception {
		List<MemberDTO> followerList = new ArrayList<MemberDTO>();
		followerList = sqlSession.selectList(ns+"getFollowerList", memberDTO);
		return followerList;
	}

}
