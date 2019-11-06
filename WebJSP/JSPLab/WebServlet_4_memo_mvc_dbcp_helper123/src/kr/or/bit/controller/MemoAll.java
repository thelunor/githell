package kr.or.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.memodao;
import kr.or.bit.dto.memo;

@WebServlet("/MemoAll")
public class MemoAll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemoAll() {
		super();

	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cmd = request.getParameter("cmd");

		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String memo = request.getParameter("memo");
		// out.print(id + "," + email + "," + memo);

		response.setContentType("text/html;charset=UTF-8"); // 클라언트에게 전달한 페이지의 정보 구성
		PrintWriter out = response.getWriter();

		if (cmd.equals("idck")) {
			System.out.println("id : " + id);
			memodao dao = new memodao();
			String ischeck = dao.isCheckById(id);

			out.print(ischeck);

		} else if (cmd.equals("memolist")) {
			try {
				// 요청 판단은 필요없다
				// 전체 데이터 조회 처리
				memodao dao = new memodao();
				ArrayList<memo> memolist = dao.getMemoList();

				// 요청 결과 저장
				request.setAttribute("memolist", memolist);

				// view 페이지 설정
				RequestDispatcher dis = request.getRequestDispatcher("/memolist.jsp");
				dis.forward(request, response);

			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else if (cmd.equals("submit")) {
			try {
				memodao dao = new memodao(); // POINT
				int n = dao.insertMemo(id, email, memo);
				System.out.println("n:" + n);
				if (n > 0) {
					out.print("<script>");
					out.print("alert('등록성공..');");
					out.print("location.href='MemoAll?cmd=memolist';");
					out.print("</script>");
				} else { // insert 에서 현실적으로 경우 ...
					out.print("<script>");
					out.print("alert('등록실패..');");
					out.print("location.href='memo.html';");
					out.print("</script>");
				}

			} catch (Exception e) {
				out.print("<b> 오류 :" + e.getMessage() + "</b>");
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
