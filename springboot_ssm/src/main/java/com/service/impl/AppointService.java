package com.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AppointMapper;
import com.dao.OrderitemMapper;
import com.domain.Appoint;
import com.domain.Orderitem;



@Service
public class AppointService {
	@Autowired
	private AppointMapper appointMapper;
	
	@Autowired
	private OrderitemMapper orderitemMapper;
	
	public int getTimeById(Integer aId){
		return appointMapper.selectByPrimaryKey(aId).getaTime();
	}
	
	//���ҽ��name��ȡ����ʱ��
	public List<Appoint> getTimeByDoctor(String dName){
		return appointMapper.selectByDoctorName(dName);
	}
	
	//ԤԼ�����ز���Ķ���id
	public int appointById(Integer aId,Integer uid){
		Appoint appoint=appointMapper.selectByPrimaryKey(aId);
		
		if(appoint.getaNum()>=10){
			//����ӱ���ɾ��
			appointMapper.deleteFreeTime(aId);
		}else{
			//δ��
			appointMapper.addAppointNum(aId);
		}
		
		//�������ʱ����
		Orderitem orderitem=new Orderitem();
		orderitem.setAppointedtime(aId);
		orderitem.setOrdertime(new Date());
		orderitem.setDname(appoint.getdName());
		orderitem.setUid(uid);
		orderitem.setState((byte) 0);
		orderitem.setMoney(10.0f);
		/*����ҽ���Ǯ���ַ�ȷ���orderitem*/
		orderitemMapper.insert(orderitem);
		
		int oid=orderitemMapper.getLastPrimaryKey();
		System.out.print(oid);
		return oid;
	}
	
	//ȡ��ԤԼ
	public void cancelOrder(Integer oid){
		//���ԤԼʱ��
		Orderitem orderitem=orderitemMapper.selectByPrimaryKey(oid);
		Appoint appoint=appointMapper.selectByPrimaryKey(orderitem.getAppointedtime());
		if(appoint==null){
			//Ϊ�գ������
			appoint=new Appoint();
			appoint.setdName(orderitem.getDname());
			appoint.setaNum(1);
			appoint.setaTime(orderitem.getAppointedtime());
			appointMapper.insertTime(appoint);
		}else{
			//����У��������һ
			appointMapper.subAppointNum(appoint.getaId());
		}
		//�Ӷ�����ɾ��
		orderitemMapper.deleteByPrimaryKey(oid);
	}
}
