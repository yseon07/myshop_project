package com.myshop.qna;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaService {
	@Autowired
	private QnaMapper mapper;

	public void addQna(Qna q) {
		mapper.insert(q);
	}

	public ArrayList<Qna> getProductQna(int p_num) {
		return mapper.selectByNum(p_num);
	}
	
	public ArrayList<Qna> getProductQnaTopComment(int p_num) {
		return mapper.selectByTopComment(p_num);
	}
	
	public ArrayList<Qna> getProductQnaAnswerComment(int p_num) {
		return mapper.selectByAnswerComment(p_num);
	}
	
	public void editQna(Qna q) {
		mapper.update(q);
	}
	
	public void delQna(int num) {
		mapper.delete(num);
	}
}
