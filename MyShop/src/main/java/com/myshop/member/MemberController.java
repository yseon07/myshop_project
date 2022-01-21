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

	@PostMapping("/member/login") // 로그인
	public String login(HttpServletRequest request, @RequestParam(value = "member_id") String id,
			@RequestParam(value = "member_pwd") String pwd) {
		String path = "redirect:/";
		Member m1 = service.getMemById(id);
		if (m1 != null && m1.getMember_pwd().equals(pwd)) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("nick", m1.getMember_nickname());
			session.setAttribute("level", m1.getMember_level());
			session.setAttribute("point", m1.getMember_point());
			session.setAttribute("type", m1.getMember_type());
			return path;
		} else {
			return "/member/loginFail";
		}
	}

	@GetMapping("/member/logout") // 로그아웃
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.removeAttribute("id");
		session.removeAttribute("level");
		session.removeAttribute("point");
		session.removeAttribute("type");
		session.invalidate();
		return "redirect:/";
	}

	@PostMapping("/member/delete") // 회원 탈퇴
	public String delMember(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		service.delMember((String) session.getAttribute("id"));
		return "redirect:/member/logout";
	}

	@PostMapping("/member/update") // 주소 변경
	@ResponseBody
	public Member editMemAddress(HttpServletRequest request, @RequestParam String member_zipcode,
			@RequestParam String member_address1, @RequestParam String member_address2) {
		HttpSession session = request.getSession(false);
		Member m = new Member();
		String id = (String) session.getAttribute("id");
		m.setMember_id(id);
		m.setMember_zipcode(member_zipcode);
		m.setMember_address1(member_address1);
		m.setMember_address2(member_address2);
		service.editMem(m);
		return service.getMemById(id);
	}

	@GetMapping("/member/pwdPopup")
	public String pwdPop() {
		return "/member/pwdPopup";
	}
	
	@PostMapping("/member/pwdUpdate")
	@ResponseBody
	public int editPwd(HttpServletRequest request, @RequestParam String pPwd, @RequestParam String member_pwd) {
		HttpSession session = request.getSession(false);
		Member m = service.getMemById((String) session.getAttribute("id"));
		if (m != null) {
			if (m.getMember_pwd().equals(pPwd)) {
				m.setMember_pwd(member_pwd);
				service.editMemPwd(m);
				return 1;
			}
		}
		return 0;
	}
	
	@GetMapping("/member/infoSearch")
	public String infoSearch() {
		return "/member/infoSearch";
	}

	@GetMapping("/member/idSearch")
	@ResponseBody
	public String idSearch(@RequestParam String member_phone) {
		String id = service.getMemByPhone(member_phone);
		return id;
	}
	
	@PostMapping("/member/pwdSearch")
	@ResponseBody
	public String pwdSearch(@RequestParam String member_id, @RequestParam String member_phone) {
		Member m = service.getMemById(member_id);
		if(m != null && m.getMember_phone().equals(member_phone)) {
			return m.getMember_pwd();
		}
		return null;
	}
	
	@GetMapping("/member/join")
	public String goJoin(Member m) {
		return "/member/join";
	}

	@PostMapping("/member/join") // 회원 가입
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

	@PostMapping("/member/idCheck") // 아이디 중복 확인
	@ResponseBody
	public int idCheck(@RequestParam(value = "member_id") String member_id) {
		Member m = service.getMemById(member_id);
		if (m != null) {
			return 0;
		} else {
			return 1;
		}
	}

	@PostMapping("/member/nickCheck") // 닉네임 중복 확인
	@ResponseBody
	public int nickCheck(@RequestParam(value = "nickname") String nickname) {
		int count = service.getMemByNick(nickname);
		return count;
	}

	@GetMapping("/member/mypage") // 마이페이지 정보
	public ModelAndView mypage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("member/myPage");
		HttpSession session = request.getSession(false);
		Member m = service.getMemById((String) session.getAttribute("id"));
		mv.addObject("m", m);
		return mv;
	}

	
	
}