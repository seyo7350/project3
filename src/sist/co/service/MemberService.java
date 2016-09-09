package sist.co.service;

import java.util.List;

import sist.co.model.MemberDTO;

public interface MemberService {

	public boolean addMember(MemberDTO memberDTO) throws Exception;
	public List<MemberDTO> getMemberList() throws Exception;
	public MemberDTO login(MemberDTO memberDTO) throws Exception;
	
	public int loginPwd(MemberDTO memberDTO) throws Exception;
	public int alreadyCheck(MemberDTO memberDTO) throws Exception;
}
