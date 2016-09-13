package sist.co.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.FollowDTO;
import sist.co.model.MemberDTO;
import sist.co.model.PagingParam;
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

	@Override
	public List<PeedDTO> getpeedlist(PagingParam param) throws Exception {
		
		List<PeedDTO> peedlist = new ArrayList<PeedDTO>();
		peedlist = sqlSession.selectList(ns+"getpeedlist", param);
		
		return peedlist;
	}

	@Override
	public PeedDTO getPeed(int image_number) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
