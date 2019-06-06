package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.CartDto;
import kh.com.a.model.Order_Dto;
import kh.com.a.model.Order_Sub_Dto;
import kh.com.a.model.ProductDto;

public interface OrderDao {
	
	// 하나만 주문
	public List<CartDto> oneOrderlist(int seq);
	
	// p리스트
	public List<ProductDto> orderpList();
	
	// 선택 주문
	int twoOrderlist(int seqq)throws Exception;
	public CartDto getOrder(int seq); 
	
	// 주문정보
	public void order(Order_Dto dto)throws Exception;

	// 주문상세
	public void orderdetail(Order_Sub_Dto sdto)throws Exception;
  

	// 카트비우기
	public void cartdelete(int sseq)throws Exception;
	// 인벤토리 재고 내려주기
	public boolean minusCountInven(Order_Sub_Dto sdto);
	
	// 결제정보
	// public List<Order_Dto> paymentlist(String id) throws Exception;
	public List<Order_Dto> paymentlistto(String order_num) throws Exception;


	// 결제완료 : deli_info -> 1 변경
	public boolean dellinfo(int ord_seq);
	

}
