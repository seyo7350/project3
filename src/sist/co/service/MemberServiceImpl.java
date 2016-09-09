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
	
	
	
}