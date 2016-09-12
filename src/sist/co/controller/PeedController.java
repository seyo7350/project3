package sist.co.controller;

import java.io.File;
import java.io.IOException;
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
import sist.co.model.PeedDTO;
import sist.co.service.PeedService;

@Controller
public class PeedController {
	private static final Logger logger = LoggerFactory.getLogger(PeedController.class);
	
	@Autowired
	private PeedService peedService;
	
	@RequestMapping(value="article.do",method={RequestMethod.GET, RequestMethod.POST})
	public String newspeedsarticle(Model model){
		logger.info("newspeedarticle " + new Date());
		
		return "article.tiles";
	}
	
	@RequestMapping(value="write.do",method={RequestMethod.GET, RequestMethod.POST})
	public String write(Model model){
		return "write.tiles";
	}
	
	@RequestMapping(value="writeAf.do", method=RequestMethod.POST)
	public String write(@RequestParam(value="fileload", required=false)MultipartFile fileload, Model model, PeedDTO peed, HttpServletRequest request){
		model.addAttribute("doc_title", "PDS 업로드");
		
		System.out.println(fileload.getOriginalFilename());
		
		/*peed.setImage(fileload.getOriginalFilename());*/
		
		System.out.println(peed.toString());
		
		return "redirect:/write.do";
		
		/*String fupload = "c:\\upload";*/
		/*String fupload = request.getServletContext().getRealPath("/upload");
		logger.info(": " + fupload);
		
		String f = pds.getFileName();
		String newFile = FUpUtil.getNewFile(f);
		logger.info(fupload + "/" + newFile);
		
		pds.setFileName(newFile);
		
		try {
			File file = new File(fupload + "/" + newFile);
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			System.out.println(pds.toString());
			
			sistPdsService.uploadPds(pds);
			logger.info("pdsupload success");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			logger.info("pdsupload fail");
		}
		
		return "redirect:/pdslist.do";*/
	}
}
