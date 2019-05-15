package com.service;

import java.util.List;

import com.domain.Rating;
import com.domain.Score;

public interface RatingService {

	List<Rating> findAll(String name);
	public void insertRating(Rating rating) ;
	public List<Rating> findByDoctorName(String name,int mode) ;
	public Rating findByOrderId(int oid);
	public void insertMoreRating(Rating rating) ;
	public void deleteRatingById(int rid);
	public Score getAverageScore(Integer drid);
	public int getWeightById(int rid);
}
