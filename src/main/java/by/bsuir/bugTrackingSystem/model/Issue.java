package by.bsuir.bugTrackingSystem.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by tbegu_000 on 28.10.2016.
 */
@Entity
@Table(name = "ISSUE")
public class Issue {
    @Id
    @Column(name = "idIssue")
    private int idIssue;

    @Column(name = "idEmployee")
    private int idEmployee;

    @Column(name = "idProject")
    private int idProject;

    @Column(name = "summary")
    private String summary;

    @Column(name = "issueType")
    private String issueType;

    @Column(name = "priority")
    private String priority;

    @Column(name = "status")
    private String status;

    @Column(name = "description")

    private String description;

    @Column(name = "createdDate")
    private String createdDate;

    @Column(name = "severity")
    private String severity;

    @Column(name = "errorType")
    private String errorType;

    @Column(name = "assignee")
    private String assignee;

    public int getIdIssue() {
        return idIssue;
    }

    public void setIdIssue(int idIssue) {
        this.idIssue = idIssue;
    }

    public int getIdEmployee() {
        return idEmployee;
    }

    public void setIdEmployee(int idEmployee) {
        this.idEmployee = idEmployee;
    }

    public int getIdProject() {
        return idProject;
    }

    public void setIdProject(int idProject) {
        this.idProject = idProject;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getIssueType() {
        return issueType;
    }

    public void setIssueType(String issueType) {
        this.issueType = issueType;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getSeverity() {
        return severity;
    }

    public void setSeverity(String severity) {
        this.severity = severity;
    }

    public String getErrorType() {
        return errorType;
    }

    public void setErrorType(String errorType) {
        this.errorType = errorType;
    }

    public String getAssignee() {
        return assignee;
    }

    public void setAssignee(String assignee) {
        this.assignee = assignee;
    }

    @Override
    public String toString() {
        return "Issue{" +
                "idIssue=" + idIssue +
                ", idEmployee=" + idEmployee +
                ", idProject=" + idProject +
                ", summary='" + summary + '\'' +
                ", issueType='" + issueType + '\'' +
                ", priority='" + priority + '\'' +
                ", status='" + status + '\'' +
                ", description='" + description + '\'' +
                ", createdDate='" + createdDate + '\'' +
                ", severity='" + severity + '\'' +
                ", errorType='" + errorType + '\'' +
                ", assignee='" + assignee + '\'' +
                '}';
    }
}
