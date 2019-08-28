package Servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.JB;
import Bean.Shenqing;
import Bean.User;
import Dao.JBDao;
import Dao.ShenqingDao;
import Dao.UserDao;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    //接收出来的form表格
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method = request.getParameter("method");
		System.out.println(method);
		request.setCharacterEncoding("utf-8");
		if(method.equals("check")) {
			try {
				check(request,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(method.equals("add")) {
			try {
				add(request,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}


	private void add(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String username = new String(request.getParameter("username").getBytes("iso-8859-1"));
	    String password = new String(request.getParameter("password").getBytes("iso-8859-1"));
	    String status = new String(request.getParameter("p1").getBytes("iso-8859-1"));
	    System.out.println("接收到的用户名是："+username);
	    System.out.println("接收到的密码："+password);
	    System.out.println("接收到的身份是："+status);
	    User user = new User();
	    user.setUsername(username);
	    user.setPassword(password);
	    if(status.equals("学生")) {
	    	user.setType("0");
	    }else {
	    	user.setType("1");
	    }
	    UserDao userDao = new UserDao();
	    userDao.save(user);
	    JB jb = new JB();
	    JBDao jbDao = new JBDao();
	    jb.setU_id(user.getId());
	    jb.setAge(0);
	    jbDao.save(jb);
	    Shenqing sh = new Shenqing();
	    ShenqingDao shDao = new ShenqingDao();
	    sh.setS_id(user.getId());
	    sh.setT_id(0);
	    shDao.save(sh);
	    response.sendRedirect(request.getContextPath()+"/login.jsp");

	}


	private void check(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		//接收输入的用户名和密码
		User user = new User();
		UserDao userDao = new UserDao();
		HttpSession session = request.getSession();
		String username = new String(request.getParameter("username").getBytes("iso-8859-1"));
		String password = request.getParameter("password");
		System.out.println("你输入的用户名是："+username);
		System.out.println("你输入的密码是"+password);
		if(username==null||"".equals(username)) {
			String userError = "用户名不能为空";
			session.setAttribute("usernameError", userError);
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}else if(password==null||"".equals(password)) {
			String passwordError = "用户名不能为空";
			session.setAttribute("passwordError", passwordError);
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}else {
			user = userDao.load(username);
			if(user==null) {
				String userError = "用户名不存在";
				session.setAttribute("usernameError", userError);
				response.sendRedirect(request.getContextPath()+"/login.jsp");
				}else if(!user.getPassword().equals(password)) {
					String passwordError = "输入的密码不正确";
					session.setAttribute("passwordError", passwordError);
					response.sendRedirect(request.getContextPath()+"/login.jsp");	
				}else {
					session.setAttribute("loginUser", user);
					//说明是导师
					if(user.getType().equals("1")) {
						response.sendRedirect(request.getContextPath()+"/Teacher/zhongjian.jsp");		
					}else if(user.getType().equals("0")){//说明是学生
					    response.sendRedirect(request.getContextPath()+"/Student/zhongjian.jsp");
					}else {
						//说明是管理员
						response.sendRedirect(request.getContextPath()+"/Administrator/main.jsp");
					}
				}
			
		}
		
		
		
	}

}
