package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.RatingMapper;
import com.domain.Rating;
import com.domain.RatingExample;
import com.domain.Score;
import com.service.RatingService;

@Service
public class RatingServiceImpl implements RatingService{
    
	@Resource
	RatingMapper ratingMapper;
	@Override
	public List<Rating> findAll(String name) {
		
		List<Rating> ratings=ratingMapper.findAll(name);
		return ratings;
	}

	//插入
		public void insertRating(Rating rating) {
			ratingMapper.insert(rating);
		}

		//根据医生姓名查找
		public List<Rating> findByDoctorName(String name,int mode) {
			
			RatingExample ratingExample = new RatingExample();
			if(mode==0){
				//默认排序
				ratingExample.setOrderByClause("weight desc");
			}
			else if(mode==1){
				//时间排序
				ratingExample.setOrderByClause("rtime desc");
			}
			com.domain.RatingExample.Criteria c=ratingExample.createCriteria();
			c.andDnameEqualTo(name);
			
			return ratingMapper.selectByExample(ratingExample);
		}
		
		//根据订单号查找
		public Rating findByOrderId(int oid){
			RatingExample ratingExample = new RatingExample();
			com.domain.RatingExample.Criteria c=ratingExample.createCriteria();
			c.andOidEqualTo(oid);
			List<Rating> rating=ratingMapper.selectByExample(ratingExample);
			if(rating.size()==1)
				return rating.get(0);
			else return null;
		}
		
		//插入追评
		public void insertMoreRating(Rating rating) {
			ratingMapper.updateByPrimaryKeySelective(rating);
		}
		
		//删除评论
		public void deleteRatingById(int rid){
			ratingMapper.deleteByPrimaryKey(rid);	
		}
		
		//得到医生的各项平均评分
		public Score getAverageScore(Integer drid){
			Score score=new Score();
			score.setSkill(ratingMapper.avgBySkill());
			score.setService(ratingMapper.avgByService());
			score.setEffect(ratingMapper.avgByEffect());
			return score;
		}
		
		//由主键查找权重
		public int getWeightById(int rid){
			return ratingMapper.selectByPrimaryKey(rid).getWeight();
		}
	
}
