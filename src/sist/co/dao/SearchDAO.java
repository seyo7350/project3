package sist.co.dao;

import java.util.List;

import sist.co.model.PeedDTO;
import sist.co.model.SearchDTO;

public interface SearchDAO {
	
	public List<SearchDTO> searchHash(String keyword) throws Exception;
	
	public List<SearchDTO> searchMember(String keyword) throws Exception;
	
	public List<PeedDTO> getPeedList(int hash_seq);

}
