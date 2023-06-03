package com.org.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.removeAttribute("orgobj");
		session.removeAttribute("donobj");
		session.removeAttribute("adobj");
		session.removeAttribute("orphanObj");

		HttpSession session2 = req.getSession();
		session.setAttribute("succMsg", "Logout Sucessfully");
		resp.sendRedirect("login.jsp");
	}

}
