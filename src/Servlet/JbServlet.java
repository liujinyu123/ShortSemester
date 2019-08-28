package Servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.String;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Bean.JB;
import Bean.User;
import Dao.JBDao;

/**
 * Servlet implementation class JbServlet
 */
@WebServlet("/JbServlet")
public class JbServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JbServlet() {
        super();
        
        // TODO Auto-generated constructor stub
    }

    //接收出来的form表格
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method = request.getParameter("method");
		System.out.println(method);
		request.setCharacterEncoding("utf-8");
		if(method.equals("update")) {
			try {
				update(request,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(method.equals("update1")) {
			try {
				update1(request,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private void update1(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
			String school = new String(request.getParameter("school").getBytes("iso-8859-1"));
			System.out.println("输入的学校是"+school);				
		String direction = new String(request.getParameter("direction").getBytes("iso-8859-1"));
		System.out.println("研究方向是"+direction);
		
		String phone = new String(request.getParameter("phone").getBytes("iso-8859-1"));
		System.out.println("电话是"+phone);
		String QQ = new String(request.getParameter("QQ").getBytes("iso-8859-1"));
		System.out.println("QQ是"+QQ);
		String description = new String(request.getParameter("description").getBytes("iso-8859-1"));
	    System.out.println("个人简介是"+description);
	    int age = Integer.parseInt(new String(request.getParameter("age").getBytes("iso-8859-1")));
	    System.out.println("年龄是"+age);
	    User user = new User();
	    HttpSession session =request.getSession();
	    user = (User)session.getAttribute("loginUser");
	    System.out.println(user.getId());
	    JB jb = new JB();
	    JBDao jbDao = new JBDao();
	    jb = jbDao.get(user.getId());
	    jb.setId(user.getId());
	    System.out.println("传入的Id"+user.getId());
	    jb.setAge(age);
	   
	    jb.setDescription(description);
	    jb.setDirection(direction);
	  
	   
	    jb.setPhone(phone);
	    jb.setQQ(QQ);
	    jb.setSchool(school);
	    jb.setU_id(user.getId());
	   
	    
	    //jbDao.delete(jb1.getId());
	    jbDao.update(jb);
	   
	   
	    if(user.getType().equals("1")) {
	    	response.sendRedirect(request.getContextPath()+"/Teacher/main.jsp");
	    }else if(user.getType().equals("0")) {
	    	response.sendRedirect(request.getContextPath()+"/Student/main.jsp");	
	    }
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String school = new String(request.getParameter("school").getBytes("iso-8859-1"));
		System.out.println("输入的学校是"+school);
		String birth = new String(request.getParameter("birth").getBytes("iso-8859-1"));
		System.out.println("输入的出生年月是"+birth);
		String major = new String(request.getParameter("major").getBytes("iso-8859-1"));
		System.out.println("专业是"+major);
		String sex = new String(request.getParameter("sex").getBytes("iso-8859-1"));
		System.out.println("性别是"+sex);
		String direction = new String(request.getParameter("direction").getBytes("iso-8859-1"));
		System.out.println("研究方向是"+direction);
			String job = new String(request.getParameter("job").getBytes("iso-8859-1"));
		System.out.println("职位是"+job);
		String phone = new String(request.getParameter("phone").getBytes("iso-8859-1"));
		System.out.println("电话是"+phone);
		String QQ = new String(request.getParameter("QQ").getBytes("iso-8859-1"));
		System.out.println("QQ是"+QQ);
		String description = new String(request.getParameter("description").getBytes("iso-8859-1"));
	    System.out.println("个人简介是"+description);
	    int age = Integer.parseInt(new String(request.getParameter("age").getBytes("iso-8859-1")));
	    System.out.println("年龄是"+age);
	    JB jb1 = new JB();
	    HttpSession session =request.getSession();
	    jb1 = (JB)session.getAttribute("jb");
	    JB jb = new JB();
	    jb.setId(jb1.getId());
	    System.out.println("传入的Id"+jb.getId());
	    jb.setAge(age);
	    jb.setBirth(birth);
	    jb.setDescription(description);
	    jb.setDirection(direction);
	    jb.setJob(job);
	    jb.setMajor(major);
	    jb.setPhone(phone);
	    jb.setQQ(QQ);
	    jb.setSchool(school);
	    jb.setU_id(jb1.getU_id());
	    jb.setSex(sex);
	    JBDao jbDao = new JBDao();
	    //jbDao.delete(jb1.getId());
	    jbDao.update(jb);
	    User user = new User();
	    user = (User)session.getAttribute("loginUser");
	    if(user.getType().equals("1")) {
	    	response.sendRedirect(request.getContextPath()+"/Teacher/main.jsp");
	    }else if(user.getType().equals("0")) {
	    	response.sendRedirect(request.getContextPath()+"/Student/main.jsp");	
	    }
	    
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
