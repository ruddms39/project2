package com.hair.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hair.vo.ProductVO;

@Repository
public class ProductDAO {
	@Inject
	SqlSession sqlSession;
	private String mapper = "product.";
	public List<ProductVO> productList(ProductVO send){
		return sqlSession.selectList(mapper+"plist", send);
	}
	public void productInsert(Map<String, Object> map) {
		sqlSession.insert(mapper+"insert", map);
		
	}
	public ProductVO productView(int pno) {
			return sqlSession.selectOne(mapper+"listOne", pno);
	}
	public int totalCount() {
		return sqlSession.selectOne(mapper+"totalCount");
	}
	public void productUpdate(ProductVO vo) {
		sqlSession.update(mapper+"update", vo);
	}
	public int productDelete(ProductVO vo) {
		return sqlSession.update(mapper+"delete", vo);
	}
	public void like(ProductVO vo) {
		sqlSession.update(mapper+"like", vo);
		
	}
	public int productReDelete(ProductVO vo) {
		return sqlSession.update(mapper+"redelete", vo);
	}
	public int productDeleteI(ProductVO vo) {
		return sqlSession.delete(mapper+"deleteI", vo);
	}
	
}
