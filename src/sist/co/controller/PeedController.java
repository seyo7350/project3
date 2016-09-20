package sist.co.controller;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;

import sist.co.help.FUpUtil;

import sist.co.model.PagingParam;

import sist.co.model.MemberDTO;

import sist.co.model.PeedDTO;
import sist.co.service.PeedService;

@Controller
public class PeedController {
	private static final Logger logger = LoggerFactory.getLogger(PeedController.class);
	
	@Autowired
	private PeedService peedService;
	
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
		
		return "redirect:/newspeed.do";
	}	
	

	@RequestMapping(value="detail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String detail(HttpServletRequest request, Model model, MemberDTO memberDTO, int peed_index) throws Exception{
		logger.info("detail " + new Date());
		System.out.println(peed_index+"!@#!@#!@");
		// 내 아이디에 해당하는 peed를 가져와야지
		
		/*request.getSession().setAttribute("peed_index", peed_index);*/
		model.addAttribute("peed_index", peed_index);
		
		return "modal5.tiles";

	/*@RequestMapping(value="search.do",method={RequestMethod.GET, RequestMethod.POST})
	public String search(Model model){		
		
		return "search.tiles";

	}*/
	}
}
