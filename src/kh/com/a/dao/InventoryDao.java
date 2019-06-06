package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.BbsParam;
import kh.com.a.model.InventoryDto;
import kh.com.a.model.MemoDto;

public interface InventoryDao {

	public List<InventoryDto> getInventoryList();
	public List<InventoryDto> getInventoryPagingList(BbsParam param);
	public int getInventoryCount(BbsParam param);
	
	public boolean inventoryWrite(InventoryDto inven);
	public InventoryDto inventoryDetail(InventoryDto inven);
	public String inventoryCheck(String model_id);
	public boolean inventoryUpdate(InventoryDto inven);
	public boolean inventoryDelete(InventoryDto inven);
	public InventoryDto getInventory(int inven_seq);
	
	public List<MemoDto> getMemoList(InventoryDto inven);
	public boolean memoWrite(MemoDto memo);
	public boolean memoDelete(MemoDto memo);
	public boolean memoUpdate(MemoDto memo);

}
