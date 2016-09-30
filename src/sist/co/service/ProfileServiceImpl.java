package sist.co.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.dao.ProfileDAO;
import sist.co.model.MemberDTO;
import sist.co.model.PeedDTO;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	private ProfileDAO profileDAO;

	@Override
	public int countPeed(MemberDTO memberDTO) throws Exception {
		return profileDAO.countPeed(memberDTO);
	}

	@Override
	public int countFollow(MemberDTO memberDTO) throws Exception {
		return profileDAO.countFollow(memberDTO);
	}

	@Override
	public int countFollower(MemberDTO memberDTO) throws Exception {
		return profileDAO.countFollower(memberDTO);
	}

	@Override
	public MemberDTO findMemberDTO(int seq) throws Exception {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = profileDAO.findMemberDTO(seq);
		return memberDTO;
		
	}

	@Override
	public List<PeedDTO> getPeedList(int member_seq) throws Exception {
		List<PeedDTO> peedList = new ArrayList<PeedDTO>();
		peedList = profileDAO.getPeedList(member_seq);
		return peedList;
	}
}
