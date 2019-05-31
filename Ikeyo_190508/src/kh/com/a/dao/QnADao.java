package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.BbsParam;
import kh.com.a.model.QnADto;

public interface QnADao {

	public boolean qnaWrite(QnADto dto);	// QNA 글쓰기
	public List<QnADto> qnaListAll();		// qna 전체리스트(관리자페이지용)
	
	public List<QnADto> qnaList(int parent);// qna 리스트(디테일부분)
	public boolean qnaAnswer(QnADto dto);	// QNA 답글
	
	public List<QnADto> getQnAPagingList(BbsParam param); // QNA 관리자 페이지 페이징처리 
	public int getQnACount(BbsParam param);
	
	public String getModel_id(int parent);
	
	
	
	
}
