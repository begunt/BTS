package by.bsuir.bugTrackingSystem.dao;

import by.bsuir.bugTrackingSystem.model.Issue;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by tbegu_000 on 30.10.2016.
 */
@Repository
public class IssueDaoImpl implements IssueDao {

    private static final Logger logger = LoggerFactory.getLogger(IssueDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addIssue(Issue issue) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(issue);
        logger.info("Issue successfully saved. Issue details: " + issue);
    }

    @Override
    public void updateIssue(Issue issue) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(issue);
        logger.info("Issue successfully update. Issue details: " + issue);
    }

    @Override
    public void removeIssue(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Issue issue = (Issue) session.load(Issue.class, new Integer(id));

        if(issue!=null){
            session.delete(issue);
        }
        logger.info("Issue successfully removed. Issue details: " + issue);
    }

    @Override
    public Issue getIssueById(int id) {
        Session session =this.sessionFactory.getCurrentSession();
        Issue issue = (Issue) session.load(Issue.class, new Integer(id));
        logger.info("Issue successfully loaded. Issue details: " + issue);

        return issue;
    }

    @Override
    public List<Issue> listIssues() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Issue> issueList = session.createQuery("from Issue").list();

        for(Issue issue: issueList){
            logger.info("issue list: " + issue);
        }

        return issueList;
    }
}
