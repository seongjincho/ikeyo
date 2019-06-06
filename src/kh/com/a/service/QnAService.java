package kh.com.a.service;

import java.util.List;

import kh.com.a.model.BbsParam;
import kh.com.a.model.QnADto;

public interface QnAService {
	
	public boolean qnaWrite(QnADto dto);
	
	public List<QnADto> qnaList(int parent);
	public List<QnADto> qnaListAll();
	
	public boolean qnaAnswer(QnADto dto);
	
	public List<QnADto> getQnAPagingList(BbsParam param);
	public int getQnACount(BbsParam param);
	
	public String getModel_id(int parent);

}
