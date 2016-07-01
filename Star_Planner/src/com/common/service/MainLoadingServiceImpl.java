package com.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.dao.MainLoadingDaoImpl;
import com.common.vo.LinkList;

@Service("mainLoadingService")
public class MainLoadingServiceImpl {

	@Autowired
	private MainLoadingDaoImpl mainLinkDao;
	
	public List<LinkList> getMainLink(){
		return mainLinkDao.selectMainLink();
	}
}
