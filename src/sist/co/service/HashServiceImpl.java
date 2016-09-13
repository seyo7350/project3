package sist.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.dao.HashDAO;
import sist.co.model.HashDTO;
import sist.co.model.MemberDTO;

@Service
public class HashServiceImpl implements HashService {
	
	@Autowired
	private HashDAO hashDAO;

	@Override
	public List<HashDTO> searchHash(String keyword) throws Exception {
		// TODO Auto-generated method stub
		return hashDAO.searchHash(keyword);
	}

	@Override
	public List<MemberDTO> searchMember(String keyword) throws Exception {
		// TODO Auto-generated method stub
		return hashDAO.searchMember(keyword);
	}
}
