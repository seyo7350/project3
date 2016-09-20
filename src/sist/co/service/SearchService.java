package sist.co.service;

import java.util.List;

import sist.co.model.SearchDTO;

public interface SearchService {
	
	public List<SearchDTO> searchHash(String keyword) throws Exception;
	
	public List<SearchDTO> searchMember(String keyword) throws Exception;

}
