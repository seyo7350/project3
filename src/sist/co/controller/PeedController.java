package sist.co.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.cj.x.json.JsonArray;

import sist.co.help.FUpUtil;

import sist.co.model.PagingParam;

import sist.co.model.MemberDTO;
import sist.co.model.NoticeDTO;
import sist.co.model.PeedDTO;
import sist.co.service.HashService;
import sist.co.service.NoticeService;
import sist.co.model.PeedReplyDTO;
import sist.co.model.ThumbsUpDTO;
import sist.co.service.PeedService;

@Controller
public class PeedController {
	private static final Logger logger = LoggerFactory.getLogger(PeedController.class);
	
	@Autowired
	private PeedService peedService;
	
	@Autowired
	private HashService hashService;
	
	@Autowired 
	private NoticeService noticeService;
	
	@RequestMapping(value="article.do",method={RequestMethod.GET, RequestMethod.POST})
	public String newspeedsarticle(HttpServletRequest request, PagingParam param, Model model) throws Exception{
		logger.info("newspeedarticle " + new Date());
				
		int member_seq = ((MemberDTO)request.getSession().getAttribute("login")).getSeq();
		
		// paging
		int sn = param.getIndex();
		int start = sn*param.getPeedCountPerPage() + 1;
		int end = (sn+1)*param.getPeedCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		param.setMember_seq(member_seq);
		System.out.println(param.toString());
		
		int totalPeedCount = peedService.getPeedCount(param);
		List<PeedDTO> peedlist = peedService.getpeedlist(param);
		
		System.out.println("totalPeedCount:" +totalPeedCount);
		System.out.println("size:" + peedlist.size());
		System.out.println("peedlist:"+ peedlist.toString());		
		
		List<List<PeedReplyDTO>> peedreplylist = new ArrayList<List<PeedReplyDTO>>();
		
		// 좋아요
		ThumbsUpDTO thumbsUpDTO = new ThumbsUpDTO();
		/*thumbsUpDTO.setPeed_seq(peed_seq);*/
		thumbsUpDTO.setMember_seq(param.getMember_seq());
		
		System.out.println(thumbsUpDTO.toString()+"떰쩝");
		
		List<Integer> likeList = new ArrayList<Integer>();
		
		
		
		for(int i = 0; i<peedlist.size(); i++){
			List<PeedReplyDTO> replylist = peedService.getPeedReplylist(peedlist.get(i).getSeq());
			peedreplylist.add(replylist);
			
			thumbsUpDTO.setPeed_seq(peedlist.get(i).getSeq());
			likeList.add(peedService.searchThumbsUp(thumbsUpDTO));
			
		}
		System.out.println("peedreplylist:"+peedreplylist.toString());
		
		request.getSession().setAttribute("peedListIsEmpty", "true");
		
		model.addAttribute("peedreplylist", peedreplylist);
		model.addAttribute("peedlist", peedlist);
		request.getSession().setAttribute("likeList", likeList);
		
		request.getSession().setAttribute("totalPeedCount", totalPeedCount);
		
		return "article.tiles";
	}
	
	@RequestMapping(value="write.do",method={RequestMethod.GET, RequestMethod.POST})
	public String write(Model model){
		return "write.tiles";
	}
	
