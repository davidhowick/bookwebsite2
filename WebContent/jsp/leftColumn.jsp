<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
    <%@ page import="com.apress.bookweb.model.Category" %>
    <%@ page import="java.util.Iterator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/bookstore.css">
<title>Insert title here</title>
</head>
<body>

<div class="container">
  <div class="list-group">
  <a href="http://localhost:8080/bookWeb/books" class="list-group-item"><b>Home</b></a>
  <a href="#" class="list-group-item"><b>Categories</b></a>


<%
List<Category> categoryList1 = (List<Category>) application.getAttribute("categoryList");
Iterator<Category> iterator1 = categoryList1.iterator();
while(iterator1.hasNext()){
	Category category1 = (Category)iterator1.next();%>
	<%
	String value = getServletContext().getInitParameter("param1");
	%> 
	<a class="list-group-item" href="<%=value%>?action=category&categoryId=<%=category1.
	getId()%>&category=<%=category1.getCategoryDescription()%>"><%=category1.getCategoryDescription()%></a>
	<%}%>
	</ul></li>
		
	<%
	String value = getServletContext().getInitParameter("param1");
	%>	
	 <a href="<%=value%>?action=allBooks" class="list-group-item"><b>All books</b></a>
	</div>
	</div>
	
	<div class="searchtab">
	<form class="search">
	<input type="hidden" name="action" value="search" />
	<input id="text" type="text" name="keyWord" size="12" />
	<span class="tooltip_message">?</span>
	<p>
	<input id="submit" type="submit" value="Search" />
	</form>
	</div>
	
	<script src="js/jQuery.js" type="text/javascript"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
	
</body>
</html>