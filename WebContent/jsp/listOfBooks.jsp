<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
    <%@ page import="com.apress.bookweb.model.Book" %>
    <%@ page import="java.util.Iterator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/bookstore.css" type="text/css" />
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/bookstore.css">
<title>Insert title here</title>
</head>
<body> 
<jsp:include page="header.jsp" flush="true"/>
<jsp:include page="leftColumn.jsp" flush="true"/> 

<div class="tablesize">
  	<table class="table">
    <thead>
      <tr>
      	<th>Book Title</th>
      	<th>Publisher</th>
      </tr>
    </thead>
  
<%
List<Book> categoryList1 = (List<Book>) request.getAttribute("bookList");
Iterator<Book> iterator1 = categoryList1.iterator();
while(iterator1.hasNext()){
	Book book1 = (Book)iterator1.next();
	%>
	<tbody>
	<tr>
	<td><%=book1.getBookTitle()%></td>
	<td><%=book1.getPublisherName()%></td>
 <%}%>
 </tr>
  </tbody>
  </table>
</div>

	<script src="js/jQuery.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
</body>
</html>