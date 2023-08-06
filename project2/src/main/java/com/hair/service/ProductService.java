package com.hair.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hair.dao.ProductDAO;
import com.hair.vo.ProductVO;

@Service
public class ProductService {
	@Inject
	public ProductDAO productDAO;

	public List<ProductVO> productList(ProductVO send) {
		return productDAO.productList(send);
	}

	public void productInsert(Map<String, Object> map) {
		productDAO.productInsert(map);

	}

	public ProductVO productView(int pno) {
		return productDAO.productView(pno);
	}

	public int totalCount() {
		// TODO Auto-generated method stub
		return productDAO.totalCount();
	}

	public void productUpdate(ProductVO vo) {
		productDAO.productUpdate(vo);
	}

	public int productDelete(ProductVO vo) {

		return productDAO.productDelete(vo);
	}

	public void like(ProductVO vo) {
		productDAO.like(vo);

	}

	public int productReDelete(ProductVO vo) {
		return productDAO.productReDelete(vo);
	}

	public int productDeleteI(ProductVO vo) {
		return productDAO.productDeleteI(vo);
	}

}
