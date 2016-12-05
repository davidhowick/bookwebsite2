package com.apress.bookweb.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apress.bookweb.dao.BookDAO;
import com.apress.bookweb.dao.BookDAOImpl;
import com.apress.bookweb.model.Book;
import com.apress.bookweb.model.Category;


/**
 * Servlet implementation class BookController
 */
@WebServlet(name = "BookServlet", urlPatterns = { "/books" })
public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public BookController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("you are here");
		String base = "/jsp/";
		String url = base + "home.jsp";
		String action = request.getParameter("action");
		String category = request.getParameter("category");
		String keyWord = request.getParameter("keyWord");
		System.out.println(action + " caught variable");
		if(action != null){
			switch (action){
			case "allBooks":
				System.out.println("you are here 2");
				findAllBooks(request, response);
				url = base + "listOfBooks.jsp";
				break;
			case "category":
				findAllBooks(request, response);
				url = base + "category.jsp?category=" + category;
				break;
			case "search":
				System.out.println("you have made it to the search case");
				searchBooks(request, response, keyWord);
				System.out.println("keyword is: " + keyWord);
				url = base + "searchResult.jsp";
				break;
			}
		}
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);
		requestDispatcher.forward(request, response);
	}
	

	public void init(ServletConfig config) throws ServletException{
		super.init(config);
		BookDAO bookDao = new BookDAOImpl();
		//Calling DAO method to retrieve bookList from Database
		List<Category> categoryList = bookDao.findAllCategories();
		ServletContext context = config.getServletContext();
		context.setAttribute("categoryList", categoryList);
	}
	
	private void findAllBooks(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		try{
			System.out.print("You are in the findAllBooks Method");
			BookDAO bookDao= new BookDAOImpl();
			List<Book> bookList = bookDao.findAllBooks();
			System.out.println(bookList.toString());
			request.setAttribute("bookList", bookList);
		} catch(Exception e){
			System.out.println(e);
		}
	}
	
	private void searchBooks(HttpServletRequest request,
			HttpServletResponse response, String keyWord) throws ServletException, IOException{
		try{
			BookDAO bookDao = new BookDAOImpl();
			List<Book> bookList2 = bookDao.searchBooksByKeyword(keyWord);
			System.out.println(bookList2.toString());
			request.setAttribute("bookList2", bookList2);
		} catch (Exception e){
			System.out.println(e);
		}
	}


}
