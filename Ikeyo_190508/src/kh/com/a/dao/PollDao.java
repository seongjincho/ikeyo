package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.PollDto;
import kh.com.a.model.PollSubDto;
import kh.com.a.model.Voter;

public interface PollDao {

	public List<PollDto> getPollAllList();
	public int isVote(Voter voter); 
	public void makePoll(PollDto poll); 
	public void makePollSub(PollSubDto pollsub);
	public PollDto getPoll(PollDto poll); 
	public List<PollSubDto> getPollSubList(PollDto poll); 
	public void pollingVoter(Voter voter);  
	public void pollingPoll(Voter voter);   
	public void pollingSub(Voter voter);   
	
}
