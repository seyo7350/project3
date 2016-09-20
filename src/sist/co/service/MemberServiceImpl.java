package sist.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.dao.MemberDAO;
import sist.co.model.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public boolean addMember(MemberDTO memberDTO) throws Exception {
		
		memberDAO.addMember(memberDTO);
		return true;
	}

	@Override
	public List<MemberDTO> getMemberList() throws Exception {
		return memberDAO.getMemberList();
		
	}

	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		
		return memberDAO.login(memberDTO);
	}


	@Override
	public int alreadyCheck(MemberDTO memberDTO) throws Exception {
	
		return memberDAO.alreadyMemberId(memberDTO) + memberDAO.alreadyMemberEmail(memberDTO);
	}

	@Override
	public int loginPwd(MemberDTO memberDTO) throws Exception {
		return memberDAO.alreadyMemberId(memberDTO) + memberDAO.loginPwd(memberDTO);
	}
	
	@Override
	public boolean PWDChange(MemberDTO memberDTO) throws Exception {
		memberDAO.PWDChange(memberDTO);
		return true;
	}

	@Override
	public boolean profileChange(MemberDTO memberDTO) throws Exception {
		memberDAO.profileChange(memberDTO);
		return true;
	}

	@Override
	public boolean findPW(MemberDTO memberDTO) throws Exception {
		memberDAO.findPW(memberDTO);
		return true;
	}

	@Override
	public int alreadyMember(MemberDTO memberDTO) throws Exception {
		return memberDAO.alreadyMember(memberDTO);
	}

	@Override
	public MemberDTO getProfile(MemberDTO memberDTO) throws Exception {
		return memberDAO.getProfile(memberDTO);
	}

	@Override
	public boolean imageDelAF(MemberDTO memberDTO) throws Exception {
		memberDAO.imageDelAF(memberDTO);
		return true;
	}

	@Override
	public int chkMbId(String id) throws Exception {
		return memberDAO.chkMbId(id);
	}

	@Override
	public int chkMbEmail(String email) throws Exception {
		return memberDAO.chkMbEmail(email);
	}

	@Override
	public boolean upload(MemberDTO memberDTO) throws Exception {
		memberDAO.upload(memberDTO);
		return true;
	}

	@Override
	public String findEmail(MemberDTO memberDTO) throws Exception {
		return memberDAO.findEmail(memberDTO);
	}

	@Override
	public String Loadprofile(MemberDTO memberDTO) throws Exception {
		return memberDAO.Loadprofile(memberDTO);
	}
	

}
