package com.myshop.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	private ReviewService service;

	@GetMapping("/list")
	public ModelAndView list(@RequestParam("p_num") int p_num) {
		ModelAndView mv = new ModelAndView("/review/reviewList");
		ArrayList<Review> list = service.getProductReview(p_num);
		mv.addObject("list", list);
		return mv;
	}

	@GetMapping("/add")
	public String addReview(HttpServletRequest request, @RequestParam("pNum") int pNum) {
		request.setAttribute("pNum", pNum);
		return "/review/addReview";
	}

	@PostMapping("/add")
	public String writeReview(HttpServletRequest request, @RequestParam("pNum") int pNum, Review r) {
		r.setP_num(pNum);
		service.addReview(r);
		request.setAttribute("num", pNum);
		return "/review/reviewSuccess";
	}

}