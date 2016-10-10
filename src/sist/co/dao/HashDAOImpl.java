package sist.co.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.HashSubDTO;

@Repository
public class HashDAOImpl implements HashDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "Hash.";

	@Override
	public int getLastPeedSeq() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"getLastPeedSeq");
	}
	
	@Override
	public boolean insertHash(int peed_seq, String keyword) {
		// TODO Auto-generated method stub		
		int hash_seq = sqlSession.selectOne(ns+"getHashSeq", keyword);
		if(hash_seq == 0){
			sqlSession.insert(ns+"insertHash", keyword);
			hash_seq = sqlSession.selectOne(ns+"getLastHashSeq");
		}
		
		if(peed_seq > 0){
			HashSubDTO hashSubDTO = new HashSubDTO(0, peed_seq, hash_seq, 0);		// seq는 nextval, del은 0이 연결된거
			sqlSession.insert(ns+"insertHashSub", hashSubDTO);
		}		
		
		return true;
	}

	@Override
	public int getHashSeq(String keyword) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"getHashSeq", keyword);
	}

	@Override
	public int getPeedCount(int hash_seq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"getPeedCount", hash_seq);
	}

}
