package Utils;
//完成Hibernate工具类的封装

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {

	private static SessionFactory sf;
	static {
		//1.读取配置文件
				Configuration conf = new Configuration().configure();
		    //2.根据数据创建factory对象
				 sf = conf.buildSessionFactory();
			//3.获取操作数据库的session对象
	}
	//如果这样封装，会每次都加载驱动
	public static Session openSession() {
	
		Session session = sf.openSession();
		return session;
	} 
	
public static void close() {
		
		openSession().close();
		sf.close();
	} 
}
