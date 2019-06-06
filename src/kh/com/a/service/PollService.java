package kh.com.a.service;

import java.util.List;

import kh.com.a.model.PollBean;
import kh.com.a.model.PollDto;
import kh.com.a.model.PollSubDto;
import kh.com.a.model.Voter;

public interface PollService {

	

	public List<PollDto> getPollAllList(String id); 
	public int isVote(Voter voter);
	public void makePoll(PollBean pbean);
	public PollDto getPoll(PollDto poll);
	public List<PollSubDto> getPollSubList(PollDto poll);
	public void polling(Voter voter);  		
	
}