	@RequestMapping(value="writeAf.do", method=RequestMethod.POST)
	public String writeAf(@RequestParam(value="fileload", required=false)MultipartFile fileload, Model model, PeedDTO peedDTO, HttpServletRequest request){
		
		
		System.out.println(fileload.getOriginalFilename());
		
		peedDTO.setImage(fileload.getOriginalFilename());
		
		System.out.println(peedDTO.toString());
		
		/*return "redirect:/write.do";*/
		
		/*String fupload0 = "D:/3hdProject/Project3/upload";*/
		String fupload = request.getServletContext().getRealPath("/upload");
		logger.info(": " + fupload);
		
		String f = peedDTO.getImage();
		String newFile = FUpUtil.getNewFile(f);
		logger.info(fupload + "/" + newFile);
		
		peedDTO.setImage(newFile);
		
		try {
			File file = new File(fupload + "/" + newFile);
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			/*File file1 = new File(fupload0 + "/" + newFile);
			FileUtils.writeByteArrayToFile(file1, fupload0.getBytes());*/
			
			System.out.println(peedDTO.toString());
			
			peedService.writePeed(peedDTO);
			logger.info("writeAf success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.info("writeAf fail");
		}
		
		// hash, a 링크걸고 hash 추가 시키기
		String content = peedDTO.getContent();
		String linkedContent = "";
		int start_pos = -1;
		int hash_pos = -1;
		int at_pos = -1;		
		int next_hash_pos = -1;	// 뒤에 바로 #이 붙는 경우
		int next_at_pos = -1;
		int end_enter_pos = -1;
		int end_space_pos = -1;
		int end_pos = -1;
		String keyword = "";
		int peed_seq = hashService.getLastPeedSeq();
		
		while(true){
			int data[] = new int[]{Integer.MAX_VALUE, Integer.MAX_VALUE, Integer.MAX_VALUE, Integer.MAX_VALUE};
			
			data[0] = content.indexOf('#')<0?Integer.MAX_VALUE:content.indexOf('#');
			data[1] = content.indexOf('@')<0?Integer.MAX_VALUE:content.indexOf('@');
			
			start_pos = min(data);
			
			if(start_pos==Integer.MAX_VALUE){
				linkedContent += content;
				break;
			}else{
				data[0] = content.indexOf('#', start_pos+1)<0?Integer.MAX_VALUE:content.indexOf('#', start_pos+1);
				data[1] = content.indexOf('@', start_pos+1)<0?Integer.MAX_VALUE:content.indexOf('@', start_pos+1);
				data[2] = content.indexOf('\n', start_pos+1)<0?Integer.MAX_VALUE:content.indexOf('\n', start_pos+1);
				data[3] = content.indexOf(' ', start_pos+1)<0?Integer.MAX_VALUE:content.indexOf(' ', start_pos+1);
				
				end_pos = min(data);
				
				end_pos = end_pos==Integer.MAX_VALUE?content.length():end_pos;
				
				if(start_pos == content.indexOf('#')){	// 해시면 해시 추가
					keyword = content.substring(start_pos + 1, end_pos);
					System.out.println("insert 전 keyword : " + keyword);			
					hashService.insertHash(peed_seq, keyword.trim());
					linkedContent += content.substring(0, start_pos);
					linkedContent += "<a href='./hash.do?keyword="+keyword+"'>#" + keyword + "</a>";
				}else if(start_pos == content.indexOf('@')){
					keyword = content.substring(start_pos + 1, end_pos);
					linkedContent += content.substring(0, start_pos);
					linkedContent += "<a href='./profile.do?id="+keyword+"'>@" + keyword + "</a>";
				}
				
				System.out.println("end_pos : " + end_pos);
				
				content = content.substring(end_pos);
				
			}		
			
		}
		
		System.out.println("마지막에 : " + linkedContent);
		PeedDTO linkedPeed = new PeedDTO();
		linkedPeed.setSeq(peed_seq);
		linkedPeed.setContent(linkedContent);
		peedService.linkedContent(linkedPeed);
		
		return "redirect:/newspeed.do";
	}
	
	public int min(int[] data){
		int min = Integer.MAX_VALUE;
		
		for(int i = 0; i < data.length; i++){
			if(data[i] < min){
				min = data[i];
			}
		}
		return min;
	}
	
	// 개인 피드
	@RequestMapping(value="detail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String detail(HttpServletRequest request, Model model, int peed_index, PeedDTO peedDTO) throws Exception{
		logger.info("detail " + new Date());
		System.out.println(peedDTO.toString()+"피이이이뜨");
		request.getSession().setAttribute("peed_index", peed_index);
		
		List<PeedDTO> peedList = (List<PeedDTO>)(request.getSession().getAttribute("peedList"));
		int peed_seq = peedList.get(peed_index).getSeq();
		
		ThumbsUpDTO thumbsUpDTO = new ThumbsUpDTO();
		thumbsUpDTO.setPeed_seq(peed_seq);
		thumbsUpDTO.setMember_seq(peedDTO.getMember_seq());
		
		System.out.println(thumbsUpDTO.toString()+"떰쩝");
		
		int like_state = peedService.searchThumbsUp(thumbsUpDTO);		
		
		request.getSession().setAttribute("like_state", like_state);
		
		peedDTO.setSeq(thumbsUpDTO.getPeed_seq());
		
		int countThumbsUp = peedService.countThumbsUp(peedDTO);
		System.out.println(countThumbsUp+"좋아요 몇개");
		model.addAttribute("countThumbsUp", countThumbsUp);
		
		List<PeedReplyDTO> detailReplyList = new ArrayList<PeedReplyDTO>();
		
		detailReplyList = peedService.getPeedReplylist(peed_seq);
		
		model.addAttribute("detailReplyList", detailReplyList);
		
		return "modal5.tiles";

	}
	
	@RequestMapping(value="plusPeedCnt.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int plusPeedCnt(HttpServletRequest request, Model model, int peed_index, int member_seq, NoticeDTO noticeDTO) throws Exception{
		logger.info("plusPeedCnt " + new Date());
		
		List<PeedDTO> peedList = (List<PeedDTO>) request.getSession().getAttribute("peedList");
		int peed_seq = peedList.get(peed_index).getSeq();
		
		ThumbsUpDTO thumbsUpDTO = new ThumbsUpDTO();
		
		thumbsUpDTO.setMember_seq(member_seq);
		thumbsUpDTO.setPeed_seq(peed_seq);
		
		System.out.println(thumbsUpDTO.toString()+"굿굿");
		
		peedService.insertThumbsUp(thumbsUpDTO);
		
		PeedDTO peedDTO = new PeedDTO();
		peedDTO.setSeq(thumbsUpDTO.getPeed_seq());
		
		peedService.plusLikeCnt(peedDTO);
		System.out.println("좋아요 +1");
		
		/*thumbsUpDTO.setLike_state(1);*/
		
		System.out.println(thumbsUpDTO.toString()+"좋아요 누르기");
		
	  /*request.getSession().setAttribute("thumbsUpDTO", thumbsUpDTO);
		request.getSession().setAttribute("peedDTO", peedDTO);
		*/
		
		int like_state = peedService.searchThumbsUp(thumbsUpDTO);		
		
		System.out.println(like_state+"좋아요 하고 라이크 스테이트");
		
		request.getSession().setAttribute("like_state", like_state);
		
		int p_countThumbsUp = peedService.countThumbsUp(peedDTO);
		System.out.println(p_countThumbsUp+"좋아요 몇개++++");
		
		System.out.println("p_countThumbsUp : " + p_countThumbsUp);
		
		
		MemberDTO loginDTO = (MemberDTO)request.getSession().getAttribute("login");
		noticeDTO.setWho_id(loginDTO.getId());    
		noticeDTO.setWho_seq(loginDTO.getSeq());
		
		MemberDTO memDTO = (MemberDTO)request.getSession().getAttribute("mem");
       	noticeDTO.setMember_seq(memDTO.getSeq());
       	noticeDTO.setPeed_seq(peed_seq);
       	
       	String peed_image = peedList.get(peed_index).getImage();
       	noticeDTO.setPeed_image(peed_image);
       	System.out.println(peed_image);
       	
			if(loginDTO.getProfile_image() != null){
				System.out.println("who_profile 있다~~~");
				noticeDTO.setWho_profile(loginDTO.getProfile_image());
				System.out.println(noticeDTO);
				boolean isB = noticeService.IntNotice1(noticeDTO);
			}else{
				System.out.println("who_profile 없다~~~");
				System.out.println(noticeDTO);
				boolean isB = noticeService.IntNotice0(noticeDTO);
			}
		
		
		return p_countThumbsUp;

	}
	
	@RequestMapping(value="minusPeedCnt.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int minusPeedCnt(HttpServletRequest request, Model model, int peed_index, int member_seq) throws Exception{
		logger.info("minusPeedCnt " + new Date());
		
		List<PeedDTO> peedList = (List<PeedDTO>) request.getSession().getAttribute("peedList");
		
		// jsp에서 vs.count을 받아와서 peed_seq로 하면 안되나?
		int peed_seq = peedList.get(peed_index).getSeq();
		
		ThumbsUpDTO thumbsUpDTO = new ThumbsUpDTO();
		thumbsUpDTO.setMember_seq(member_seq);
		thumbsUpDTO.setPeed_seq(peed_seq);
		
		System.out.println(thumbsUpDTO.toString()+"ㅠㅠ");
		
		peedService.deleteThumbsUp(thumbsUpDTO);
		
		PeedDTO peedDTO = new PeedDTO();
		peedDTO.setSeq(thumbsUpDTO.getPeed_seq());
		
		peedService.minusLikeCnt(peedDTO);
		System.out.println("좋아요 -1");
		/*thumbsUpDTO.setLike_state(0);*/
		
		System.out.println(thumbsUpDTO.toString()+"좋아요 취소");
		
		/*request.getSession().setAttribute("thumbsUpDTO", thumbsUpDTO);
		request.getSession().setAttribute("peedDTO", peedDTO);
		*/
		
		peedService.changeLikeState(thumbsUpDTO);
		
		int like_state = peedService.searchThumbsUp(thumbsUpDTO);
		
		System.out.println(like_state+"좋아요 취소 라이크 스테이트");
		
		request.getSession().setAttribute("like_state", like_state);
		
		int m_countThumbsUp = peedService.countThumbsUp(peedDTO);
		System.out.println(m_countThumbsUp+"좋아요 몇개---");
		/*model.addAttribute("m_countThumbsUp", m_countThumbsUp);*/
		
		System.out.println("m_countThumbsUp : " + m_countThumbsUp);
		
		return m_countThumbsUp;

	}

	@RequestMapping(value="insertreply.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String insertreply(HttpServletRequest request, Model model, PeedReplyDTO replyDTO) throws Exception{
		logger.info("insertreply " + new Date());
		
		String content = request.getParameter("content");
		String s_peed_seq = request.getParameter("val");
		int peed_seq = Integer.parseInt(s_peed_seq);
		System.out.println("content:"+content+"peed_seq:"+peed_seq);
		
		String member_id = ((MemberDTO)request.getSession().getAttribute("login")).getId();
		int member_seq = ((MemberDTO)request.getSession().getAttribute("login")).getSeq();
		
		replyDTO.setPeed_seq(peed_seq);
		replyDTO.setMember_seq(member_seq);
		replyDTO.setMember_id(member_id);
		replyDTO.setContent(content);
		
		System.out.println(replyDTO.toString());
		
		// hash, a 링크걸고 hash 추가 시키기
		String linkedContent = "";
		int start_pos = -1;
		int hash_pos = -1;
		int at_pos = -1;		
		int next_hash_pos = -1;	// 뒤에 바로 #이 붙는 경우
		int next_at_pos = -1;
		int end_enter_pos = -1;
		int end_space_pos = -1;
		int end_pos = -1;
		String keyword = "";
		
		while(true){
			int data[] = new int[]{Integer.MAX_VALUE, Integer.MAX_VALUE, Integer.MAX_VALUE, Integer.MAX_VALUE};
			
			data[0] = content.indexOf('#')<0?Integer.MAX_VALUE:content.indexOf('#');
			data[1] = content.indexOf('@')<0?Integer.MAX_VALUE:content.indexOf('@');
			
			start_pos = min(data);
			
			if(start_pos==Integer.MAX_VALUE){
				linkedContent += content;
				break;
			}else{
				data[0] = content.indexOf('#', start_pos+1)<0?Integer.MAX_VALUE:content.indexOf('#', start_pos+1);
				data[1] = content.indexOf('@', start_pos+1)<0?Integer.MAX_VALUE:content.indexOf('@', start_pos+1);
				data[2] = content.indexOf('\n', start_pos+1)<0?Integer.MAX_VALUE:content.indexOf('\n', start_pos+1);
				data[3] = content.indexOf(' ', start_pos+1)<0?Integer.MAX_VALUE:content.indexOf(' ', start_pos+1);
				
				end_pos = min(data);
				
				end_pos = end_pos==Integer.MAX_VALUE?content.length():end_pos;
				
				if(start_pos == content.indexOf('#')){	// 해시면 해시 추가
					keyword = content.substring(start_pos + 1, end_pos);
					System.out.println("insert 전 keyword : " + keyword);			
					hashService.insertHash(-1, keyword.trim());
					linkedContent += content.substring(0, start_pos);
					linkedContent += "<a href='./hash.do?keyword="+keyword+"'>#" + keyword + "</a>";
				}else if(start_pos == content.indexOf('@')){
					keyword = content.substring(start_pos + 1, end_pos);
					linkedContent += content.substring(0, start_pos);
					linkedContent += "<a href='./profile.do?id="+keyword+"'>@" + keyword + "</a>";
				}
				
				System.out.println("end_pos : " + end_pos);
				
				content = content.substring(end_pos);
				
			}		
			
		}
		
		replyDTO.setContent(linkedContent);
		
		peedService.insertreply(replyDTO);
		
		return linkedContent;
	}
	
	@RequestMapping(value="detailReply.do",produces="application/text;charset=utf8",method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String detailReply(Model model, PeedReplyDTO peedReplyDTO,  NoticeDTO noticeDTO, HttpServletRequest request, String peed_image) throws Exception{
		logger.info("detailReply " + new Date());

		
		
		// hash, a 링크걸고 hash 추가 시키기
		String content = peedReplyDTO.getContent();
		String linkedContent = "";
		int start_pos = -1;
		int hash_pos = -1;
		int at_pos = -1;		
		int next_hash_pos = -1;	// 뒤에 바로 #이 붙는 경우
		int next_at_pos = -1;
		int end_enter_pos = -1;
		int end_space_pos = -1;
		int end_pos = -1;
		String keyword = "";
		
		while(true){
			int data[] = new int[]{Integer.MAX_VALUE, Integer.MAX_VALUE, Integer.MAX_VALUE, Integer.MAX_VALUE};
			
			data[0] = content.indexOf('#')<0?Integer.MAX_VALUE:content.indexOf('#');
			data[1] = content.indexOf('@')<0?Integer.MAX_VALUE:content.indexOf('@');
			
			start_pos = min(data);
			
			if(start_pos==Integer.MAX_VALUE){
				linkedContent += content;
				break;
			}else{
				data[0] = content.indexOf('#', start_pos+1)<0?Integer.MAX_VALUE:content.indexOf('#', start_pos+1);
				data[1] = content.indexOf('@', start_pos+1)<0?Integer.MAX_VALUE:content.indexOf('@', start_pos+1);
				data[2] = content.indexOf('\n', start_pos+1)<0?Integer.MAX_VALUE:content.indexOf('\n', start_pos+1);
				data[3] = content.indexOf(' ', start_pos+1)<0?Integer.MAX_VALUE:content.indexOf(' ', start_pos+1);
				
				end_pos = min(data);
				
				end_pos = end_pos==Integer.MAX_VALUE?content.length():end_pos;
				
				if(start_pos == content.indexOf('#')){	// 해시면 해시 추가
					keyword = content.substring(start_pos + 1, end_pos);
					System.out.println("insert 전 keyword : " + keyword);			
					hashService.insertHash(-1, keyword.trim());
					linkedContent += content.substring(0, start_pos);
					linkedContent += "<a href='./hash.do?keyword="+keyword+"'>#" + keyword + "</a>";
				}else if(start_pos == content.indexOf('@')){
					keyword = content.substring(start_pos + 1, end_pos);
					linkedContent += content.substring(0, start_pos);
					linkedContent += "<a href='./profile.do?id="+keyword+"'>@" + keyword + "</a>";
				}
				
				System.out.println("end_pos : " + end_pos);
				
				content = content.substring(end_pos);
				
			}		
			
		}
		
		//알림
		MemberDTO loginDTO = (MemberDTO)request.getSession().getAttribute("login");
		noticeDTO.setWho_id(loginDTO.getId());    
		noticeDTO.setWho_seq(loginDTO.getSeq());
		
		MemberDTO memDTO = (MemberDTO)request.getSession().getAttribute("mem");
       	noticeDTO.setMember_seq(memDTO.getSeq());
       
        int peed_seq = peedReplyDTO.getPeed_seq();
       	noticeDTO.setPeed_seq(peed_seq);

       	System.out.println("피드 이미지 = "+peed_image);
       	noticeDTO.setPeed_image(peed_image);
		     		
			if(loginDTO.getProfile_image() != null){
				System.out.println("who_profile 있다~~~");
				noticeDTO.setWho_profile(loginDTO.getProfile_image());
				System.out.println(noticeDTO);
				boolean isB = noticeService.IntNotice5(noticeDTO);
			}else{
				System.out.println("who_profile 없다~~~");
				System.out.println(noticeDTO);
				boolean isB = noticeService.IntNotice4(noticeDTO);
			}
		
		peedReplyDTO.setContent(linkedContent);
		
		
		// 댓글 DB 삽입
		peedService.insertreply(peedReplyDTO);		
		
		return linkedContent;
	}
	

	@RequestMapping(value="fplusPeedCnt.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int fplusPeedCnt(HttpServletRequest request, Model model, int peed_seq, int member_seq, String id, String profile_image, String peed_image, int writer_seq
) throws Exception{
		logger.info("fplusPeedCnt " + new Date());
		
		/*List<PeedDTO> peedList = (List<PeedDTO>) request.getSession().getAttribute("peedList");
		int f_peed_seq = peedList.get(peed_seq).getSeq();*/
		
		ThumbsUpDTO thumbsUpDTO = new ThumbsUpDTO();
		
		thumbsUpDTO.setMember_seq(member_seq);
		thumbsUpDTO.setPeed_seq(peed_seq);
		
		System.out.println(thumbsUpDTO.toString()+"굿굿");
		
		peedService.insertThumbsUp(thumbsUpDTO);
		
		PeedDTO peedDTO = new PeedDTO();
		peedDTO.setSeq(thumbsUpDTO.getPeed_seq());
		
		peedService.plusLikeCnt(peedDTO);
		System.out.println("좋아요 +1");
		
		thumbsUpDTO.setLike_state(1);
		
		System.out.println(thumbsUpDTO.toString()+"좋아요 누르기");
		
	    request.getSession().setAttribute("thumbsUpDTO", thumbsUpDTO);
		request.getSession().setAttribute("peedDTO", peedDTO);
		
		
		int like_state = peedService.searchThumbsUp(thumbsUpDTO);		
		
		System.out.println(like_state+"좋아요 하고 라이크 스테이트");
		
		request.getSession().setAttribute("like_state", like_state);
		
		int p_countThumbsUp = peedService.countThumbsUp(peedDTO);
		System.out.println(p_countThumbsUp+"좋아요 몇개++++");
		
		System.out.println("p_countThumbsUp : " + p_countThumbsUp);
		
		//확인
		System.out.println("int peed_seq : " + peed_seq);
		System.out.println(" int member_seq : " + member_seq);
		System.out.println("String id : " + id);
		System.out.println("profile_image,  : " + profile_image );
		System.out.println("피드이미지,  : " + peed_image );
		System.out.println("writer_seq,  : " + writer_seq);
		System.out.println("~~~~~");

        NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setMember_seq(writer_seq);
		noticeDTO.setWho_seq(member_seq);
		noticeDTO.setWho_id(id);   
		noticeDTO.setPeed_seq(peed_seq);
		noticeDTO.setPeed_image(peed_image);
		
	
			if(profile_image != null){
				System.out.println("who_profile 있다~~~" + profile_image);
				noticeDTO.setWho_profile(profile_image);
				boolean isB = noticeService.IntNotice1(noticeDTO);

			}else{
				System.out.println("who_profile 없다~~~");
			    System.out.println(noticeDTO);
				boolean isB = noticeService.IntNotice0(noticeDTO);
			}

		return p_countThumbsUp;

	}
	
	@RequestMapping(value="fminusPeedCnt.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int fminusPeedCnt(HttpServletRequest request, Model model, int peed_seq, int member_seq) throws Exception{
		logger.info("minusPeedCnt " + new Date());
		
		/*List<PeedDTO> peedList = (List<PeedDTO>) request.getSession().getAttribute("peedList");*/
		
		// jsp에서 vs.count을 받아와서 peed_seq로 하면 안되나?
		/*int f_peed_seq = peedList.get(peed_seq).getSeq();*/
		
		ThumbsUpDTO thumbsUpDTO = new ThumbsUpDTO();
		thumbsUpDTO.setMember_seq(member_seq);
		thumbsUpDTO.setPeed_seq(peed_seq);
		
		System.out.println(thumbsUpDTO.toString()+"ㅠㅠ");
		
		peedService.deleteThumbsUp(thumbsUpDTO);
		
		PeedDTO peedDTO = new PeedDTO();
		peedDTO.setSeq(thumbsUpDTO.getPeed_seq());
		
		peedService.minusLikeCnt(peedDTO);
		System.out.println("좋아요 -1");
		thumbsUpDTO.setLike_state(0);
		
		System.out.println(thumbsUpDTO.toString()+"좋아요 취소");
		
		request.getSession().setAttribute("thumbsUpDTO", thumbsUpDTO);
		request.getSession().setAttribute("peedDTO", peedDTO);
		
		
		peedService.changeLikeState(thumbsUpDTO);
		
		int like_state = peedService.searchThumbsUp(thumbsUpDTO);
		
		System.out.println(like_state+"좋아요 취소 라이크 스테이트");
		
		request.getSession().setAttribute("like_state", like_state);
		
		int m_countThumbsUp = peedService.countThumbsUp(peedDTO);
		System.out.println(m_countThumbsUp+"좋아요 몇개---");
		model.addAttribute("m_countThumbsUp", m_countThumbsUp);
		
		System.out.println("m_countThumbsUp : " + m_countThumbsUp);
		
		return m_countThumbsUp;
	}

	
	@RequestMapping(value="detailReply2.do",method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public PeedReplyDTO detailReply2(Model model, PeedDTO peedDTO) throws Exception{
		
		logger.info(peedDTO.toString()+"블라블라11111111");
		
		logger.info("detailReply2 " + new Date());
		
		PeedReplyDTO peedReplyDTO = new PeedReplyDTO();
		peedReplyDTO = peedService.getReplyDTO(peedDTO);
		
		logger.info(peedReplyDTO.toString()+"블라블라22222222");
		
		return peedReplyDTO;
	}
	
	@RequestMapping(value="delReply.do",method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int delReply(Model model, PeedReplyDTO peedReplyDTO) throws Exception{
		
		logger.info("delReply " + new Date());
		logger.info(peedReplyDTO.toString()+"삭제할 댓글 정보");
		
		int reply_seq = peedReplyDTO.getSeq();
		peedService.delReply(peedReplyDTO);
		
		return reply_seq;
		

	}
}
