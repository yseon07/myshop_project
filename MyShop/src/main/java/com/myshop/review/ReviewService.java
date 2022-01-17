package com.myshop.review;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {
	@Autowired
	private ReviewMapper mapper;

	public void addReview(Review r) {
		mapper.insert(r);
	}
	
	public ArrayList<Review> getProductReview(int p_num) {
		return mapper.selectByNum(p_num);
	}
	
	public void editReview(Review r) {
		mapper.update(r);
	}
	
	public void delReview(int num) {
		mapper.delete(num);
	}
}
