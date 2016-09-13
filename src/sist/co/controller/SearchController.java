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

import sist.co.model.HashDTO;
import sist.co.service.HashService;

@Controller
public class SearchController {
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Autowired
	private HashService hashService;
	
	@RequestMapping(value="search.do",method={RequestMethod.GET, RequestMethod.POST})
	public String search(String keyword, Model model){		
		
		if(keyword.substring(0, 1).equals("#")){	// 해시태그 검색
			List<HashDTO> hashList = new ArrayList<HashDTO>();
			/*hashList = hashService.searchHash(keyword.substring(1));*/
		}else if(keyword.substring(0, 1).equals("@")){	// 사람 검색
			
		}else{	// 다 검색
			
		}
		
		model.addAttribute("keyword", keyword);
		
		return "search.tiles";
	}

}
