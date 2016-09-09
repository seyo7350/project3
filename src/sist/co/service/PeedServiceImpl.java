package sist.co.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.dao.PeedDAO;

@Service
public class PeedServiceImpl implements PeedService {
	
	@Autowired 
	private PeedDAO peedDAO;
}
