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
 * Servlet implementation class ShenqingServlet
 */
@WebServlet("/ShenqingServlet")
public class ShenqingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShenqingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method = request.getParameter("method");
		System.out.println(method);
		request.setCharacterEncoding("utf-8");
		if(method.equals("add")) {
			try {
				add(request,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(method.equals("update")) {
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
	String description = new String(request.getParameter("content").getBytes("iso-8859-1"));
    System.out.println("个人简介是"+description);
    int age = Integer.parseInt(new String(request.getParameter("age").getBytes("iso-8859-1")));
    System.out.println("年龄是"+age);
    JB jb1 = new JB();
    HttpSession session =request.getSession();
    jb1 = (JB)session.getAttribute("jb");
    System.out.println(jb1.getId());
    JB jb = new JB();
    jb.setId(jb1.getId());
    System.out.println("传入的Id"+jb.getId());
    jb.setAge(age);
   
    jb.setDescription(description);
    jb.setDirection(direction);
  
   
    jb.setPhone(phone);
    jb.setQQ(QQ);
    jb.setSchool(school);
    jb.setU_id(jb1.getU_id());
   
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

	private void update(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String reply = new String(request.getParameter("reply").getBytes("iso-8859-1"));
		System.out.println("收到的回复是"+reply);
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println("接收到的id是"+id);
		ShenqingDao shDao = new ShenqingDao();
		Shenqing sh = new Shenqing();
		sh = shDao.get2(id);
		sh.setReply(reply);
		shDao.statusUpdate1(sh);
		response.sendRedirect(request.getContextPath()+"/Teacher/list.jsp");
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String dname = new String(request.getParameter("dname").getBytes("iso-8859-1"));
		System.out.println("选择导师的名称是："+dname);
		String reason = new String(request.getParameter("reason").getBytes("iso-8859-1"));
		System.out.println("接收的原因是"+reason);
		String introduction = new String(request.getParameter("introduction").getBytes("iso-8859-1"));
	    System.out.println("接收的个人描述是"+introduction);
	    Shenqing sh = new Shenqing();
	    ShenqingDao shDao = new ShenqingDao();
	    User user = new User();
	    UserDao userDao = new UserDao();
	    user = userDao.load(dname);//查询报考的老师
	    System.out.println("报考的老师姓名是 "+user.getUsername());
	    HttpSession session = request.getSession();
	    User user1 = new User();   //登陆的学生
	    user1 = (User)session.getAttribute("loginUser");//查找报考的学生
	    sh = shDao.get3(user1.getId());
	    System.out.println("申请");
	    sh.setS_id(user1.getId());
	    sh.setT_id(user.getId());
	    sh.setReason(reason);
	    sh.setIntroduction(introduction);
	    sh.setResult("未审核");
	    sh.setStatus("0");
	    sh.setReplystatus("未读");
	    shDao.statusUpdate1(sh);
	    response.sendRedirect(request.getContextPath()+"/Student/index.jsp");
	}


}
