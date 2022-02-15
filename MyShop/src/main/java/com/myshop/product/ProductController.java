package com.myshop.product;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myshop.like.Like;
import com.myshop.like.LikeService;
import com.myshop.order.OrderList;
import com.myshop.order.OrderListService;
import com.myshop.review.ReviewService;

@Controller
public class ProductController {
	@Autowired
	private ProductService service;
	@Autowired
	private ReviewService rService;
	@Autowired
	private LikeService lService;
	@Autowired
	private OrderListService oService;

	@GetMapping("/product")
	public ModelAndView allList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/product/productList");
		HttpSession session = request.getSession(false);
		ArrayList<Product> list = service.getAll();
		String path = request.getServletContext().getRealPath("\\resources\\image") + "\\";
		for (int i = 0; i < list.size(); i++) {
			String path1 = path + list.get(i).getNum() + "\\";
			File imgDir = new File(path1);
			if (imgDir.exists()) {
				String[] files = imgDir.list();
				for (int j = 0; j < files.length; j++) {
					list.get(i).setFiles(files);
				}
			}
			list.get(i).setReviewCount(rService.getProductReview(list.get(i).getNum()).size());
			if (session.getAttribute("id") != null && !((String) session.getAttribute("id")).equals("")) {
				Like l = new Like();
				l.setMem_id((String) session.getAttribute("id"));
				l.setP_num(list.get(i).getNum());
				list.get(i).setLikeCheck(lService.getLike(l));
			}
		}

		mv.addObject("list", list);
		return mv;
	}

	@GetMapping("/product/{num}")
	public ModelAndView productView(@PathVariable("num") int num, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/product/viewProduct");
		String path = request.getServletContext().getRealPath("\\resources\\image") + "\\";
		Product p = getFiles(path, num);
		/*
		 * Product p = service.getProduct(num); String path1 = path + p.getNum() + "\\";
		 * File imgDir = new File(path1); if (imgDir.exists()) { String[] files =
		 * imgDir.list(); for (int j = 0; j < files.length; j++) { p.setFiles(files); }
		 * }
		 */
		mv.addObject("p", p);
		return mv;
	}

	private Product getFiles(String path, int num) {
		Product p = service.getProduct(num);
		String path1 = path + p.getNum() + "\\";
		File imgDir = new File(path1);
		if (imgDir.exists()) {
			String[] files = imgDir.list();
			for (int j = 0; j < files.length; j++) {
				p.setFiles(files);
			}
		}
		return p;
	}

	@GetMapping("/product/add")
	public String addProduct() {
		return "/product/addProduct";
	}

	@GetMapping("/product/edit")
	public String editProduct() {
		return "/product/viewProduct";
	}

	@RequestMapping("/img")
	public ResponseEntity<byte[]> getImg(String fname, int num, HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("\\resources\\image") + "\\" + num + "\\" + fname;
		File f = new File(path);
		HttpHeaders header = new HttpHeaders();
		ResponseEntity<byte[]> result = null;
		try {
			header.add("Content-Type", Files.probeContentType(f.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(f), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}

	@PostMapping("/product/add")
	public ModelAndView addProduct(Product p, MultipartHttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/");
		p.setNum(service.getSequence());
		p.setProduct_image("");
		List<MultipartFile> fList = new ArrayList<MultipartFile>();

		String path = request.getServletContext().getRealPath("\\resources\\image\\" + p.getNum());
		File dir = new File(path);
		if (!dir.exists()) {
			dir.mkdirs();
		}

		if (request.getFiles("file").get(0).getSize() != 0) {
			fList = request.getFiles("file");
			fileUpload(path, fList);
		}

		p.setProduct_image("\\resources\\image\\" + p.getNum());
		p.setDiscount(0);
		service.addProduct(p);

		return mv;
	}

	// 파일 업로드
	public void fileUpload(String path, List<MultipartFile> list) {
		for (MultipartFile m : list) {
			UUID uuid = UUID.randomUUID();
			String originFileName = uuid.toString() + "_" + m.getOriginalFilename();
			String file1 = path + "\\" + originFileName;
			try {
				m.transferTo(new File(file1));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping("/addBasket")
	public void addBakset(HttpServletRequest request, int b_num) {
		HttpSession session = request.getSession(false);
		ArrayList<OrderList> list = new ArrayList<OrderList>();
		if (session.getAttribute("bList") != null) {
			list = (ArrayList<OrderList>) session.getAttribute("bList");
		}
		String path = request.getServletContext().getRealPath("\\resources\\image") + "\\";
		Product p = getFiles(path, b_num);
		OrderList o = new OrderList();
		o.setP_num(p.getNum());
		o.setPrice(p.getProduct_price());
		o.setProduct(p);
		o.setQuantity(1);
		o.setMem_id((String) session.getAttribute("id"));
		list.add(o);
		session.removeAttribute("bList");
		session.setAttribute("bList", list);
	}

	@GetMapping("/member/like") // 찜 목록
	public ModelAndView myLike(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("member/likeList");
		HttpSession session = request.getSession(false);
		Like l = new Like();
		l.setMem_id((String) session.getAttribute("id"));
		ArrayList<Like> list = lService.getLikeList(l);
		String path = request.getServletContext().getRealPath("\\resources\\image") + "\\";
		for (int i = 0; i < list.size(); i++) {
			Like sLi = list.get(i);
			Product p = getFiles(path, sLi.getP_num());
			sLi.setP(p);
		}
		mv.addObject("list", list);
		return mv;
	}

	@GetMapping("/order/list") // 구매 목록
	public ModelAndView myOrderList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("order/orderList");
		HttpSession session = request.getSession(false);
		ArrayList<OrderList> list = (ArrayList<OrderList>)oService.getListByMem((String)session.getAttribute("id"));
		String path = request.getServletContext().getRealPath("\\resources\\image") + "\\";
		for (int i = 0; i < list.size(); i++) {
			OrderList oLi = list.get(i);
			Product p = getFiles(path, oLi.getP_num());
			oLi.setProduct(p);
		}
		mv.addObject("list", list);
		return mv;
	}
}