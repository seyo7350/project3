package sist.co.dao;

import java.util.List;

import sist.co.model.MemberDTO;

public interface MemberDAO {

	public boolean addMember(MemberDTO memberDTO) throws Exception;
	public List<MemberDTO> getMemberList() throws Exception; 
	public MemberDTO login(MemberDTO memberDTO) throws Exception;
	public boolean memberInfo(MemberDTO memberDTO) throws Exception;
	public int alreadyMemberId(MemberDTO memberDTO) throws Exception;
	public int alreadyMemberEmail(MemberDTO memberDTO) throws Exception;
	
}
