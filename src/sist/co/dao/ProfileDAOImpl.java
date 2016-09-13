package sist.co.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.MemberDTO;
import sist.co.model.PeedDTO;

@Repository
public class ProfileDAOImpl implements ProfileDAO {

	@Autowired
	private SqlSession sqlSession;
	private String ns = "profile.";
	
	@Override
	public int countPeed(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.selectOne(ns+"countPeed", memberDTO);
	}

	@Override
	public int countFollow(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.selectOne(ns+"countFollow", memberDTO);
	}

	@Override
	public int countFollower(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.selectOne(ns+"countFollower", memberDTO);
	}

	@Override
	public MemberDTO findMemberDTO(int member_seq) throws Exception {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = sqlSession.selectOne(ns+"findMemberDTO", member_seq);
		return memberDTO;
		
	}

	@Override
	public List<PeedDTO> getPeedList(int member_seq) throws Exception {
		
		List<PeedDTO> peedList = new ArrayList<PeedDTO>();
		peedList = sqlSession.selectList(ns+"getPeedList", member_seq);
		return peedList;
	}
	
}
