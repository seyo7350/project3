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

import sist.co.model.FollowDTO;
import sist.co.model.MemberDTO;
import sist.co.service.FollowService;

@Controller
public class FollowController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired FollowService followService;
	
	@RequestMapping(value="follow.do", method={RequestMethod.GET, RequestMethod.POST})
	public String follow(Model model, MemberDTO memberDTO) throws Exception{
		logger.info("follow " + new Date());
		/*System.out.println(memberDTO.toString());*/
		
		List<MemberDTO> followList = new ArrayList<MemberDTO>();
		followList = followService.getFollowList(memberDTO);
		
		/*System.out.println("size : " + followList.size());
		System.out.println(followList.toString());
		*/
		model.addAttribute("followList", followList);
		
		return "modal4.tiles";
	}
	
	@RequestMapping(value="follower.do", method={RequestMethod.GET, RequestMethod.POST})
	public String follower(Model model, MemberDTO memberDTO) throws Exception{
		logger.info("follower " + new Date());
		/*System.out.println(memberDTO.toString());*/
		
		List<MemberDTO> followerList = new ArrayList<MemberDTO>();
		followerList = followService.getFollowerList(memberDTO);
		
		/*System.out.println(followerList+"@#$@#$@#$");*/
		
		model.addAttribute("followerList", followerList);
		
		return "modal3.tiles";
	}
	
	@RequestMapping(value="sendFollow.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String sendFollow(Model model, FollowDTO followDTO) throws Exception{
		logger.info("sendFollow " + new Date());
		System.out.println(followDTO.toString()+"시팔로팔로미");
		
		
		return "";
	}
}


















