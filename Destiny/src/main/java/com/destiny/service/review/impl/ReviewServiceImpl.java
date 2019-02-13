package com.destiny.service.review.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.destiny.service.review.ReviewDao;
import com.destiny.service.review.ReviewService;

@Service("reviewServiceImpl")
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	@Qualifier("reviewDaoImpl")
	private ReviewDao reviewDao;

	public void setReviewDao(ReviewDao reviewDao) {
		this.reviewDao = reviewDao;
	}
	
	public ReviewServiceImpl() {
		System.out.println(this.getClass());
	}
}
