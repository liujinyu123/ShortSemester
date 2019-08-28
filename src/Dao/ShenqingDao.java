package Dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Bean.JB;
import Bean.Shenqing;
import Utils.HibernateUtils;

public class ShenqingDao {

	
	//实现对申请表的增删改查
	
	
	//实现对申请表的添加
	public void save(Shenqing sh) {
		Transaction ts = null;
		Session session = null;
		System.out.println("传入的学生简介是"+sh.getIntroduction());
		try {
			 session = HibernateUtils.openSession();
			 ts = session.beginTransaction();
			session.save(sh);
			ts.commit();
			 
		}catch(Exception e) {
			 ts.rollback();
		}finally {
			Utils.HibernateUtils.close();
		}
		System.out.println("插入成功");
	}
		
	
	//查询，根据id
	//根据老师的Id查询申请表
	public List<Shenqing> get(int t_id) {
		List<Shenqing> list = new ArrayList<Shenqing>();
		Shenqing sh = new Shenqing();
		Transaction ts = null;
		Session session = null;
		System.out.println("接收到的id是"+t_id);
		try {
			 session = HibernateUtils.openSession();
			 ts = session.beginTransaction();
			 Query query = session.createQuery("from Shenqing where t_id=?");
			 query.setParameter(0, t_id);
			 list = query.list();
			
			ts.commit();
			 
		}catch(Exception e) {
			 ts.rollback();
		}finally {
			Utils.HibernateUtils.close();
		}
		System.out.println("查询成功");
		return list;
	}
	
	
	public Shenqing get1(int t_id) {
		List<Shenqing> list = new ArrayList<Shenqing>();
		Shenqing sh = new Shenqing();
		Transaction ts = null;
		Session session = null;
		System.out.println("接收到的id是"+t_id);
		try {
			 session = HibernateUtils.openSession();
			 ts = session.beginTransaction();
			 Query query = session.createQuery("from Shenqing where t_id=?");
			 query.setParameter(0, t_id);
			 list = query.list();
			
			ts.commit();
			 
		}catch(Exception e) {
			 ts.rollback();
		}finally {
			Utils.HibernateUtils.close();
		}
		System.out.println("查询成功");
		return list.get(0);
	}
	
	//修改审核申请后的状态
	public void statusUpdate1(Shenqing shenqing) {
		Transaction ts = null;
		Session session = null;
		session = HibernateUtils.openSession();
		 ts = session.beginTransaction();
		session.update(shenqing);
		ts.commit();
		Utils.HibernateUtils.close();
	}
	
	//根据id查询申请的事件
	public Shenqing get2(int id) {
		List<Shenqing> list = new ArrayList<Shenqing>();
		Shenqing sh = new Shenqing();
		Transaction ts = null;
		Session session = null;
		System.out.println("接收到的id是"+id);
		try {
			 session = HibernateUtils.openSession();
			 ts = session.beginTransaction();
			 Query query = session.createQuery("from Shenqing where id=?");
			 query.setParameter(0, id);
			 list = query.list();
			
			ts.commit();
			 
		}catch(Exception e) {
			 ts.rollback();
		}finally {
			Utils.HibernateUtils.close();
		}
		System.out.println("查询成功");
		return list.get(0);
	}
	
	//根据学生的ID查询申请的数据
	public Shenqing get3(int s_id) {
		List<Shenqing> list = new ArrayList<Shenqing>();
		Shenqing sh = new Shenqing();
		Transaction ts = null;
		Session session = null;
		System.out.println("接收到的id是"+s_id);
		try {
			 session = HibernateUtils.openSession();
			 ts = session.beginTransaction();
			 Query query = session.createQuery("from Shenqing where s_id=?");
			 query.setParameter(0, s_id);
			 list = query.list();
			
			ts.commit();
			 
		}catch(Exception e) {
			 ts.rollback();
		}finally {
			Utils.HibernateUtils.close();
		}
		System.out.println("查询成功");
		return list.get(0);
	}
	

}

