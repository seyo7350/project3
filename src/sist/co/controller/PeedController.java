package sist.co.controller;

import java.io.File;
import java.util.Date;

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
	public String newspeedsarticle(PagingParam param, PeedDTO peed, Model model){
		logger.info("newspeedarticle " + new Date());
		
		// paging
		int sn = param.getPageNumber();
		int start = sn*param.getRecordCountPerPage() + 1;
		int end = (sn+1)*param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		
		System.out.println(param.toString());
		
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
	
	// 개인 피드
	@RequestMapping(value="detail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String detail(HttpServletRequest request, Model model, MemberDTO memberDTO, int peed_index) throws Exception{
		logger.info("detail " + new Date());
		System.out.println(peed_index+"!@#!@#!@");
		// 내 아이디에 해당하는 peed를 가져와야지
		
		// ajax로 보낸후 a태그 href에 넣어주자.
		
		/*model.addAttribute("peed_index", peed_index);*/
		request.getSession().setAttribute("peedIndex", peed_index);
		
		return "modal5.tiles";

	}
		
	
	
}
