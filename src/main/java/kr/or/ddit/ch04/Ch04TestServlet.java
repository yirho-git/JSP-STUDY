package kr.or.ddit.ch04;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// 등록 페이지 요청
@WebServlet("/send.do")
public class Ch04TestServlet extends HttpServlet {

	private int reqCnt;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/ch04/test/send.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String goPage = "";

		String type = request.getParameter("type");
		String number = request.getParameter("number");

		if (type == null || type.equals("")) {
			goPage = request.getContextPath() + "/send.do?err=1";
			response.sendRedirect(goPage);
		} else {

			if (type.equals("redirect")) {
				request.setAttribute("number", number);
				request.setAttribute("type", type);

				HttpSession session = request.getSession();
				session.setAttribute("number", number);
				session.setAttribute("type", type);
				goPage = request.getContextPath() + "/test/result.do";
				response.sendRedirect(goPage);
			} 
			else if (type.equals("forward") && (Integer.parseInt(number) < 5)) {
				request.setAttribute("number", number);
				request.setAttribute("type", type);
				request.setAttribute("reqCnt", reqCnt);

				request.getRequestDispatcher("/ch04/test/result.jsp").forward(request, response);

			}
		}

	}

}