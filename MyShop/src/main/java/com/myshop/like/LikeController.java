package com.myshop.like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/like")
public class LikeController {
	@Autowired
	private LikeService service;

	@GetMapping("/{pNum}")
	@ResponseBody
	public int getProductLikeCount(@RequestParam(value = "p_num") int pNum) {
		return service.getCount(pNum);
	}

	@PostMapping("/{pNum}/mem")
	@ResponseBody
	public int getProductLike(@RequestParam(value = "p_num") int pNum, @RequestParam(value = "mem_id") String memId) {
		Like l = new Like();
		l.setP_num(pNum);
		l.setMem_id(memId);
		return service.getLike(l); // 1이면 존재, 0이면 없음
	}

	@PostMapping("/{pNum}")
	@ResponseBody
	public int setLike(@RequestParam(value = "p_num") int pNum, @RequestParam(value = "mem_id") String memId) {
		Like l = new Like();
		l.setP_num(pNum);
		l.setMem_id(memId);
		if (service.getLike(l) == 1) {
			service.delLike(l);
			return 0;
		} else {
			service.addLike(l);
			return 1;
		}
	}

	/*
	 * @PostMapping("/{pNum}/del")
	 * 
	 * @ResponseBody public void delLike(@RequestParam(value = "p_num") int
	 * pNum, @RequestParam(value = "mem_id") String memId) { Like l = new Like();
	 * l.setP_num(pNum); l.setMem_id(memId); service.delLike(l); }
	 */
}