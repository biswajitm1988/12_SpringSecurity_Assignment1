package com.fsd.spring.dao;

import com.fsd.spring.entity.Book;
import com.fsd.spring.entity.Subject;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.Collection;
import java.util.List;

@Repository
@Transactional
public class SubjectDao {

    @Autowired
    private SessionFactory sessionFactory;

    public Session getSession() {
        return sessionFactory.getCurrentSession();
    }

	public boolean addSubject(Subject newSubject) throws Exception {
        getSession().save(newSubject);
		return true;
	}

	public int getAllSubjectCount() throws Exception {
		Long subjectCount = 0l;
		subjectCount = (Long) getSession().createQuery("select count(s) from Subject s").uniqueResult();
		return subjectCount.intValue();
	}

	public List<Book> searchForSubjects(String subtitle) throws Exception {

		List<Book> bookList = getSession()
				.createQuery("select s.references from Subject s where lower(subtitle) like :subtitle")
				.setParameter("subtitle", "%" + subtitle + "%").getResultList();

		return bookList;
	}

	public int deleteSubject(String subtitle) throws Exception {
		int results = getSession().createQuery("delete Subject s where lower(subtitle) like :subtitle")
				.setParameter("subtitle", "%" + subtitle + "%").executeUpdate();
		return results;
	}

	public Collection<Subject> getAllSubjectss() {
		List<Subject> subjectList = getSession().createQuery("select s from Subject s", Subject.class).getResultList();
		return subjectList;
	}
}
