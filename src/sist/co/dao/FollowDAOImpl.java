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
	
	@Override
	public int getFollow1(FollowDTO followDTO) throws Exception {
		return sqlSession.selectOne(ns+"getFollow1", followDTO);
	}

	@Override
	public int getFollow2(FollowDTO followDTO) throws Exception {
		return sqlSession.selectOne(ns+"getFollow2", followDTO);
	}

	@Override
	public boolean delFollow(FollowDTO followDTO) throws Exception {
		sqlSession.update(ns+"delFollow", followDTO);
		return true;
	}

	@Override
	public boolean IntFollow(FollowDTO followDTO) throws Exception {
		sqlSession.insert(ns+"IntFollow", followDTO);
		return true;
	}

	@Override
	public boolean updateFollow(FollowDTO followDTO) throws Exception {
		sqlSession.update(ns+"updateFollow", followDTO);
		return true;
	}

	@Override
	public int getFollowConnect(FollowDTO followDTO) throws Exception {
		return sqlSession.selectOne(ns+"getFollowConnect", followDTO);
		
	}

}
