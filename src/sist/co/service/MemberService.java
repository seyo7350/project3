package sist.co.service;

import java.util.List;

import sist.co.model.MemberDTO;

public interface MemberService {

	public boolean addMember(MemberDTO memberDTO) throws Exception;
	public List<MemberDTO> getMemberList() throws Exception;
	public MemberDTO login(MemberDTO memberDTO) throws Exception;
	public int loginPwd(MemberDTO memberDTO) throws Exception;
	public int alreadyCheck(MemberDTO memberDTO) throws Exception;
	public boolean PWDChange(MemberDTO memberDTO) throws Exception;
	public boolean profileChange(MemberDTO memberDTO) throws Exception;
	public boolean findPW(MemberDTO memberDTO) throws Exception;
	public int alreadyMember(MemberDTO memberDTO) throws Exception;
	public MemberDTO getProfile(MemberDTO memberDTO) throws Exception;
	public boolean imageDelAF(MemberDTO memberDTO) throws Exception;
	public int chkMbId(String id) throws Exception; 
	public int chkMbEmail(String email) throws Exception; 
	public boolean upload(MemberDTO memberDTO) throws Exception;
	public String findEmail(MemberDTO memberDTO) throws Exception;
	public String Loadprofile(MemberDTO memberDTO) throws Exception;
}
