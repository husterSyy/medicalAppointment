package com.dao;

import java.util.List;

import com.domain.Appoint;



public interface AppointMapper {
	
	List<Appoint> selectByDoctorName(String dName);
	Appoint selectByPrimaryKey(Integer aId);
	int deleteFreeTime(Integer aId);
	int addAppointNum(Integer aId);
	int subAppointNum(Integer aId);
	int insertTime(Appoint appoint);
	
}
