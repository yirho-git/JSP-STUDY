package kr.or.ddit.ch04;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

// 등록 페이지 요청
@WebServlet("/send.do")
public class Ch04TestServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("reqCnt");
		session.removeAttribute("sesCnt");
		request.getRequestDispatcher("/ch04/test/send.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String goPage = "";
		String type = request.getParameter("type");
		String number = request.getParameter("number");
		HttpSession session = request.getSession();

		if (type == null || type.equals("")) {
			goPage = request.getContextPath() + "/send.do?err=1";
			response.sendRedirect(goPage);

		} else if ("redirect".equals(type)) {
			Integer sesCnt = (Integer) session.getAttribute("sesCnt");
			if (sesCnt == null) {
				sesCnt = 0;
			}
			sesCnt++;
			session.setAttribute("number", number);
			session.setAttribute("type", type);
			session.setAttribute("sesCnt", sesCnt);
			goPage = request.getContextPath() + "/test/result.do";

			if (sesCnt < Integer.parseInt(number)) {
				response.sendRedirect(goPage);
				return;
			}

			request.setAttribute("type", "redirect");
			request.getRequestDispatcher("/ch04/test/result.jsp").forward(request, response);

		} else if ("forward".equals(type)) {
			if (Integer.parseInt(number) > 4) {
				goPage = request.getContextPath() + "/send.do?err=2";
				response.sendRedirect(goPage);

			} else {
				Integer reqCnt = (Integer) session.getAttribute("reqCnt");
				if (reqCnt == null) {
					reqCnt = 0;
				}
				reqCnt++;

				session.setAttribute("reqCnt", reqCnt);
				request.setAttribute("reqCnt", reqCnt);

				request.setAttribute("number", number);
				request.setAttribute("type", type);
				request.getRequestDispatcher("/ch04/test/result.jsp").forward(request, response);
			}
		}
	}
}
