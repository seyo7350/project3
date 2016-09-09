package sist.co.dao;

import java.util.List;

import sist.co.model.MemberDTO;

public interface MemberDAO {

	public boolean addMember(MemberDTO memberDTO) throws Exception;
	public List<MemberDTO> getMemberList() throws Exception; 
}