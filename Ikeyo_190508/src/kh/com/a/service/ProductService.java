package kh.com.a.service;

import java.util.List;

import kh.com.a.model.CartDto;
import kh.com.a.model.InventoryDto;
import kh.com.a.model.PagingParam;
import kh.com.a.model.ProductDto;

public interface ProductService {
	public List<ProductDto> getProductList(String category);
	public List<ProductDto> getProductPagingList(PagingParam param);
	public int getProductCount(PagingParam param);
	/*public List<CartDto> getCartList(String category);*/
	public List<CartDto> getCartList(PagingParam param);
	public int checkWish(CartDto cart);
	public String updateWish(CartDto cart) throws Exception;
	public String deleteWish(CartDto cart) throws Exception;
	public void updateCount(String model_id) throws Exception;
	public void deleteCount(String model_id) throws Exception;
	public int selectCount(String model_id);
	public boolean productAdd(ProductDto productDto);
	
	public ProductDto getProduct(String model_id);
	public InventoryDto getinven(String model_id);
	
	public boolean cartInput(CartDto dto);	// 장바구니 등록
	public List<CartDto> p_datailCart(String model_id);
	public boolean ordercartInput(CartDto dto);	// 바로결제용 장바구니 등록
	public boolean ordercartDel(String id);		// 바로구매용 삭제
	public List<CartDto> ordercartSel(String id);	// 바로구매용 찾아오기
	
}
