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
	<table border="1">
    <thead>
        <tr>
            <th>Complaint Id</th>
            <th>User Id</th>
            <th>Category</th>
            <th>Subject</th>
            <th>Description</th>
            <th>Created At</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
    <%
  List<Complaint> list = (List<Complaint>) request.getAttribute("list");
  if(list != null){
      for(Complaint complaint : list){
%>
        <tr>
            <td><%=complaint.getComplaintId() %></td>
            <td><%=complaint.getUserId() %></td>
            <td><%=complaint.getCategory() %></td>
            <td><%=complaint.getSubject() %></td>
            <td><%=complaint.getDescription() %></td>
            <td><%=complaint.getCreatedAt() %></td>
            <td><%=complaint.getStatus() %>  <a href="ownerEditComplaint.jsp?complaintId=<%=complaint.getComplaintId()%>">Edit</a></td>
        </tr>
<%
      }
  } else {
%>
        <tr><td colspan="7">No complaints to show.</td></tr>
<%
  }
%>

    </tbody>
</table>
</body>
</html>