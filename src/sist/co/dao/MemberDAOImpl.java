package sist.co.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "member.";
	
	@Override
	public boolean addMember(MemberDTO memberDTO) throws Exception {
		sqlSession.insert(ns+"addMember", memberDTO);
		return true;
	}

	@Override
	public List<MemberDTO> getMemberList() throws Exception {
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		memberList = sqlSession.selectList(ns+"getMemberList");
		return memberList;
	}

	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.selectOne(ns+"login", memberDTO);
	}

	@Override
	public int alreadyMemberId(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.selectOne(ns+"getId", memberDTO);
	}

	@Override
	public int alreadyMemberEmail(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.selectOne(ns+"getEmail", memberDTO);
	}

	@Override
	public int loginPwd(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(ns+"loginPwd", memberDTO);
	}

	@Override
	public boolean PWDChange(MemberDTO memberDTO) throws Exception {
		sqlSession.update(ns+"PWDChange", memberDTO);
		return true;
	}

}
