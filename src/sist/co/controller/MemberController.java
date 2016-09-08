package sist.co.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
	@RequestMapping(value="index.do", method=RequestMethod.GET)
	public String login(Model model){
		return "index.tiles";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String login1(Model model){
		return "login.tiles";
	}
	
	@RequestMapping(value="regi.do", method=RequestMethod.POST)
	public String regi(Model model){
		return "regi.tiles";
	}
	
	@RequestMapping(value="newspeed.do", method=RequestMethod.POST)
	public String newspeed(Model model){
		return "newspeed.tiles";
	}
	
	@RequestMapping(value="profile.do",method={RequestMethod.GET, RequestMethod.POST})
	public String profile(Model model){
		return "profile.tiles";
	}

}
