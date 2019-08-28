package Dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Bean.JB;
import Utils.HibernateUtils;

public class JBDao {

	//对基本信息的增删改查
	
	//查询
	public JB get(int id) {
		Transaction ts = null;
		Session session = null;
		
		 List<JB> list = new ArrayList<JB>();
		try {
			
			 session = HibernateUtils.openSession();
			
			 ts = session.beginTransaction();
			 
			 Query query = session.createQuery("from JB where u_id=?");
			
			 query.setParameter(0, id);
			
			 list = query.list();
			 
			 ts.commit();
			 
		}catch(Exception e) {
			 ts.rollback();
		}finally {
			Utils.HibernateUtils.close();
		}
		System.out.println(list.size());
		 return list.get(0);
		
	}
		

	//删除
	public void delete(int id) {
		JB jb = new JB();
		Transaction ts = null;
		Session session = null;
		System.out.println("接收到的id是"+id);
		try {
			 session = HibernateUtils.openSession();
			 ts = session.beginTransaction();
			 jb.setId(id);
			session.delete(jb);
			ts.commit();
			 
		}catch(Exception e) {
			 ts.rollback();
		}finally {
			Utils.HibernateUtils.close();
		}
		System.out.println("删除成功");
	}
	
	
	//像数据库中添加
	public void save(JB jb) {
		
		Transaction ts = null;
		Session session = null;
		System.out.println("传入的学校是"+jb.getSchool());
		try {
			 session = HibernateUtils.openSession();
			 ts = session.beginTransaction();
			session.save(jb);
			ts.commit();
			 
		}catch(Exception e) {
			 ts.rollback();
		}finally {
			Utils.HibernateUtils.close();
		}
		System.out.println("插入成功");
	}
	
	
	//更新基本信息的内容
	public void update(JB jb) {
		Transaction ts = null;
		Session session = null;
		System.out.println("传入的学校是"+jb.getSchool());
		try {
			 session = HibernateUtils.openSession();
			 ts = session.beginTransaction();
			session.update(jb);
			ts.commit();
			 
		}catch(Exception e) {
			 ts.rollback();
		}finally {
			Utils.HibernateUtils.close();
		}
		System.out.println("插入成功");
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
