package com.ibm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ibm.domain.DivisionDomain;
import com.ibm.domain.ProjectDomain;

@Mapper
public interface ProjectMapper {

	@Select("SELECT a.projectid projectid, projectnm FROM MBR_PRJ_DIV A JOIN PROJECT B ON A.PROJECTID = B.PROJECTID WHERE memberID = #{memberid} AND roleid = 'ADMIN'")
	public List<ProjectDomain> selectProjectByAdmin(@Param("memberid") String memberid);
	
	@Select("SELECT * FROM PROJECT")
	public List<ProjectDomain> selectProjectList();
	
	@Select("SELECT * FROM DIVISION where projectID = #{id}")
	public List<DivisionDomain> selectDivisionList(String id);
}