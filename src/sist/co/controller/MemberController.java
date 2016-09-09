package sist.co.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	public boolean loginAf(HttpServletRequest request, Model model, MemberDTO memberDTO) throws Exception {
		logger.info("loginAf " + new Date());
		
		MemberDTO login = null;
		
		
		//회원 조회
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		memberList = memberService.getMemberList();
		
		for(MemberDTO list : memberList){
			if(list.getId().equals(memberDTO.getId()) && list.getPwd().equals(memberDTO.getPwd())) {
				login = memberService.login(memberDTO);
				request.getSession().setAttribute("login", login);
				
				return true;
			}
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
		model.addAttribute("id", id);
		return "newspeed.tiles";
	}
	
	@RequestMapping(value="profile.do",method={RequestMethod.GET, RequestMethod.POST})
	public String profile(Model model){
		return "profile.tiles";
	}
		
	@RequestMapping(value="logout.do", method=RequestMethod.GET)
	public String logout(HttpServletRequest request, Model model) throws Exception{
		logger.info("logout  " + new Date());
		
			request.getSession().invalidate();
			return "index.tiles";
	}
	
	@RequestMapping(value="edit.do",method={RequestMethod.GET, RequestMethod.POST})
	public String edit(Model model){
		return "edit.tiles";
	}
	
	@RequestMapping(value="pwdchange.do",method={RequestMethod.GET, RequestMethod.POST})
	public String pwdchange(Model model){
		return "pwdchange.tiles";
	}

}
