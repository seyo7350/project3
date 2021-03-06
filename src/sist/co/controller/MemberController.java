package sist.co.controller;

import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import sist.co.help.FUpUtil;
import sist.co.model.CheckMember;
import sist.co.model.FollowDTO;
import sist.co.model.MemberDTO;
import sist.co.model.NoticeDTO;
import sist.co.model.PagingParam;
import sist.co.model.PeedDTO;
import sist.co.model.SearchDTO;
import sist.co.service.HashService;
import sist.co.service.FollowService;
import sist.co.service.MemberService;
import sist.co.service.NoticeService;
import sist.co.service.PeedService;
import sist.co.service.ProfileService;
import sist.co.service.SearchService;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);    
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ProfileService profileService;
	
	@Autowired
	private FollowService followService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private HashService hashService;
	
	@Autowired
	private SearchService searchService;
	
	@Autowired
	private PeedService peedService;
	
	@Autowired
	private NoticeService noticeService;
	
	
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
	public CheckMember loginAf(HttpServletRequest request, Model model, MemberDTO memberDTO) throws Exception {
		logger.info("loginAf " + new Date());
		System.out.println(memberDTO.toString());
		int count = -1;
		MemberDTO login = memberService.login(memberDTO);
		
		/*count = memberService.loginPwd(memberDTO);*/
		
		CheckMember checkMember = new CheckMember();
		
		if(login != null){
			checkMember.setMessage("로그인 성공");
			request.getSession().setAttribute("login", login);
			//l_seq = login.getSeq();
		}else{
			checkMember.setMessage("로그인 실패");
		}
		
		return checkMember;
		
	}
	
	@RequestMapping(value="regi.do", method={RequestMethod.GET, RequestMethod.POST})
	public String regi(Model model){
		logger.info("regi " + new Date());
		return "regi.tiles";
	}
	
	@RequestMapping(value="regiAf.do", method=RequestMethod.POST)
	@ResponseBody
	public CheckMember regiAf(Model model, MemberDTO memberDTO) throws Exception {
		logger.info("regiAf " + new Date());
		
		int count = -1;
		
		count = memberService.alreadyCheck(memberDTO);
		
		CheckMember checkMember = new CheckMember();
		
		if(count > 1){
			checkMember.setMessage("회원가입 실패");
		}else{
			checkMember.setMessage("회원가입 성공");
			memberService.addMember(memberDTO);
		}
		
		return checkMember;
	}
	
	@RequestMapping(value="newspeed.do", method={RequestMethod.GET, RequestMethod.POST})
	public String newspeed(HttpServletRequest request, Model model, String id) throws Exception{
		logger.info("newspeed " + new Date());
		model.addAttribute("id", id);
		
		MemberDTO loginDTO = (MemberDTO)request.getSession().getAttribute("login");
		
		if(loginDTO == null){
			return "redirect:/index.do";
		}
		
		PagingParam p = new PagingParam();
		p.setMember_seq(loginDTO.getSeq());
		int totalPeedCount = peedService.getPeedCount(p);
		request.getSession().setAttribute("totalPeedCount", totalPeedCount);
		
		return "newspeed.tiles";
	}
	
	@RequestMapping(value="profile.do",method={RequestMethod.GET, RequestMethod.POST})
	public String profile(HttpServletRequest request, Model model, String id) throws Exception{
		logger.info("profile " + new Date());
		
		int seq = profileService.getMemberSeq(id);
		
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO = profileService.findMemberDTO(seq);
		
		List<PeedDTO> peedList = new ArrayList<PeedDTO>();
		peedList = profileService.getPeedList(seq);
		
		int peedCount = profileService.countPeed(memberDTO);
		
		int followCount = profileService.countFollow(memberDTO);
		
		int followerCount = profileService.countFollower(memberDTO);

		model.addAttribute("peedCount", peedCount);
		model.addAttribute("followCount", followCount);
		model.addAttribute("followerCount", followerCount);
		request.getSession().setAttribute("peedList", peedList);

		MemberDTO loginDTO = (MemberDTO)request.getSession().getAttribute("login");
		
		
		//팔로우 여부 확인
        FollowDTO followDTO = new FollowDTO();
        followDTO.setMember_seq(loginDTO.getSeq());
        followDTO.setFollow(seq);
        
        int follow = followService.getFollow(followDTO);
        System.out.println(followDTO.toString() ); 
        System.out.println("팔로우 관계 = " + follow );         
		request.getSession().setAttribute("follow", follow);
		
		request.getSession().setAttribute("mem", memberDTO);
		model.addAttribute("mem", memberDTO);
		
		String filename = memberService.Loadprofile(memberDTO);
		String file = "upload/" + filename;
		
		model.addAttribute("file", file);
			
		System.out.println("파일 위치 및 주소 = " + file );
		
		return "profile.tiles";
	}
	
	@RequestMapping(value="hash.do",method={RequestMethod.GET, RequestMethod.POST})
	public String hash(HttpServletRequest request, Model model, String keyword) throws Exception{
		logger.info("profile " + new Date());
				
		int hash_seq = hashService.getHashSeq(keyword);
		int peed_count = hashService.getPeedCount(hash_seq);
		
		DecimalFormat df = new DecimalFormat("#,###");
		String bottom = "게시물 " + df.format(peed_count) +"개";
		
		SearchDTO searchDTO = new SearchDTO();
		searchDTO.setTop(keyword);
		searchDTO.setBottom(bottom);
		
		
		List<PeedDTO> peedList = searchService.getPeedList(hash_seq);
		
		model.addAttribute("searchDTO", searchDTO);
		request.getSession().setAttribute("peedList", peedList);		
				
		return "hash.tiles";
	}
		
	@RequestMapping(value="logout.do", method=RequestMethod.GET)
	public String logout(HttpServletRequest request, Model model) throws Exception{
		logger.info("logout  " + new Date());
		   // l_seq = -1;
			request.getSession().invalidate();
			return "index.tiles";
	}
	
	@RequestMapping(value="edit.do",method={RequestMethod.GET, RequestMethod.POST})
	public String edit(Model model, MemberDTO memberDTO)throws Exception{
		logger.info("edit " + new Date());
		
		MemberDTO mem = null;
		mem = memberService.getProfile(memberDTO);
		model.addAttribute("mem", mem);
		
		String filename = memberService.Loadprofile(memberDTO);
		String file = "upload/" + filename;
		
		model.addAttribute("file", file);
		
		System.out.println("파일 위치 및 주소 = " + file );
		
		return "edit.tiles";
	}
	
	@RequestMapping(value="editAF.do",method={RequestMethod.GET, RequestMethod.POST})
	public String editAF(HttpServletRequest request, MemberDTO memberDTO, Model model) throws Exception{
		logger.info("editAF " + new Date());
		int seq = Integer.parseInt(request.getParameter("seq"));
		String id = request.getParameter("cid");
		memberDTO.setId(id);
		
		boolean isS = memberService.profileChange(memberDTO);
	
		
		if(isS){
			request.getSession().invalidate();
			
			MemberDTO login = null;
			login = memberService.login(memberDTO);
			request.getSession().setAttribute("login", login);
			
			return "redirect:/profile.do?id="+id;
		}else{
		   return "edit.tiles";
		}
	}
	
	
	
	@RequestMapping(value="pwdchange.do",method={RequestMethod.GET, RequestMethod.POST})
	public String pwdchange(Model model, MemberDTO memberDTO) throws Exception{
		logger.info("pwdchange " + new Date());
		
		String filename = memberService.Loadprofile(memberDTO);
		String file = "upload/" + filename;
		
		model.addAttribute("file", file);
		
		System.out.println("파일 위치 및 주소 = " + file );
		
		return "pwdchange.tiles";
	}


	@RequestMapping(value="pwdchangeAF.do",method={RequestMethod.GET, RequestMethod.POST})
	public String pwdchangeAF(MemberDTO memberDTO, Model model, HttpServletRequest request) throws Exception{

		boolean isS = memberService.PWDChange(memberDTO);
		String id = request.getParameter("id");
		
		if(isS){
            request.getSession().invalidate();
			MemberDTO login = null;
			login = memberService.login(memberDTO);
			request.getSession().setAttribute("login", login);
			
			return "redirect:/profile.do?id="+id;
		}else{
		   return "pwdchange.tiles";
		}
	}

	@RequestMapping(value="findPW.do",method={RequestMethod.GET, RequestMethod.POST})
	public String findPW(Model model){
		String t_pwd="";
		
		for(int j=0; j<8 ; j++){
			t_pwd+=(char)((Math.random()*26)+97);
		}
		model.addAttribute("t_pwd", t_pwd);
		return "findPW.tiles";
	}

	@RequestMapping(value="findPWAF.do",method={RequestMethod.GET, RequestMethod.POST})
	public String findPWAF(MemberDTO memberDTO, Model model, HttpServletRequest request) throws Exception{
		logger.info("findPWAF " + new Date());
		int count = -1;
		count = memberService.alreadyMember(memberDTO) ;
	
		if(count > 0){
			
			boolean isS = memberService.findPW(memberDTO);
			if(isS){
				String name = request.getParameter("name");
				String pwd = request.getParameter("pwd");
				String setfrom = "qlalf666@gmail.com";         
			    String tomail  = memberService.findEmail(memberDTO) ;   // 받는 사람 이메일
			    System.out.println("받는 사람 이메일 주소는 : "+ tomail);
			    String title   = "인수다구래문 임시 비밀번호 전송";      // 보내는 사람 이메일
			    String content = name+"님 안녕하세요 \n 인수다구래문 입니다. \n 변경된 비밀번호는 "+ pwd +" 입니다. \n 이 비밀번호로 로그인하신 후 반드시 비밀번호를 수정하세요~ \n 감사합니다. \n\n 인수다구래문 관리자 ";    // 메일내용
			    
			    try {
			      MimeMessage message = mailSender.createMimeMessage();
			      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
			      messageHelper.setTo(tomail);     // 받는사람 이메일
			      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			      messageHelper.setText(content);  // 메일 내용
			      mailSender.send(message);
			    } catch(Exception e){
			      System.out.println(e);
			    }
			    
				return "redirect:/index.do";
			}else{
				model.addAttribute("msg", "정보를 잘못 입력했습니다.");
			   return "findPW.tiles";
			}
		}else{
			model.addAttribute("msg", "정보를 잘못 입력했습니다.");
			return "findPW.tiles";
		}
	}

	@RequestMapping(value="imageDelAF.do",method={RequestMethod.GET, RequestMethod.POST})
	public String imageDelAF(MemberDTO memberDTO, Model model, HttpServletRequest request) throws Exception{
		logger.info("imageDelAF " + new Date());
		
		MemberDTO login = null;
		String id = ((MemberDTO)request.getSession().getAttribute("login")).getId();
		String pwd = ((MemberDTO)request.getSession().getAttribute("login")).getPwd();
		
		boolean isS = memberService.imageDelAF(memberDTO);
		if(isS){

			memberDTO.setId(id);
			memberDTO.setPwd(pwd);
			
			login = memberService.login(memberDTO);
			
			System.out.println(memberDTO.toString());
			
			request.getSession().setAttribute("login", login);
			
			return "redirect:/profile.do?id="+id;
		}else{
			return "redirect:/profile.do?id="+id;
		}
	}
	
	 /**  회원 아이디 중복 체크 */
	 @RequestMapping("chkMbId.do")
	 @ResponseBody
	 public Map<String, String> chkMbId(String id) throws Exception {
	  
	  Map<String, String> resultMap = new HashMap<String, String>();
	  
	  int resultCnt = memberService.chkMbId(id);
	  String result = "";
	  String resultMsg = "";
	  if ( resultCnt == 0 ){
	   result = "success";
	   resultMsg = "사용가능한 아이디입니다.";
	  } else {
	   result = "failure";
	   resultMsg = "이미 사용중인 아이디입니다.\n\n단, 회원님이 사용하는 아이디는 사용가능합니다.";
	  }
	  
	  resultMap.put("result", result);
	  resultMap.put("resultMsg", resultMsg);
	  
	  return resultMap;
	 } 

	 /**  회원 이메일 중복 체크 */
	 @RequestMapping("chkMbEmail.do")
	 @ResponseBody
	 public Map<String, String> chkMbEmail(String email) throws Exception {
	  
	  Map<String, String> resultMap = new HashMap<String, String>();
	  
	  int resultCnt = memberService.chkMbEmail(email);
	  String result = "";
	  String resultMsg = "";
	  if ( resultCnt == 0 ){
	   result = "success";
	   resultMsg = "사용가능한 이메일입니다.";
	  } else {
	   result = "failure";
	   resultMsg = "이미 사용중인 이메일입니다.\n\n단, 회원님이 사용하는 이메일은 사용가능합니다.";
	  }
	  
	  resultMap.put("result", result);
	  resultMap.put("resultMsg", resultMsg);
	  
	  return resultMap;
	 } 
	 
	 @RequestMapping(value="uploadAF.do", method=RequestMethod.POST)
		public String uploadAF(@RequestParam(value="fileload", required=false)MultipartFile fileload, Model model, MemberDTO memberDTO, HttpServletRequest request){
			
		    logger.info("uploadAF");
		    		    
			System.out.println(fileload.getOriginalFilename());
			
			MemberDTO login = null;
			String id = ((MemberDTO)request.getSession().getAttribute("login")).getId();
			int seq = ((MemberDTO)request.getSession().getAttribute("login")).getSeq();
			String pwd = ((MemberDTO)request.getSession().getAttribute("login")).getPwd();
			
			
			System.out.println(memberDTO.toString());

			/*String fupload = "c:\\upload";*/
			String fupload = request.getServletContext().getRealPath("/upload");
			logger.info(": " + fupload);

			String f = fileload.getOriginalFilename();
			String newFile = FUpUtil.getNewFile(f);
			logger.info(fupload + "/" + newFile);
			
			memberDTO.setSeq(seq);
			memberDTO.setProfile_image(newFile);
			
			try {
				File file = new File(fupload + "/" + newFile);
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				
				System.out.println(memberDTO.toString());
				
				memberService.upload(memberDTO);
				logger.info("프로필 이미지 업로드 success");
				
				memberDTO.setId(id);
				memberDTO.setPwd(pwd);
				
				login = memberService.login(memberDTO);
				
				System.out.println(memberDTO.toString());
				
				request.getSession().setAttribute("login", login);
				
			} catch (Exception e) {

				logger.info("프로필 이미지 업로드 fail");
			}

			return "redirect:/profile.do?id="+id;
			
		}	
	 
	 @RequestMapping(value="delFollow.do",method={RequestMethod.GET, RequestMethod.POST})
		public String delFollow(Model model, HttpServletRequest request, FollowDTO followDTO) throws Exception{
			logger.info("delFollow " + new Date());

			String mseq = request.getParameter("member_seq");
			String fseq = request.getParameter("follow");
			String id = request.getParameter("sid");
			
			int member_seq = Integer.parseInt(mseq);
			int follow = Integer.parseInt(fseq);
			
			followDTO.setMember_seq(member_seq);
			followDTO.setFollow(follow);

		    boolean isS = followService.delFollow(followDTO);
			
			if(isS){
				return "redirect:/profile.do?id="+id;
			}else{
				return "redirect:/profile.do?id="+id;
			}
		}
		
		@RequestMapping(value="IntFollow.do",method={RequestMethod.GET, RequestMethod.POST})
		public String IntFollow(Model model, HttpServletRequest request, FollowDTO followDTO, NoticeDTO noticeDTO) throws Exception{
			logger.info("IntFollow " + new Date());

			String mseq = request.getParameter("member_seq");
			String fseq = request.getParameter("follow");
			String id = request.getParameter("sid");
			
			int seq = Integer.parseInt(fseq);
			int member_seq = Integer.parseInt(mseq);
			int follow = Integer.parseInt(fseq);
			
			
			followDTO.setMember_seq(member_seq);
			followDTO.setFollow(follow);

		    boolean isS = followService.IntFollow(followDTO);
		    
		    //알림 생성
		    String who_id = request.getParameter("id");
		    String who_profile = request.getParameter("profile_image");
		    noticeDTO.setWho_id(who_id);
		    noticeDTO.setWho_seq(member_seq);
		    noticeDTO.setMember_seq(follow);
		    noticeDTO.setWho_profile(who_profile);
	 
		    boolean isB = noticeService.IntNotice2(noticeDTO);
			
			if(isS && isB){
				return "redirect:/profile.do?id="+id;
			}else{
				return "redirect:/profile.do?id="+id;
			}
			
		}
		
		@RequestMapping(value="updateFollow.do",method={RequestMethod.GET, RequestMethod.POST})
		public String updateFollow(Model model, HttpServletRequest request, FollowDTO followDTO, NoticeDTO noticeDTO) throws Exception{
			logger.info("updateFollow " + new Date());

			String mseq = request.getParameter("member_seq");
			String fseq = request.getParameter("follow");
			String id = request.getParameter("sid");
			
			int seq = Integer.parseInt(fseq);
			int member_seq = Integer.parseInt(mseq);
			int follow = Integer.parseInt(fseq);
			
			followDTO.setMember_seq(member_seq);
			followDTO.setFollow(follow);

		    boolean isS = followService.updateFollow(followDTO);
		    
		    //알림 생성
		    String who_id = request.getParameter("id");
		    String who_profile = request.getParameter("profile_image");
		    noticeDTO.setWho_id(who_id);
		    noticeDTO.setWho_seq(member_seq);
		    noticeDTO.setMember_seq(follow);
		    noticeDTO.setWho_profile(who_profile);
	 
		    boolean isB = noticeService.IntNotice2(noticeDTO);
		    
			
			if(isS && isB){
				return "redirect:/profile.do?id="+id;
			}else{
				return "redirect:/profile.do?id="+id;
			}
			
		}
		
		 
		@RequestMapping(value="singo.do",method={RequestMethod.GET, RequestMethod.POST})
		public String singo(Model model, HttpServletRequest request) throws Exception{
			logger.info("singo " + new Date());
			
			String id = request.getParameter("id");  //내 아이디
			String seq = request.getParameter("member_seq"); //내 시퀀스
			String sid = request.getParameter("sid"); //신고하는 넘 아이디   
			String sseq = request.getParameter("follow"); //신고하는 넘 시퀀스

	
			model.addAttribute("id", id);	
			model.addAttribute("seq", seq);	
			model.addAttribute("sid", sid);	
			model.addAttribute("sseq", sseq);		
			
			return "singo.tiles";
		}
		
		@RequestMapping(value="singoAF.do",method={RequestMethod.GET, RequestMethod.POST})
		public String singoAF(Model model, HttpServletRequest request) throws Exception{
			logger.info("singoAF " + new Date());
			        
			        String id = request.getParameter("id"); 
			       
			        
					String setfrom = "qlalf666@gmail.com";         
				    String tomail  = "qlalf666@gmail.com";  
				    String title   = "인수다구래문 신고";      // 보내는 사람 이메일
				    String content = request.getParameter("content1") +"\n\n" + request.getParameter("content2") ;   // 메일내용
				    
				    System.out.println(content);
				    
				    try {
				      MimeMessage message = mailSender.createMimeMessage();
				      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
				      messageHelper.setTo(tomail);     // 받는사람 이메일
				      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				      messageHelper.setText(content);  // 메일 내용
				      mailSender.send(message);
				    } catch(Exception e){
				      System.out.println(e);
				    }
				    return "redirect:/profile.do?id="+id;
		}
		
		@RequestMapping(value="introduction.do",method={RequestMethod.GET, RequestMethod.POST})
		public String introduction(Model model) throws Exception{
			logger.info("introduction " + new Date());
			return "introduction.tiles";
		}
		
		@RequestMapping(value="member.do",method={RequestMethod.GET, RequestMethod.POST})
		public String member(Model model) throws Exception{
			logger.info("member " + new Date());
			return "member.tiles";
		}
		
		@RequestMapping(value="model.do",method={RequestMethod.GET, RequestMethod.POST})
		public String model(Model model) throws Exception{
			logger.info("model " + new Date());
			return "model.tiles";
		}
		
		@RequestMapping(value="flow.do",method={RequestMethod.GET, RequestMethod.POST})
		public String flow(Model model) throws Exception{
			logger.info("flow " + new Date());
			return "flow.tiles";
		}
		
		@RequestMapping(value="sogam.do",method={RequestMethod.GET, RequestMethod.POST})
		public String sogam(Model model) throws Exception{
			logger.info("sogam " + new Date());
			return "sogam.tiles";
		}

}
