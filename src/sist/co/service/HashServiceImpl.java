package sist.co.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.dao.HashDAO;

@Service
public class HashServiceImpl implements HashService {
	
	@Autowired
	private HashDAO hashDAO;
	
	@Override
	public int getLastPeedSeq() {
		// TODO Auto-generated method stub
		return hashDAO.getLastPeedSeq();
	}

	@Override
	public boolean insertHash(int peed_seq, String keyword) {
		// TODO Auto-generated method stub
		hashDAO.insertHash(peed_seq, keyword);
		return true;
	}

	@Override
	public int getHashSeq(String keyword) {
		// TODO Auto-generated method stub
		return hashDAO.getHashSeq(keyword);
	}

	@Override
	public int getPeedCount(int hash_seq) {
		// TODO Auto-generated method stub
		return hashDAO.getPeedCount(hash_seq);
	}

}
