package com.ibm.service;

import java.util.List;

import com.ibm.domain.DivisionDomain;
import com.ibm.domain.ProjectDomain;

public interface ProjectService {
	public List<ProjectDomain> selectProjectList();
	public List<DivisionDomain> selectDivisionList(int id);
}
