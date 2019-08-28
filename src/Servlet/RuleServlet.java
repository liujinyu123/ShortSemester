package Servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.Rule;
import Bean.User;
import Dao.RuleDao;

/**
 * Servlet implementation class RuleServlet
 */
@WebServlet("/RuleServlet")
public class RuleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RuleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    //接收出来的form表格
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method = request.getParameter("method");
		System.out.println("股则设定");
		System.out.println(method);
		request.setCharacterEncoding("utf-8");
		if(method.equals("add")) {
			try {
				add(request,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//接收前端传来的规则
		String shuru1 = new String(request.getParameter("shuru1").getBytes("iso-8859-1"));
		System.out.println("输入的第一个条件是"+shuru1);
		String shuru2 = new String(request.getParameter("shuru2").getBytes("iso-8859-1"));
		System.out.println("输入的第er个条件是"+shuru2);
		String shuru3 = new String(request.getParameter("shuru3").getBytes("iso-8859-1"));
		System.out.println("输入的第san个条件是"+shuru3);
		User user = new User();
		HttpSession session = request.getSession();
		user = (User)session.getAttribute("loginUser");
		Rule rule = new Rule();
		String rule1 = shuru1+" "+shuru2+" "+shuru3+" ";
		rule.setT_id(user.getId());
		rule.setRule(rule1);
		RuleDao ruleDao = new RuleDao();
		ruleDao.save(rule);
		response.sendRedirect(request.getContextPath()+"/Teacher/list.jsp");
	}
}
