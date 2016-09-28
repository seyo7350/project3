package sist.co.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

import sist.co.help.FUpUtil;

import sist.co.model.PagingParam;

import sist.co.model.MemberDTO;

import sist.co.model.PeedDTO;
import sist.co.service.HashService;
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
		
		for(int i = 0; i<peedlist.size(); i++){
			List<PeedReplyDTO> replylist = peedService.getPeedReplylist(peedlist.get(i).getSeq());
			peedreplylist.add(replylist);
		}
		System.out.println("peedreplylist:"+peedreplylist.toString());
		
		model.addAttribute("peedreplylist", peedreplylist);
		model.addAttribute("peedlist", peedlist);
		model.addAttribute("totalPeedCount", totalPeedCount);
		
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
		
		/*String fupload = "c:\\upload";*/
		String fupload = request.getServletContext().getRealPath("/upload");
		logger.info(": " + fupload);
		
		String f = peedDTO.getImage();
		String newFile = FUpUtil.getNewFile(f);
		logger.info(fupload + "/" + newFile);
		
		peedDTO.setImage(newFile);
		
		try {
			File file = new File(fupload + "/" + newFile);
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			System.out.println(peedDTO.toString());
			
			peedService.writePeed(peedDTO);
			logger.info("writeAf success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.info("writeAf fail");
		}
		
		// hash 추가
		String content = peedDTO.getContent();
		int hash_pos = -1;
		int next_hash_pos = -1;	// 뒤에 바로 #이 붙는 경우
		int end_enter_pos = -1;
		int end_space_pos = -1;
		int end_pos = -1;
		String keyword = "";
		int peed_seq = hashService.getLastPeedSeq();
		
		while(true){			
			hash_pos = content.indexOf('#');
			if(hash_pos < 0){
				break;
			}
			next_hash_pos = content.indexOf('#', hash_pos+1);
			end_enter_pos = content.indexOf('\n', hash_pos);
			end_space_pos = content.indexOf(' ', hash_pos);
			
			if(next_hash_pos < 0){				// hash 없음
				if(end_enter_pos < 0){			// enter 없음
					end_pos = end_space_pos;	// ------------------------------------------------------ hash x, enter x, space ? == space
				}else if(end_space_pos < 0){	// space 없음
					end_pos = end_enter_pos;	// ------------------------------------------------------ hash x, enter ?, space x == enter
				}else{							// enter, space 있음
					end_pos = (end_enter_pos > end_space_pos) ? end_space_pos : end_enter_pos;	// ------ hash x, enter o, space o == enter, space 비교
				}
			}else{								// hash 있음
				if(end_enter_pos < 0){			// enter 없음
					if(end_space_pos < 0){		// space 없음
						end_pos = next_hash_pos;	// -------------------------------------------------- hash o, enter x, space x == hash
					}else{						// space 있음
						end_pos = (next_hash_pos > end_space_pos) ? end_space_pos : next_hash_pos;	// -- hash o, enter x, space o == hash, space 비교
					}					
				}else{							// enter 있음
					if(end_space_pos < 0){		// space 없음
						end_pos = (next_hash_pos > end_enter_pos) ? end_enter_pos : next_hash_pos;	// -- hash o, enter o, space x == hash, enter 비교
					}else{						// space 있음
						end_pos = (next_hash_pos > end_enter_pos) ? end_enter_pos : next_hash_pos;	// -- hash o, enter o, space o
						end_pos = (end_pos > end_space_pos) ? end_space_pos : end_pos;				// -- == hash, enter 비교 후 작은거 저장, 그걸 space랑 비교
					}
				}
			}
			
			end_pos = (end_pos == -1) ? content.length() : end_pos;	// 그래도 -1이면 셋 다 없는거
			
			System.out.println("content : " + content);
			System.out.println("hash_pos : " + hash_pos);
			System.out.println("end_pos : " + end_pos);
			
			keyword = content.substring(hash_pos + 1, end_pos);
			content = content.substring(end_pos);
			
			// hash 추가
			System.out.println("insert 전 keyword : " + keyword);			
			hashService.insertHash(peed_seq, keyword.trim());
		}
		return "redirect:/newspeed.do";
	}	
	
	// 개인 피드
	@RequestMapping(value="detail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String detail(HttpServletRequest request, Model model, int peed_index, PeedDTO peedDTO) throws Exception{
		logger.info("detail " + new Date());
		
		request.getSession().setAttribute("peed_index", peed_index);
		
		List<PeedDTO> peedList = (List<PeedDTO>)(request.getSession().getAttribute("peedList"));
		int peed_seq = peedList.get(peed_index).getSeq();
		
		ThumbsUpDTO thumbsUpDTO = new ThumbsUpDTO();
		thumbsUpDTO.setPeed_seq(peed_seq);
		thumbsUpDTO.setMember_seq(peedDTO.getMember_seq());
		
		System.out.println(thumbsUpDTO.toString()+"떰쩝");
		
		int like_state = peedService.searchThumbsUp(thumbsUpDTO);		
		
		request.getSession().setAttribute("like_state", like_state);
		
		return "modal5.tiles";

	}
	
	@RequestMapping(value="openModal5.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int openModal5(HttpServletRequest request, Model model, ThumbsUpDTO thumbsUpDTO) throws Exception{
		logger.info("openModal5 " + new Date());
		
		int like_state = peedService.searchThumbsUp(thumbsUpDTO);
		
		System.out.println("씨이발");
		
		return like_state;

	}
	
	
	@RequestMapping(value="plusPeedCnt.do", method={RequestMethod.GET, RequestMethod.POST})
	public String plusPeedCnt(HttpServletRequest request, Model model, ThumbsUpDTO thumbsUpDTO) throws Exception{
		logger.info("plusPeedCnt " + new Date());
		System.out.println(thumbsUpDTO.toString()+"굿굿");
		
		peedService.insertThumbsUp(thumbsUpDTO);
		
		PeedDTO peedDTO = new PeedDTO();
		peedDTO.setSeq(thumbsUpDTO.getPeed_seq());
		
		peedService.plusLikeCnt(peedDTO);
		
		thumbsUpDTO.setLike_state(1);
		
		System.out.println(thumbsUpDTO.toString()+"좋아요 누르기");
		
		request.getSession().setAttribute("thumbsUpDTO", thumbsUpDTO);
		request.getSession().setAttribute("peedDTO", peedDTO);
		
		/*model.addAttribute("thumbsUpDTO", thumbsUpDTO);
		model.addAttribute("peedDTO", peedDTO);*/
		
		return "modal5.tiles";

	}
	
	@RequestMapping(value="minusPeedCnt.do", method={RequestMethod.GET, RequestMethod.POST})
	public String minusPeedCnt(HttpServletRequest request, Model model, ThumbsUpDTO thumbsUpDTO) throws Exception{
		logger.info("minusPeedCnt " + new Date());
		System.out.println(thumbsUpDTO.toString()+"ㅠㅠ");
		
		peedService.deleteThumbsUp(thumbsUpDTO);
		
		PeedDTO peedDTO = new PeedDTO();
		peedDTO.setSeq(thumbsUpDTO.getPeed_seq());
		
		peedService.minusLikeCnt(peedDTO);
		
		thumbsUpDTO.setLike_state(0);
		
		System.out.println(thumbsUpDTO.toString()+"좋아요 취소");
		
		request.getSession().setAttribute("thumbsUpDTO", thumbsUpDTO);
		request.getSession().setAttribute("peedDTO", peedDTO);
		
		/*model.addAttribute("thumbsUpDTO", thumbsUpDTO);
		model.addAttribute("peedDTO", peedDTO);*/
		
		return "modal5.tiles";

	}


}
