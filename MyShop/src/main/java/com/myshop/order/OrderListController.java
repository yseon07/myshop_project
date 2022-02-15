package com.myshop.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myshop.member.Member;
import com.myshop.member.MemberService;
import com.myshop.product.ProductService;

@Controller
public class OrderListController {
	@Autowired
	private OrderListService service;
	@Autowired
	private MemberService mService;
	@Autowired
	private ProductService pService;

	@RequestMapping("/order")
	public String order(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		Member m = mService.getMemById((String)session.getAttribute("id")); 
		ArrayList<OrderList> list = (ArrayList<OrderList>)session.getAttribute("bList");
		for (int i = 0; i < list.size(); i++) {
			OrderList o = list.get(i);
			o.setMem_code(m.getMember_zipcode());
			o.setSend_address(m.getMember_address1() + " " + m.getMember_address2());
			o.setMem_point(o.getPrice() * 2 / 100);
			o.setSend_memo("blank");
			service.addOrderList(o);
			o.getProduct().setProduct_quantity(o.getProduct().getProduct_quantity() - o.getQuantity());
			pService.editProduct(o.getProduct());
		}
		session.removeAttribute("bList");
		return "/order/orderSuccess";
	}
	
	@RequestMapping("/order/count")
	public void QuantityCount(HttpServletRequest request, int index, int quantity, int price) {
		HttpSession session = request.getSession(false);
		ArrayList<OrderList> list = (ArrayList<OrderList>)session.getAttribute("bList");
		list.get(index).setPrice(price);
		list.get(index).setQuantity(quantity);	
	}
}