package kr.or.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.memodao;
import kr.or.bit.dto.memo;

@WebServlet("/SimpleController")
public class SimpleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SimpleController() {
        super();
    }
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 1.한글처리
    	request.setCharacterEncoding("UTF-8");
    	// 2.데이터 받기
    	// 3.DB연결
    	// 4.Insert 실행
    	// 5.응답구성
    	response.setContentType("text/html;charset=UTF-8");
    	String cmd = request.getParameter("cmd");
    	
    	PrintWriter out = response.getWriter();
    	
    	if (cmd.equals("join")) {
    		String id = request.getParameter("id");
    		String email = request.getParameter("email");
    		String memo = request.getParameter("memo");
    		
    		try {
    			memodao dao = new memodao();
    			int n = dao.insertMemo(id, email, memo);
    		
    			if (n > 0) {
    				out.print("<script>");
    				out.print("alert('등록성공..');");
    				out.print("location.href='SimpleController?cmd=memolist';");
    				out.print("</script>");
    			} else {
					out.print("<script>");
					out.print("alert('등록실패..');");
					out.print("location.href='memo.html';");
					out.print("</script>");
    			}
    		} catch (Exception e) {
    			System.out.println(e.getMessage());
    		}
    	} else if (cmd.equals("memolist")) {
    		try {
    			memodao dao = new memodao();
				ArrayList<memo> memolist = dao.getMemoList();
				
				request.setAttribute("memolist", memolist);
				
				RequestDispatcher dis = request.getRequestDispatcher("/memolist.jsp");
				dis.forward(request, response);
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
    	} else if (cmd.equals("idcheck")) {
    		String id = request.getParameter("id");
    		
    		memodao dao = new memodao();
    		String ischeck = dao.isCheckById(id);
    		out.print(ischeck);
    	}
    	
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}