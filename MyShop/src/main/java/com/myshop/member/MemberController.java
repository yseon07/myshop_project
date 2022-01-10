package com.myshop.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	public String login(HttpServletRequest request, @RequestParam(value = "member_id") String id,
			@RequestParam(value = "member_pwd") String pwd) {
		String path = "redirect:/";
		Member m1 = service.getMemById(id);
		if (m1 != null && m1.getMember_pwd().equals(pwd)) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("level", m1.getMember_level());
			session.setAttribute("point", m1.getMember_point());
			return path;
		} else {
			return "/member/loginFail";
		}
	}

	@GetMapping("/member/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.removeAttribute("id");
		session.removeAttribute("level");
		session.removeAttribute("point");
		session.invalidate();
		return "redirect:/";
	}

	@PostMapping("/member/delete")
	public String delMember(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		service.delMember((String) session.getAttribute("id"));
		return "redirect:/member/logout";
	}

	@GetMapping("/member/join")
	public String goJoin(Member m) {
		return "/member/join";
	}

	@PostMapping("/member/join")
	public String join(Member m, String birty1, String birty2, String member_zipcode) {
		int b1 = Integer.parseInt(birty1);
		int b2 = Integer.parseInt(birty2);
		String member_birty = "1900-";
		if (b1 < 10) {
			member_birty += "0" + b1;
		} else {
			member_birty += b1;
		}
		member_birty += "-";
		if (b2 < 10) {
			member_birty += "0" + b2;
		} else {
			member_birty += b2;
		}
		m.setMember_birty(member_birty);
		service.addMember(m);
		return "/member/joinResult";
	}

	@PostMapping("/member/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam(value = "member_id") String member_id) {
		Member m = service.getMemById(member_id);
		if (m != null) {
			return 0;
		} else {
			return 1;
		}
	}

	@PostMapping("/member/nickCheck")
	@ResponseBody
	public int nickCheck(@RequestParam(value = "nickname") String nickname) {
		int count = service.getMemByNick(nickname);
		return count;
	}

	@GetMapping("/member/mypage")
	public ModelAndView mypage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("member/myPage");
		HttpSession session = request.getSession(false);
		Member m = service.getMemById((String) session.getAttribute("id"));
		mv.addObject("m", m);
		return mv;
	}

	@GetMapping("/members/{id}")
	public void editMembers(String id) {

	}
}