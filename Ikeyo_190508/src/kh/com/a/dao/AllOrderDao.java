package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.BbsParam;
import kh.com.a.model.Order_Dto;
import kh.com.a.model.Order_Sub_Dto;

public interface AllOrderDao {

	
	public List<Order_Dto> allOrderList(BbsParam param);
	public int getAllOrderCount(BbsParam param);
	
	
	public Order_Dto getDetail(String order_num);
	public List<Order_Sub_Dto> getDetail_sub(String order_num);
	public boolean deliInfoUpdate(String ord_seq);
	
}
