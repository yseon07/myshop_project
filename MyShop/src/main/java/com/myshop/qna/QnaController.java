package com.myshop.qna;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/qna")
public class QnaController {
	@Autowired
	private QnaService service;

	@GetMapping("/list")
	public ModelAndView list(@RequestParam("p_num") int p_num) {
		ModelAndView mv = new ModelAndView("/qna/qnaList");
		mv.addObject("list", service.getProductQna(p_num));
		return mv;
	}

	@GetMapping("/add")
	public String addQna1(@RequestParam("p_num") int p_num, Model m) {
		m.addAttribute("p_num", p_num);
		return "/qna/addQna";
	}

	@PostMapping("/add")
	public String addQna2(Qna q, HttpServletRequest request) {
		System.out.println(q.toString());
		if (q.getTop_question() > 0) {
			request.setAttribute("result", 1);
		} else {
			request.setAttribute("result", 0);
		}
		service.addQna(q);
		request.setAttribute("num", q.getP_num());
		return "/qna/qnaSuccess";
	}
}