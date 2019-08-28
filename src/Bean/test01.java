package Bean;



import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import Utils.HibernateUtils;


public class test01 {

	
	public void fun1() {
	//1.读取配置文件
		Configuration conf = new Configuration().configure();
    //2.根据数据创建factory对象
		SessionFactory sessionFactory = conf.buildSessionFactory();
	//3.获取操作数据库的session对象
		Session session = sessionFactory.openSession();
	//4.操作数据库
		User user = new User();
		user.setUsername("Tom");
		user.setPassword("1234");
		session.save(user);
	//5.关闭资源
		session.close();
		sessionFactory.close();
	}
	
	//对数据库进行修改
	public void fun2() {
		//1.读取配置文件
				Configuration conf = new Configuration().configure();
		    //2.根据数据创建factory对象
				SessionFactory sessionFactory = conf.buildSessionFactory();
			//3.获取操作数据库的session对象
				Session session = sessionFactory.openSession();
				Transaction ts = session.beginTransaction();
			//4.操作数据库
		    User user = (User) session.get(User.class, 2);
		    //在查询结果上进行修改
		   user.setUsername("汤姆");
		   session.update(user);
		   ts.commit();
	}
	
	//删除对象
	public void fun3() {
		//1.读取配置文件
				Configuration conf = new Configuration().configure();
		    //2.根据数据创建factory对象
				SessionFactory sessionFactory = conf.buildSessionFactory();
			//3.获取操作数据库的session对象
				Session session = sessionFactory.openSession();
				
				Transaction ts = session.beginTransaction();
				
				//-----------------------------------------------------------
				//4.操作数据库
			    User user = new User();
			    
			    user.setId(3);
			    //在查询结果上进行修改
			   session.delete(user);
			    //-----------------------------------------------------------
			   ts.commit();
	}
	
	
	//查询语句,调用get方法查询
	public void fun4() {
		//1.读取配置文件
		Configuration conf = new Configuration().configure();
    //2.根据数据创建factory对象
		SessionFactory sessionFactory = conf.buildSessionFactory();
	//3.获取操作数据库的session对象
		Session session = sessionFactory.openSession();
		
		Transaction ts = session.beginTransaction();
		
		//-----------------------------------------------------------
		//4.操作数据库
	    User user = new User();
	    
	    user.setId(3);
	    //在查询结果上进行修改
	   session.delete(user);
	    //-----------------------------------------------------------
	   ts.commit();
	}
	
	
	//查询，load方法
	public void fun5() {
		//1.读取配置文件
		Configuration conf = new Configuration().configure();
    //2.根据数据创建factory对象
		SessionFactory sessionFactory = conf.buildSessionFactory();
	//3.获取操作数据库的session对象
		Session session = sessionFactory.openSession();
		
		Transaction ts = session.beginTransaction();
		
		//-----------------------------------------------------------
		//4.操作数据库
	    User user = new User();
	    
	    user.setId(3);
	    //在查询结果上进行修改
	   session.delete(user);
	    //-----------------------------------------------------------
	   ts.commit();
	}
	
	
	//查询所有的对象
	public void fun6() {
		//1.读取配置文件
		Configuration conf = new Configuration().configure();
    //2.根据数据创建factory对象
		SessionFactory sessionFactory = conf.buildSessionFactory();
	//3.获取操作数据库的session对象
		Session session = sessionFactory.openSession();
		
		Transaction ts = session.beginTransaction();
		
		//-----------------------------------------------------------
		//4.操作数据库
	   Query query = session.createQuery("from User");
	    
	    List<User> list = query.list();
	    //在查询结果上进行修改
	   System.out.println(list.get(3).getUsername());
	    //-----------------------------------------------------------
	   ts.commit();
	}
	
	
	//查询所有的对象
		public void fun7() {
			//1.读取配置文件
			//Configuration conf = new Configuration().configure();
	    //2.根据数据创建factory对象
			//SessionFactory sessionFactory = conf.buildSessionFactory();
		//3.获取操作数据库的session对象
			//Session session = sessionFactory.openSession();
			Session session = HibernateUtils.openSession();
			Transaction ts = session.beginTransaction();
			
			//-----------------------------------------------------------
			//4.操作数据库
		   Criteria criteria = session.createCriteria(User.class);
		    
		    List<User> list = criteria.list();
		    //在查询结果上进行修改
		   System.out.println(list.get(0).getUsername());
		    //-----------------------------------------------------------
		   ts.commit();
		   session.close();
		}
	
		//查询所有对象
		//查询所有的对象
		//支持原生的sql语句
				public void fun8() {
					//1.读取配置文件
					Configuration conf = new Configuration().configure();
			    //2.根据数据创建factory对象
					SessionFactory sessionFactory = conf.buildSessionFactory();
				//3.获取操作数据库的session对象
					Session session = sessionFactory.openSession();
					
					Transaction ts = session.beginTransaction();
					
					//-----------------------------------------------------------
					//4.操作数据库
				  SQLQuery query = session.createSQLQuery("select * from t_user");
				  query.addEntity(User.class);
				  List<User> list = query.list();
				  
				    //在查询结果上进行修改
				   System.out.println(list.get(3).getUsername());
				    //-----------------------------------------------------------
				   ts.commit();
				}
	//get方法，一旦被调用，立刻发送sql语句查询
	//load方法，调用时并没有查询sql语句，只有当该对象被调用时才会进行查询数据
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		test01 test01 = new test01();
         test01.fun7();
	}

}
