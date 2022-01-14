package com.myshop.like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikeService {
	@Autowired
	private LikeMapper mapper;
	
	public void addLike(Like l) {
		mapper.insert(l);
	}
	
	public int getLike(Like l) {
		return mapper.selectById(l);
	}
	
	public int getCount(int p_num) {
		return mapper.selectCount(p_num);
	}
	
	public void delLike(Like l) {
		mapper.delete(l);
	}
}