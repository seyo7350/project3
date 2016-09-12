package sist.co.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.PeedDTO;

@Repository
public class PeedDAOImpl implements PeedDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private String ns="Peed.";
	
	@Override
	public boolean writePeed(PeedDTO peedDTO) throws Exception {
		sqlSession.insert(ns+"writePeed", peedDTO);
		return true;
	}
}
