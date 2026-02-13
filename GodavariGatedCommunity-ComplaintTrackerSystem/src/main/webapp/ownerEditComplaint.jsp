<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="editServlet" method="post">
	<input type="hidden" name="complaintId" value="<%= request.getParameter("complaintId")%>">
		<label>
        <input type="radio" name="status" value="Pending" checked> Pending
    </label><br>
    <label>
        <input type="radio" name="status" value="In Progress"> In Progress
    </label><br>
    <label>
        <input type="radio" name="status" value="Resolved"> Resolved
    </label><br><br>

    <button type="submit">Submit</button>
	</form>
</body>
</html>