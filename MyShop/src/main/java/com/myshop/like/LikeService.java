package com.myshop.like;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikeService {
	@Autowired
	private LikeMapper mapper;
	
	public void addLike(Like l) {
		mapper.insert(l);
	}
	
	public ArrayList getLikeList(Like l) {
		return mapper.selectById(l);
	}
	
	public int getLike(Like l) {
		return mapper.selectCountById(l);
	}
	
	public int getCount(int p_num) {
		return mapper.selectCount(p_num);
	}
	
	public void delLike(Like l) {
		mapper.delete(l);
	}
}