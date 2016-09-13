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
<<<<<<< HEAD
import sist.co.model.PagingParam;
=======
import sist.co.model.MemberDTO;
>>>>>>> 4ffb023d05c00c6cb058ebe872e73204a9b460ce
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
	
<<<<<<< HEAD
=======
<<<<<<< HEAD
	@RequestMapping(value="detail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String detail(HttpServletRequest request, Model model, MemberDTO memberDTO, int peed_index) throws Exception{
		logger.info("detail " + new Date());
		System.out.println(peed_index+"!@#!@#!@");
		// 내 아이디에 해당하는 peed를 가져와야지
		
		/*request.getSession().setAttribute("peed_index", peed_index);*/
		model.addAttribute("peed_index", peed_index);
		
		return "modal5.tiles";
=======
	@RequestMapping(value="search.do",method={RequestMethod.GET, RequestMethod.POST})
	public String search(Model model){		
		
		return "search.tiles";
>>>>>>> e4a7483d9a4c32aec3f5a38b1d3356e30b2abf46
	}
>>>>>>> 50added86f7f94cedc9741a8da696c4e9f9169cb
}
