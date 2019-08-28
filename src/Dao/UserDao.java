package Dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Bean.JB;
import Bean.User;
import Utils.HibernateUtils;

public class UserDao {

	
	//运用hibernate实现类的增删改查
	
	
	//实现查询
	public User load(String username) {
		Transaction ts = null;
		Session session = null;
		 List<User> list = new ArrayList<User>();
		try {
			 session = HibernateUtils.openSession();
			 ts = session.beginTransaction();
			 Query query = session.createQuery("from User where username=?");
			 query.setParameter(0, username);
			 list = query.list();
			 ts.commit();
			 
		}catch(Exception e) {
			 ts.rollback();
		}finally {
			
		}
		 return list.get(0);
		
	}
	
	//根据id查询
	public User load1(int id) {
		Transaction ts = null;
		Session session = null;
		 List<User> list = new ArrayList<User>();
		try {
			 session = HibernateUtils.openSession();
			 ts = session.beginTransaction();
			 Query query = session.createQuery("from User where id=?");
			 query.setParameter(0, id);
			 list = query.list();
			 ts.commit();
			 
		}catch(Exception e) {
			 ts.rollback();
		}finally {
			
		}
		 return list.get(0);
		
	}
	
	
	//删除用户对象
	public void delete(User user) {
		Transaction ts = null;
		Session session = null;
		
		
			 session = HibernateUtils.openSession();
			 ts = session.beginTransaction();
			 session.delete(user);
			 ts.commit();
		    System.out.println("删除成功");
		
	}
	
	
	//查询所有老师的id
	public List<User> userList(){
		Transaction ts = null;
		Session session = null;
		 List<User> list = new ArrayList<User>();
		try {
			System.out.println(1);
			 session = HibernateUtils.openSession();
			 System.out.println(2);
			 ts = session.beginTransaction();
			 System.out.println(3);
			 Query query = session.createQuery("from User where type=?");
			 System.out.println(4);
			 query.setParameter(0, "1");
			 System.out.println(5);
			 list = query.list();
			 
			 ts.commit();
			 
		}catch(Exception e) {
			 ts.rollback();
		}finally {
			Utils.HibernateUtils.close();
		}
		System.out.println(list.size());
		 return list;
	}
	
	
	//实现对用户信息的插入
	public void save(User user) {
		Transaction ts = null;
		Session session = null;
		
		
			 session = HibernateUtils.openSession();
			 ts = session.beginTransaction();
			 session.save(user);
			 ts.commit();
		     System.out.println("保存成功");
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
