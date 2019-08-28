package Dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Bean.JB;
import Bean.Rule;
import Utils.HibernateUtils;

public class RuleDao {

	//像数据库中添加规则
public void save(Rule rule) {
		
		Transaction ts = null;
		Session session = null;
		System.out.println("传入的学校是"+rule.getRule());
		try {
			 session = HibernateUtils.openSession();
			 ts = session.beginTransaction();
			session.save(rule);
			ts.commit();
			 
		}catch(Exception e) {
			 ts.rollback();
		}finally {
			Utils.HibernateUtils.close();
		}
		System.out.println("插入成功");
	}


//根据id查询教师所设定的规则
public Rule get(int id) {
	Transaction ts = null;
	Session session = null;
	System.out.println("接收到的id是"+id);
	 List<Rule> list = new ArrayList<Rule>();
	try {
		System.out.println(1);
		 session = HibernateUtils.openSession();
		 System.out.println(2);
		 ts = session.beginTransaction();
		 System.out.println(3);
		 Query query = session.createQuery("from Rule where t_id=?");
		 System.out.println(4);
		 query.setParameter(0, id);
		 System.out.println(5);
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
}
