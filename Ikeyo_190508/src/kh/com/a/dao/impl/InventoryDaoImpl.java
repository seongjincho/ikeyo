package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.InventoryDao;
import kh.com.a.model.BbsParam;
import kh.com.a.model.InventoryDto;
import kh.com.a.model.MemoDto;

@Repository
public class InventoryDaoImpl implements InventoryDao {


	@Autowired
	SqlSession sqlSession;
	
	String ns = "Inventory.";

	@Override
	public List<InventoryDto> getInventoryList() {
		
		return sqlSession.selectList(ns + "getInventoryList");
	}

	@Override
	public boolean inventoryWrite(InventoryDto inven) {
		
		int n = sqlSession.insert(ns + "inventoryWrite" , inven);
		
		return n>0?true:false;
	}

	@Override
	public InventoryDto inventoryDetail(InventoryDto inven) {
		
		return sqlSession.selectOne(ns + "inventoryDetail" , inven);
	}

	@Override
	public String inventoryCheck(String model_id) {
		
		return sqlSession.selectOne(ns + "inventoryCheck", model_id);
	}

	@Override
	public boolean inventoryUpdate(InventoryDto inven) {
		int n = sqlSession.update(ns + "inventoryUpdate", inven);
		return n>0?true:false;
	}

	@Override
	public boolean inventoryDelete(InventoryDto inven) {
		int n = sqlSession.update(ns + "inventoryDelete", inven);
		return n>0?true:false;
	}

	@Override
	public List<InventoryDto> getInventoryPagingList(BbsParam param) {
		
		return sqlSession.selectList(ns + "getInventoryPagingList", param);
	}

	@Override
	public int getInventoryCount(BbsParam param) {
		
		return sqlSession.selectOne(ns + "getInventoryCount", param);
	}
	
	@Override
	public InventoryDto getInventory(int inven_seq) {
		return sqlSession.selectOne(ns + "getinventory", inven_seq);
	}

	@Override
	public List<MemoDto> getMemoList(InventoryDto inven) {
		
		return sqlSession.selectList(ns + "getMemoList", inven);
	}

	@Override
	public boolean memoWrite(MemoDto memo) {
		
		int n = sqlSession.insert(ns + "memoWrite", memo);
		
		return n>0?true:false;
	}

	@Override
	public boolean memoDelete(MemoDto memo) {
		
		int n = sqlSession.update(ns + "memoDelete", memo);
		System.out.println("n:" + n);
		return n>0?true:false;
	}

	@Override
	public boolean memoUpdate(MemoDto memo) {
		
		int n = sqlSession.update(ns + "memoUpdate", memo);
		
		return n>0?true:false;
	}
	
	
	
	
	
}
