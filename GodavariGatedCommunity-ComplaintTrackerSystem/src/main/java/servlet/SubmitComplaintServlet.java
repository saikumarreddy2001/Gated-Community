package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Complaint;
import model.Resident;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import dao.ComplaintDAO;
import dao.ResidentDAO;

/**
 * Servlet implementation class SubmitComplaintServlet
 */
@WebServlet("/submitComplaintServlet")
public class SubmitComplaintServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("userId") == null) {
		    response.sendRedirect("index.jsp");
		    return;
		}

		String fullName = request.getParameter("fullName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String category = request.getParameter("category");
		String subject = request.getParameter("subject");
		String description = request.getParameter("description");
		ResidentDAO dao = new ResidentDAO();
		Resident resident = dao.getResident(email);
		if(resident != null) {
			int id = resident.getId();
			Complaint complaint = new Complaint();
			complaint.setUserId(id);
			complaint.setCategory(category);
			complaint.setSubject(subject);
			complaint.setDescription(description);
			complaint.setCreatedAt(Timestamp.valueOf(LocalDateTime.now()));
			ComplaintDAO Cdao = new ComplaintDAO();
			Cdao.saveComplaint(complaint);
			request.getRequestDispatcher("userdashboard.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("submitComplaint.jsp").forward(request, response);
		}
	}

}
