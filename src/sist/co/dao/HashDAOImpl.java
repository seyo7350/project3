package sist.co.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.HashDTO;
import sist.co.model.MemberDTO;

@Repository
public class HashDAOImpl implements HashDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "Hash.";

	@Override
	public List<HashDTO> searchHash(String keyword) throws Exception {
		// TODO Auto-generated method stub
		List<HashDTO> hashList = new ArrayList<HashDTO>();
		hashList = sqlSession.selectList(ns+"searchHash", keyword);
		return hashList;
	}

	@Override
	public List<MemberDTO> searchMember(String keyword) throws Exception {
		// TODO Auto-generated method stub
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		memberList = sqlSession.selectList(ns+"searchMember", keyword);		
		return memberList;
	}

}
