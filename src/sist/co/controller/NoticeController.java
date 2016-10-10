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

import sist.co.model.NoticeDTO;
import sist.co.service.NoticeService;

@Controller
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
    
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value="getNoticeList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getNoticeList(Model model, int member_seq) throws Exception{
		logger.info("getNoticeList " + new Date());
		
		System.out.println("member_seq:"+ member_seq);
		
		List<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
		noticeList = noticeService.getNoticeList(member_seq);
		
		System.out.println("알림 DB size : " + noticeList.size());
		System.out.println("알림 DB 불러오기:"+ noticeList.toString());
		
		model.addAttribute("noticeList", noticeList);
		
		noticeService.updateNoticeList(member_seq);
		
		return "notice.tiles";
	}
	
	

}