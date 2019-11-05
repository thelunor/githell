package com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontBoardController
 */
//@WebServlet("/FrontBoardController")
public class FrontBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    // Get, Post 두 가지 요청ㅇ 대해 모두 동작하는 함수
    // 1. servlet에서 제공하는 함수: service() 함수
    // 2. 별도의 함수를 생성하여 개발자 마음대로: doProcess() 
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response, String method) throws ServletException, IOException {
    	// Get, Post 모든 요청은 Process가 처리
    	System.out.println("클라이언트 요청: " + method);
    	
    	// 1. 한글처리
    	
    	// 2. 요청 받기: request
    	
    	// 3. 요청 판단: 판단의 기준은 parameter로(request 받은 값) > command 방식
    	// 3.1 parameter 기준
    	// 3.2 /board?cmd=login&userid=kglim&pwd=1004
    	
    	// String str = request.getParameter("cmd");
    	// if (str.equals("login")) { 로그인처리 }
    	
    	// /board?cmd=boardlist
    	// if (str.equals("boardlist")) { 게시판 조회 처리 }
    	
    	// Tip: URL 주소 판단
    	// 192.168.0.48:8090/WebSite/board/boardlist
    	// 192.168.0.48:8090/WebSite/board/boardwrite?title=AAA&content=hello
    	
    	// 마지막 주소값 추출(판단 기준)
    	// boardlist > 게시판 조회 처리
    	// boardwrite > 게시판 글쓰기 처리
    	
    	// 4. 처리결과 저장
    	
    	// 5. view 정의
    	// view page 생성: jsp
    	// WebContent/board/boardlist.jsp
    	// WebContent/error/error.jsp
    	// 문제점: 클라이언트가 직접 주소(URL)를 입력하여 접근 
    	// 192.168.0.48:8090/WebServlet_1/board/boardlist.jsp
    	// 실제 프로젝트는 해결방법으로...............................
    	// 해결: WEB-INF(보안폴더)에 뷰단 페이지 생성
    	// 1. WEB-INF/views/board/boardlist.jsp (OK)
    	// 2. WEB-INF/views/error/error.jsp (OK)
    	
    	// 6. view 전달
    	
    	//////////////////////////////////////////////////////////////////////////////
    	// 1. 요청 받기(command)
    	// 요청 주소: 192.168.0.48:8090/WebServlet_1/board?cmd=list
    	String cmd = request.getParameter("cmd");
    	
    	// 2. 요청 판단(업무에 따라서 정의)
    	String viewpage = null;
    	// cmd > null > error.jsp 뷰단으로
    	// cmd > boardlist > list.jsp 뷰단으로
    	// cmd > boardwrite > wrtie.jsp 뷰단으로
    	if (cmd == null) {
    		viewpage = "/error/error.jsp";
    	} else if (cmd.equals("boardlist")) {
    		viewpage = "/board/boardlist.jsp";
    		// DB 연결
    		// select ...
    		// 실행 결과(rs) > 객체 담기
    		// boardDao dao = new boardDao();
    		// List<board> boardlist = dao.selectBoardList();
    		// request.setAttribute("list", BoardList);
    		// forward > view 전달: boardlist.jsp
    		// <c:set var="list" value=<%= request.getAttribute("list") %>>
    		// <c:forEach ... 
    	} else if (cmd.equals("boardwrite")) {
    		viewpage = "/board/boardwrite.jsp";
    	} else if (cmd.equals("login")) {
    		viewpage = "/WEB-INF/login/login.jsp"; // 실제 개발 코드(보안폴더)
    	} else {
    		viewpage = "/error/error.jsp";
    	}
    	
    	// 결과
    	// 가정해서: List<Emp> list = new ArrayList<>();
    	// list.add(new Emp(2000, "김유신"));
    	// request.setAttribute("emplist", list)
    	
    	// view 지정
    	RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    	
    	// view forward(데이터를 보낼거니까)
    	dis.forward(request, response);
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "Get");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "Post");
	}

}