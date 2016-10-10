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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sist.co.model.CheckMember;
import sist.co.model.FFDTO;
import sist.co.model.FollowDTO;
import sist.co.model.MemberDTO;
import sist.co.service.FollowService;

@Controller
public class FollowController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired FollowService followService;
	
	@RequestMapping(value="follow.do", method={RequestMethod.GET, RequestMethod.POST})
	public String follow(HttpServletRequest request, Model model, MemberDTO memberDTO) throws Exception{
		logger.info("follow " + new Date());
		System.out.println(memberDTO.toString()+"((((((((((((");
		
		List<FFDTO> followList = new ArrayList<FFDTO>();
		followList = followService.getFollowList(memberDTO);
		
		System.out.println("size : " + followList.size());
		System.out.println(followList.toString()+"!@#!@#!@#!@#");
		
		MemberDTO loginDTO = (MemberDTO)request.getSession().getAttribute("login");
		int member_seq = loginDTO.getSeq();
		
		for(int i = 0; i < followList.size(); i++){
			int follow = followList.get(i).getFollow();
			FollowDTO fdto = new FollowDTO(0, member_seq, follow, 0);
			System.out.println(i +"번쨰 " + fdto.toString());
			int follow_connect = followService.getMyFollowConnect(fdto);	// 어떤새끼 프로필 들어갔을 때 팔로워리스트에 있는 놈들과 로그인한 사람과의 관계 -> 팔로우 되어 있으면 1, 아니면 0
			followList.get(i).setFollow_connect(follow_connect);
		}
		
		model.addAttribute("followList", followList);
		
		//팔로우 여부 확인
		/*MemberDTO memberDTO2 = (MemberDTO) request.getSession().getAttribute("login");
        FollowDTO followDTO = new FollowDTO();
        followDTO.setMember_seq(memberDTO2.getSeq());
        followDTO.setFollow(seq);
        
        int follow = followService.getFollow(followDTO);
        System.out.println("팔로우 관계 = " + follow );         
		request.getSession().setAttribute("follow", follow);*/
		
		return "modal4.tiles";
	}
	
	@RequestMapping(value="follower.do", method={RequestMethod.GET, RequestMethod.POST})
	public String follower(HttpServletRequest request, Model model, MemberDTO memberDTO) throws Exception{
		logger.info("follower " + new Date());
		System.out.println(memberDTO.toString());
		
		List<FFDTO> followerList = new ArrayList<FFDTO>();
		followerList = followService.getFollowerList(memberDTO);
		
		MemberDTO loginDTO = (MemberDTO)request.getSession().getAttribute("login");
		int member_seq = loginDTO.getSeq();
		
		for(int i = 0; i < followerList.size(); i++){
			int follow = followerList.get(i).getMember_seq();
			FollowDTO fdto = new FollowDTO(0, member_seq, follow, 0);
			System.out.println(i +"번쨰 " + fdto.toString());
			int follow_connect = followService.getMyFollowConnect(fdto);	// 어떤새끼 프로필 들어갔을 때 팔로워리스트에 있는 놈들과 로그인한 사람과의 관계 -> 팔로우 되어 있으면 1, 아니면 0
			followerList.get(i).setFollow_connect(follow_connect);
		}
		
		System.out.println(followerList+"@#$@#$@#$");
		
		model.addAttribute("followerList", followerList);
		
		//팔로우 여부 확인
        /*FollowDTO followDTO = new FollowDTO();
        followDTO.setMember_seq(l_seq);
        followDTO.setFollow(seq);
        
        int follow = followService.getFollow(followDTO);
        System.out.println("팔로우 관계 = " + follow );         
		request.getSession().setAttribute("follow", follow);*/
		
		return "modal3.tiles";
	}
	
	@RequestMapping(value="sendFollow.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int sendFollow(Model model, FollowDTO followDTO, HttpServletRequest request) throws Exception{
		logger.info("sendFollow " + new Date());
		System.out.println(followDTO.toString()+"팔로팔로미");
		
		int getFollow_count = followService.getFollow(followDTO);
		
		if(getFollow_count == 1){
			followService.updateFollow(followDTO);
		}else if(getFollow_count == 0){
			followService.IntFollow(followDTO);
		}else if(getFollow_count == 2){
			return getFollow_count;
			
		}
		
		int follow_check = followService.getFollow(followDTO);
	    
	    if(follow_check == 2){
	    	System.out.println(follow_check+"팔로팔로미2");
	    	int follow_connect_cnt = followService.getFollowConnect(followDTO);
	    	System.out.println(follow_connect_cnt+"팔로팔로미_1");
	    	request.getSession().setAttribute("follow_connect_cnt", follow_connect_cnt);
	    	return follow_check;
		}else{
			System.out.println(follow_check+"팔로팔로미3");
			return follow_check;
		}
	}
	
	@RequestMapping(value="cancleFollow.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public boolean cancleFollow(Model model, FollowDTO followDTO, HttpServletRequest request) throws Exception{
		logger.info("sendFollow " + new Date());
		
		boolean isS = followService.delFollow(followDTO);
		System.out.println(isS + "팔로우 취소 컨트롤러");
		
		return isS;
	}
}


















