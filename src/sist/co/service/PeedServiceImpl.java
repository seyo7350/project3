package sist.co.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.dao.PeedDAO;
import sist.co.model.PeedDTO;

@Service
public class PeedServiceImpl implements PeedService {
	
	@Autowired 
	private PeedDAO peedDAO;

	@Override
	public boolean writePeed(PeedDTO peedDTO) throws Exception {
		// TODO Auto-generated method stub
		peedDAO.writePeed(peedDTO);
		return true;
	}
	
}