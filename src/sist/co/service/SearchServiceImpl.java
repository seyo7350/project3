package sist.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.dao.SearchDAO;
import sist.co.model.SearchDTO;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SearchDAO searchDAO;

	@Override
	public List<SearchDTO> searchHash(String keyword) throws Exception {
		// TODO Auto-generated method stub
		return searchDAO.searchHash(keyword);
	}

	@Override
	public List<SearchDTO> searchMember(String keyword) throws Exception {
		// TODO Auto-generated method stub
		return searchDAO.searchMember(keyword);
	}
}
