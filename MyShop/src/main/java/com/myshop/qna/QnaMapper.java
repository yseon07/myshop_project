package com.myshop.qna;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QnaMapper {
	void insert(Qna q);
	ArrayList<Qna> selectByNum(int p_num);
	ArrayList<Qna> selectByTopComment(int p_num);
	ArrayList<Qna> selectByAnswerComment(int p_num);
	void update(Qna q);
	void delete(int num);
}