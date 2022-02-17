package com.myshop.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;

	@GetMapping("/notice")
	public String getListPage(Model model, Pagenation p) {
		model.addAttribute("list", service.listPage(p));
		PageMaker pm = new PageMaker();
		pm.setP(p);
		pm.setTotalCount(service.getCount());
		model.addAttribute("pm", pm);
		return "/notice/noticeList";
	}

	@GetMapping("/notice/{num}")
	public String getNotice(@PathVariable("num") int num, Model model) {
		model.addAttribute("n", service.getNotice(num));
		return "/notice/viewNotice";
	}

	@GetMapping("/notice/write")
	public String getWriteNotice() {
		return "/notice/writeNotice";
	}

	@PostMapping("/notice/write")
	public String postWriteNotice(Notice n) {
		service.addNotice(n);
		return "redirect:/notice";
	}
}