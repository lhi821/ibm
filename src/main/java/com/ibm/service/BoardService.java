package com.ibm.service;

import java.util.List;

import com.ibm.domain.BoardDomain;

public interface BoardService {

	public BoardDomain selectBaord(int id);
	
	public void insertBoard(BoardDomain boardDomain);
	
	public void updateBoard(BoardDomain boardDomain);
	
	public void deleteBoard(int id);
	
	public List<BoardDomain> selectBoardList();
	
}
