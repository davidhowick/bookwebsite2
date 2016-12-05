<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
    <%@ page import="com.apress.bookweb.model.Book" %>
        <%@ page import="com.apress.bookweb.model.Author" %>
    <%@ page import="java.util.Iterator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
List<Book> book2 = (List<Book>) request.getAttribute("bookList2");
Iterator<Book> iterator1 = book2.iterator();
Author author1 = new Author();
while(iterator1.hasNext()){
	Book book = (Book)iterator1.next();
	%>
	<tbody>
	<tr>
	<td><%=book.getBookTitle()%></td>
	<td><%=book.getPublisherName()%></td>
 <%}%>
 </tr>
  </tbody>
  </table>
</div>

	<script src="js/jQuery.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery-1.9.1.js"></script>



</body>
</html>