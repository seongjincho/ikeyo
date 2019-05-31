package kh.com.a.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.PollDao;
import kh.com.a.model.PollBean;
import kh.com.a.model.PollDto;
import kh.com.a.model.PollSubDto;
import kh.com.a.model.Voter;
import kh.com.a.service.PollService;


@Service
public class PollServiceImpl implements PollService {

	@Autowired
	PollDao pollDao;
	
	
	@Override
	public List<PollDto> getPollAllList(String id) {
		
		List<PollDto> list = pollDao.getPollAllList();
		
		
		List<PollDto> plist = new ArrayList<PollDto>();
		
		for (PollDto poll : list) {  
				int pollid = poll.getPollid(); 
				                           
				int count = pollDao.isVote(new Voter(pollid, -1, id)); 
			    if(count == 1) { 
			    	
			    	poll.setVote(true);
			    	
			    }else {    
			    	
			    	poll.setVote(false);
			    	
		    }
			    
			  plist.add(poll);  
		}
		
		return plist;
	}
	
	

	@Override
	public int isVote(Voter voter) {
		
		return 0;
	}



	@Override
	public void makePoll(PollBean pbean) {
		
		
		
		PollDto poll = new PollDto( pbean.getId(), pbean.getQuestion(), 
									pbean.getSdate(), pbean.getEdate(), 
									pbean.getItemcount(), 0);
	    	
		pollDao.makePoll(poll);
		
		// 보기 항목들 산출
		int itemcount = pbean.getItemcount(); 
		String answer[] = pbean.getPollnum();
		
		for(int i = 0; i < itemcount; i++) {
			
			PollSubDto pollsub = new PollSubDto();
			pollsub.setAnswer(answer[i]);
			pollDao.makePollSub(pollsub);
		}
			
	}



	@Override
	public PollDto getPoll(PollDto poll) {
		return pollDao.getPoll(poll);
	}



	@Override
	public List<PollSubDto> getPollSubList(PollDto poll) {
		return pollDao.getPollSubList(poll);
	}



	
	
	@Override
	public void polling(Voter voter) {
		
		pollDao.pollingVoter(voter); // 투표자
		pollDao.pollingPoll(voter);  // 항목
		pollDao.pollingSub(voter);   // 항목안의 보기
		
	}
	
	
}
