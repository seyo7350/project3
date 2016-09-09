package sist.co.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sist.co.model.MemberDTO;
import sist.co.service.MemberService;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="index.do", method={RequestMethod.GET, RequestMethod.POST})
	public String login(Model model){
		logger.info("login " + new Date());
		return "index.tiles";
	}
	
	@RequestMapping(value="login.do", method={RequestMethod.GET, RequestMethod.POST})
	public String login1(Model model){
		logger.info("login1 " + new Date());
		return "login.tiles";
	}
	
	@RequestMapping(value="loginAf.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public boolean loginAf(Model model, String id, String pwd) throws Exception {
		logger.info("loginAf " + new Date());
		
		//회원 조회
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		memberList = memberService.getMemberList();
		
		for(MemberDTO list : memberList){
			if(list.getId().equals(id) && list.getPwd().equals(pwd))
				return true;
		}
		
		return false;
	}
	
	@RequestMapping(value="regi.do", method={RequestMethod.GET, RequestMethod.POST})
	public String regi(Model model){
		logger.info("regi " + new Date());
		return "regi.tiles";
	}
	
	@RequestMapping(value="regiAf.do", method=RequestMethod.POST)
	@ResponseBody
	public boolean regiAf(Model model, String email, String fullname, String username, String password) throws Exception{
		logger.info("regiAf " + new Date());
		
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		memberList = memberService.getMemberList();
		
		for(MemberDTO list : memberList){
			if(list.getEmail().equals(email) && list.getId().equals(username)){
				return false;
			}
		}
		
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO.setEmail(email);
		memberDTO.setName(fullname);
		memberDTO.setId(username);
		memberDTO.setPwd(password);
		
		try {
			memberService.addMember(memberDTO);
		} catch (Exception e) {
			return false;
		}
		
		return true;
	}
	
	@RequestMapping(value="newspeed.do", method={RequestMethod.GET, RequestMethod.POST})
	public String newspeed(Model model, String id){
		logger.info("newspeed " + new Date());
		System.out.println(id);
		return "newspeed.tiles";
	}
	
	@RequestMapping(value="profile.do",method={RequestMethod.GET, RequestMethod.POST})
	public String profile(Model model){
		return "profile.tiles";
	}
	
	@RequestMapping(value="write.do",method={RequestMethod.GET, RequestMethod.POST})
	public String write(Model model){
		return "write.tiles";
	}

}
