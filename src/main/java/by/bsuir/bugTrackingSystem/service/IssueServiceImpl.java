package by.bsuir.bugTrackingSystem.service;

import by.bsuir.bugTrackingSystem.dao.IssueDao;
import by.bsuir.bugTrackingSystem.model.Issue;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by tbegu_000 on 30.10.2016.
 */

@Service
@Transactional
public class IssueServiceImpl implements IssueService {
    private IssueDao issueDao;

    public void setIssueDao(IssueDao issueDao) {
        this.issueDao = issueDao;
    }

    @Override
    public void addIssue(Issue issue) {
        this.issueDao.addIssue(issue);
    }

    @Override
    public void updateIssue(Issue issue) {
        this.issueDao.updateIssue(issue);
    }

    @Override
    public void removeIssue(int id) {
        this.issueDao.removeIssue(id);
    }

    @Override
    public Issue getIssueById(int id) {
        return this.issueDao.getIssueById(id);
    }

    @Override
    public List<Issue> listIssues() {
        return this.issueDao.listIssues();
    }
}
