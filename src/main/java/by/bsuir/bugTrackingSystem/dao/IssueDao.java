package by.bsuir.bugTrackingSystem.dao;

import by.bsuir.bugTrackingSystem.model.Issue;

import java.util.List;

/**
 * Created by tbegu_000 on 30.10.2016.
 */
public interface IssueDao {
    public void addIssue(Issue issue);

    public void updateIssue(Issue issue);

    public void removeIssue(int id);

    public Issue getIssueById(int id);

    public List<Issue> listIssues();
}
