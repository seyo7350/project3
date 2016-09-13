package sist.co.dao;

import java.util.List;

import sist.co.model.HashDTO;
import sist.co.model.MemberDTO;

public interface HashDAO {
	
	public List<HashDTO> searchHash(String keyword) throws Exception;
	
	public List<MemberDTO> searchMember(String keyword) throws Exception;

}
