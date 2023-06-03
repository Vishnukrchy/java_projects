package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DonateDAO;
import com.dao.PatientDAOImpl;
import com.db.DBConnect;
import com.entity.Patient;

@WebServlet("/donate_status")
public class DonateStatus extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int id = Integer.parseInt(req.getParameter("id"));
			String ty = req.getParameter("ty");
			int pid = Integer.parseInt(req.getParameter("pid"));
			Double amount=Double.parseDouble(req.getParameter("amt"));
			
			DonateDAO dao = new DonateDAO(DBConnect.getConn());
			PatientDAOImpl dao2 = new PatientDAOImpl(DBConnect.getConn());
			Patient p=dao2.getPatientById(pid);
			Double totalamt=p.getRaiseMoney()+amount;
			HttpSession session = req.getSession();
			boolean f;
			if ("ap".equals(ty)) {
				f = dao.updatePayment("Approved", id);
				if (f) {
					dao2.updateAmount(totalamt, pid);
					session.setAttribute("succMsg", "Approved Sucessfully");
					resp.sendRedirect("admin/donor.jsp");
				} else {
					session.setAttribute("failedMsg", "Something wrong on server");
					resp.sendRedirect("admin/donor.jsp");
				}
			} else {
				f = dao.updatePayment("Reject", id);
				if (f) {
					session.setAttribute("failedMsg", "Reject Sucessfully");
					resp.sendRedirect("admin/donor.jsp");
				} else {
					session.setAttribute("failedMsg", "Something wrong on server");
					resp.sendRedirect("admin/donor.jsp");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
