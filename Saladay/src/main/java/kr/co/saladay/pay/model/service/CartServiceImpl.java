package kr.co.saladay.pay.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.saladay.pay.model.dao.CartDAO;
import kr.co.saladay.pay.model.vo.CartMenu;
import kr.co.saladay.pay.model.vo.Cart;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO dao;
	
	// 장바구니에 담은 패키지 조회(패키지에 담은 메뉴별 옵션 모두 포함)
	@Override
	public Cart selectCartPackage(int memberNo) {
		
		Cart cartPackage=dao.selectCartPackage(memberNo);
				
		return cartPackage;
	}
	
	// 장바구니 삭제
	@Transactional
	@Override
	public int deleteCart(int memberNo) {
		return dao.deleteCart(memberNo);
	}
	
	
	// 장바구니 담기
	@Override
	public int insertCart(Cart cart) {
		
		// 장바구니 번호 생성
		int cartNo = dao.insertCart(cart);
		
		// 장바구니에 내용 담기
		if(cartNo > 0) {
			System.out.println(cart);
		}
		
		return cartNo;
	}
}
