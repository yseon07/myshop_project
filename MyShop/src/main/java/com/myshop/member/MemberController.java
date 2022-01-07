package com.myshop.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberController {
	@Autowired
	MemberService service;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/member/login")
	public String goLogin(Member m) {
		return "/member/login";
	}
	
	@PostMapping("/member/login")
	public String login(HttpServletRequest request, @RequestParam(value="member_id") String id, @RequestParam(value="member_pwd") String pwd) {
		String path = "/member/login";
		System.out.println("id" + id);
		Member m1 = service.getMemById(id);
		if(m1 != null && m1.getMember_pwd().equals(pwd)) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			return path;
		} else {
			return "/member/loginFail";
		}
	}
	
	@GetMapping("/member/join")
	public String goJoin(Member m) {
		return "/member/join";
	}
	
	@PostMapping("/member/join")
	public String join(Member m) {
		service.addMember(m);
		return "/";
	}
	
	@GetMapping("/members/{id}")
	public void aaaa(String id) {
		
	}
}