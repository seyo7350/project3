package sist.co.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sist.co.model.SearchDTO;
import sist.co.service.SearchService;

@Controller
public class SearchController {
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Autowired
	private SearchService searchService;
	
	@RequestMapping(value="search.do",method={RequestMethod.GET, RequestMethod.POST})
	public String search(String keyword, Model model){
		List<SearchDTO> searchList = new ArrayList<SearchDTO>();
		List<SearchDTO> hashList = new ArrayList<SearchDTO>();
		List<SearchDTO> memberList = new ArrayList<SearchDTO>();
		try {
			if(keyword.substring(0, 1).equals("#")){	// 해시태그 검색	
				hashList = searchService.searchHash(keyword.substring(1));
			}else if(keyword.substring(0, 1).equals("@")){	// 사람 검색
				memberList = searchService.searchMember(keyword.substring(1));
			}else{	// 다 검색
				hashList = searchService.searchHash(keyword);
				memberList = searchService.searchMember(keyword);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		searchList.addAll(hashList);
		searchList.addAll(memberList);
		
		model.addAttribute("searchList", searchList);
		
		return "search.tiles";
	}

}
