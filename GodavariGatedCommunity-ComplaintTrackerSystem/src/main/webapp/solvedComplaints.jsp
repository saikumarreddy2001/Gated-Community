<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="dao.ComplaintDAO" %>
<%@ page import="model.Complaint" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>Welcome <%=session.getAttribute("username") %></h2>
	<table border="1">
    <thead>
        <tr>
            <th>Complaint Id</th>
            <th>User Id</th>
            <th>Category</th>
            <th>Subject</th>
            <th>Description</th>
            <th>Status</th>
            <th>Created At</th>
        </tr>
    </thead>
    <tbody>
    <%
            List<Complaint> list = (List<Complaint>) request.getAttribute("list");
            if (list != null && !list.isEmpty()) {
                for (Complaint complaint : list) {
        %>
                    <tr>
                        <td><%= complaint.getComplaintId() %></td>
                        <td><%= complaint.getUserId() %></td>
                        <td><%= complaint.getCategory() %></td>
                        <td><%= complaint.getSubject() %></td>
                        <td><%= complaint.getDescription() %></td>
                        <td><%= complaint.getStatus() %></td>
                        <td><%= complaint.getCreatedAt() %></td>
                    </tr>
        <%
                }
            } else {
        %>
                <tr>
                    <td colspan="7">No complaints found.</td>
                </tr>
        <%
            }
        %>
    </tbody>
</table>
</body>
</html>