package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.ProductDao;
import kh.com.a.model.CartDto;
import kh.com.a.model.InventoryDto;
import kh.com.a.model.PagingParam;
import kh.com.a.model.ProductDto;
import kh.com.a.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDao productDao;

	@Override
	public List<ProductDto> getProductPagingList(PagingParam param) {
		
		return productDao.getProductPagingList(param);
	}

	@Override
	public int getProductCount(PagingParam param) {
		
		return productDao.getProductCount(param);
	}

	@Override
	public List<ProductDto> getProductList(String category) {
		
		return productDao.getProductList(category);
	}

	@Override
	public List<CartDto> getCartList(PagingParam param) {
	
		return productDao.getCartList(param);
	}

	@Override
	public int checkWish(CartDto cart) {
	
		return productDao.checkWish(cart);
	}

	@Override
	public String updateWish(CartDto cart) throws Exception {
		
		return productDao.updateWish(cart);
	}

	@Override
	public String deleteWish(CartDto cart) throws Exception {
		
		return productDao.deleteWish(cart);
	}

	@Override
	public void updateCount(String model_id) throws Exception {
		productDao.updateCount(model_id);
	}

	@Override
	public void deleteCount(String model_id) throws Exception {
		productDao.deleteCount(model_id);
	}

	@Override
	public int selectCount(String model_id) {
		
		return productDao.selectCount(model_id);
	}
	
	@Override
	public boolean productAdd(ProductDto productDto) {		
		return productDao.productAdd(productDto);
	}

	@Override
	public ProductDto getProduct(String model_id) {
		return productDao.getProduct(model_id);
	}

	@Override
	public InventoryDto getinven(String model_id) {
		return productDao.getinven(model_id);
	}

	@Override
	public boolean cartInput(CartDto dto) {
		return productDao.cartInput(dto);
	}

	@Override
	public List<CartDto> p_datailCart(String model_id) {
		return productDao.p_datailCart(model_id);
	}

	@Override
	public boolean ordercartInput(CartDto dto) {
		return productDao.ordercartInput(dto);
	}

	@Override
	public boolean ordercartDel(String id) {
		return productDao.ordercartDel(id);
		
	}

	@Override
	public List<CartDto> ordercartSel(String id) {
		return productDao.ordercartSel(id);
	}

	@Override
	public boolean productupdate(ProductDto dto) {
		return productDao.productupdate(dto);
	}
	
	@Override
	public boolean productsearch(String model_id) {
		return productDao.productsearch(model_id);
	}
	
	
	
	
	
}
