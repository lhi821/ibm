package com.ibm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.domain.DivisionDomain;
import com.ibm.domain.ProjectDomain;
import com.ibm.mapper.ProjectMapper;
import com.ibm.service.ProjectService;

@Service
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	ProjectMapper projectMapper;
	
	@Override
	public List<ProjectDomain> selectProjectList() {
		return projectMapper.selectProjectList();
	}
	
	@Override
	public List<DivisionDomain> selectDivisionList(String id){
		return projectMapper.selectDivisionList(id);
	}
}
