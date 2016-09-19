package sist.co.dao;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.HashDTO;
import sist.co.model.MemberDTO;
import sist.co.model.SearchDTO;

@Repository
public class SearchDAOImpl implements SearchDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "Search.";

	@Override
	public List<SearchDTO> searchHash(String keyword) throws Exception {
		// TODO Auto-generated method stub
		List<HashDTO> hashList = new ArrayList<HashDTO>();
		hashList = sqlSession.selectList(ns+"searchHash", keyword);
		
		DecimalFormat df = new DecimalFormat("#,###");
		
		List<SearchDTO> searchList = new ArrayList<SearchDTO>();
		
		for(int i = 0; i < hashList.size(); i++){			
			int hash_seq = hashList.get(i).getSeq();
			int count = sqlSession.selectOne(ns+"getPeedCount", hash_seq);
			
			String top = hashList.get(i).getHash();
			String bottom = "게시물 " + df.format(count) +"개";
			
			SearchDTO searchDTO = new SearchDTO(0, null, top, bottom);
			searchList.add(searchDTO);
		}
		
		return searchList;
	}

	@Override
	public List<SearchDTO> searchMember(String keyword) throws Exception {
		// TODO Auto-generated method stub
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		memberList = sqlSession.selectList(ns+"searchMember", keyword);		
		
		List<SearchDTO> searchList = new ArrayList<SearchDTO>();
		
		for(int i = 0; i < memberList.size(); i++){
			String image = memberList.get(i).getProfile_image();
			String top = memberList.get(i).getId();
			String bottom = memberList.get(i).getName();
			
			SearchDTO searchDTO = new SearchDTO(1, image, top, bottom);
			searchList.add(searchDTO);
		}
		
		return searchList;
	}

}
