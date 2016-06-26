package com.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.dao.MainLoadingDaoImpl;

@Service("mainLoadingService")
public class MainLoadingServiceImpl {

	@Autowired
	private MainLoadingDaoImpl mainLinkDao;
	
	public List<String> getMainLink(){
		return mainLinkDao.selectMainLink();
	}
}
