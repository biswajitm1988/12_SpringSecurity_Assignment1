package com.fsd.spring.dao;

import com.fsd.spring.entity.Book;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class BookDao {

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public boolean addBook(Book newBook) throws Exception {
		getSession().save(newBook);
		return true;
	}

	public List<Book> getAllBooks() throws Exception {
		List<Book> bookList = getSession().createQuery("SELECT b FROM Book b", Book.class).getResultList();
		return bookList;
	}

	public List<Book> searchForBooks(String bookTitle) throws Exception {
		List<Book> bookList = getSession().createQuery("select b from Book b where lower(title) like :bookTitle", Book.class)
				.setParameter("bookTitle", "%" + bookTitle + "%").getResultList();

		return bookList;
	}

	public int deleteBook(String bookTitle) throws Exception {

		int results = getSession().createQuery("delete from Book where lower(title) like :bookTitle")
				.setParameter("bookTitle", "%" + bookTitle + "%").executeUpdate();
		return results;
	}
}
