package by.bsuir.bugTrackingSystem.controller;

import by.bsuir.bugTrackingSystem.model.Employee;
import by.bsuir.bugTrackingSystem.model.Issue;
import by.bsuir.bugTrackingSystem.model.Project;
import by.bsuir.bugTrackingSystem.service.EmployeeService;
import by.bsuir.bugTrackingSystem.service.IssueService;
import by.bsuir.bugTrackingSystem.service.ProjectService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by tbegu_000 on 30.10.2016.
 */
@Controller
@RequestMapping("/issueController")
public class IssueController {
    private IssueService issueService;
    private ProjectService projectService;
    private EmployeeService employeeService;

    @Autowired(required = true)
    @Qualifier(value = "issueService")
    public void setIssueService(IssueService issueService) {
        this.issueService = issueService;
    }

    @Autowired(required = true)
    @Qualifier(value = "projectService")
    public void setProjectService(ProjectService projectService) {
        this.projectService = projectService;
    }

    @Autowired(required = true)
    @Qualifier(value = "employeeService")
    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @RequestMapping(value = "issues", method = RequestMethod.GET)
    public String listIssues(Model model, HttpServletRequest request){
        model.addAttribute("issue", new Issue());
        model.addAttribute("listIssues", this.issueService.listIssues());
        model.addAttribute("project", new Project());
        model.addAttribute("listProjects", this.projectService.listProjects());
        model.addAttribute("listEmployees", this.employeeService.listEmployees());

        return accessCheck(request,"issues");
    }

    @RequestMapping(value = "/issues/add", method = RequestMethod.POST)
    public String addIssue(@ModelAttribute("issue") Issue issue, HttpServletRequest request){
        String page = accessCheck(request,"redirect:/issueController/issues");
        if(page == "redirect:/issueController/issues") {
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date today = Calendar.getInstance().getTime();
            String reportDate = df.format(today);
            issue.setCreatedDate(reportDate);

            if (issue.getIdIssue() == 0) {
                issue.setStatus("Opened");
                this.issueService.addIssue(issue);
            } else {
                this.issueService.updateIssue(issue);
            }
        }
        return page;
    }

    @RequestMapping("/remove/{id}")
    public String removeIssue(@PathVariable("id") int id, HttpServletRequest request){
        String page = accessCheck(request,"redirect:/issueController/issues");
        if(page == "redirect:/issueController/issues")
            this.issueService.removeIssue(id);

        return page;
    }

    @RequestMapping("edit/{id}")
    public String editIssue(@PathVariable("id") int id, Model model, HttpServletRequest request){
        String page = accessCheck(request,"issues");
        if(page == "issues") {
            model.addAttribute("issue", this.issueService.getIssueById(id));
            model.addAttribute("listIssues", this.issueService.listIssues());
            model.addAttribute("project", new Project());
            model.addAttribute("listProjects", this.projectService.listProjects());
        }

        return page;
    }

    @RequestMapping("issuedata/{id}")
    public String issueData(@PathVariable("id") int id, Model model, HttpServletRequest request){
        model.addAttribute("listProjects", this.projectService.listProjects());
        model.addAttribute("listEmployees", this.employeeService.listEmployees());
        model.addAttribute("issue", this.issueService.getIssueById(id));

        return accessCheck(request,"issuedata");
    }

    public String accessCheck(HttpServletRequest request, String page){
        HttpSession session = request.getSession();
        Employee employee = (Employee)session.getAttribute("employeeSession");
        if(employee.getFirstName()==null)
            return "accessdenied";
        else return page;
    }

    @RequestMapping(value = "search", method = RequestMethod.GET)
    public String searchIssue (Model model, HttpServletRequest request){
        model.addAttribute("issue", new Issue());
        model.addAttribute("listIssues", this.issueService.listIssues());
        model.addAttribute("project", new Project());
        model.addAttribute("listProjects", this.projectService.listProjects());
        model.addAttribute("listEmployees", this.employeeService.listEmployees());

        return accessCheck(request,"issuesearch");
    }
    @RequestMapping(value = "search", method = RequestMethod.POST)
    public String search (@ModelAttribute("issue") Issue issue, HttpServletRequest request, Model model){
        List <Issue> searchListIssues = new ArrayList<Issue>();

        for(Issue issueFromBD: this.issueService.listIssues()){
            int indexInStr = -1;
            if(issue.getSummary() != null) {
                indexInStr = issueFromBD.getSummary().indexOf(issue.getSummary());
                if (indexInStr != -1)
                    searchListIssues.add(issueFromBD);
            }

            if(issue.getDescription() != null) {
                indexInStr = -1;
                indexInStr = issueFromBD.getDescription().indexOf(issue.getDescription());
                if (indexInStr != -1) {/*
                    Issue issueTemp = new Issue();
                    if(searchListIssues.size() != 0) {
                        issueTemp = searchListIssues.get(searchListIssues.size() - 1);
                        if (issueTemp.getIdIssue() != issueFromBD.getIdIssue())*/
                            searchListIssues.add(issueFromBD);
                   /* }
                    else searchListIssues.add(issueFromBD);*/
                }
            }

            if(issueFromBD.getIdIssue() == issue.getIdIssue()) {
                /*Issue issueTemp = new Issue();
                if(searchListIssues.size() != 0) {
                    issueTemp = searchListIssues.get(searchListIssues.size() - 1);
                    if (issueTemp.getIdIssue() != issueFromBD.getIdIssue())*/
                        searchListIssues.add(issueFromBD);
               /* }
                else searchListIssues.add(issueFromBD);*/
            }

            if(issue.getCreatedDate() != null) {
                indexInStr = -1;
                indexInStr = issueFromBD.getCreatedDate().indexOf(issue.getCreatedDate());
                if (indexInStr != -1) {
                    /*Issue issueTemp;
                    if(searchListIssues.size() != 0) {
                        issueTemp = searchListIssues.get(searchListIssues.size() - 1);
                        if (issueTemp.getIdIssue() != issueFromBD.getIdIssue())*/
                            searchListIssues.add(issueFromBD);
                    /*}
                    else searchListIssues.add(issueFromBD);*/
                }
            }
        }

        model.addAttribute("issue", new Issue());
        model.addAttribute("listIssues", searchListIssues);
        model.addAttribute("project", new Project());
        model.addAttribute("listProjects", this.projectService.listProjects());
        model.addAttribute("listEmployees", this.employeeService.listEmployees());

        return accessCheck(request,"issuesearch");
    }

    @RequestMapping(value = "filter", method = RequestMethod.POST)
    public String filter (@ModelAttribute("issue") Issue issue, HttpServletRequest request, Model model){
        List <Issue> searchListIssues = new ArrayList<Issue>();
        ObjectMapper oMapper = new ObjectMapper();
        // object -> Map
        Map<String, Object> mapIssue = oMapper.convertValue(issue, Map.class);

        for(Issue issueFromBD: this.issueService.listIssues()){
            boolean flag = true;
            Map<String, Object> mapIssueFromBD = oMapper.convertValue(issueFromBD, Map.class);
            for (String key : mapIssueFromBD.keySet()) {
                if (mapIssue.get(key) instanceof String)
                    if (!mapIssue.get(key).equals("0") && !mapIssue.get(key).equals(mapIssueFromBD.get(key))) {
                        flag = false;
                    }
                    else {
                        if (!mapIssue.get(key).equals(mapIssueFromBD.get(key)) && !mapIssue.get(key).equals(0)) {
                            flag = false;
                        }
                    }
            }
            if (flag)
                searchListIssues.add(issueFromBD);
        }

        model.addAttribute("issue", new Issue());
        model.addAttribute("listIssues", searchListIssues);
        model.addAttribute("project", new Project());
        model.addAttribute("listProjects", this.projectService.listProjects());
        model.addAttribute("listEmployees", this.employeeService.listEmployees());

        return accessCheck(request,"issuesearch");
    }

    @RequestMapping(value = "statistics", method = RequestMethod.GET)
    public String statistic(Model model, HttpServletRequest request){
        model.addAttribute("statisticByType", statisticByType());
        model.addAttribute("statisticByErrorType", statisticByErrorType());
        model.addAttribute("statisticByMonth", statisticByMonth());
        model.addAttribute("statisticByStatus", statisticByStatus());
        model.addAttribute("statisticByAssignee", statisticByAssignee());
        return accessCheck(request,"issuestatistics");
    }

    public  Map<String, Double> statisticByType(){
        Map<String, Double> result = new HashMap<>();
        result.put("Defect", 0.0);
        result.put("Story", 0.0);
        result.put("Task", 0.0);
        result.put("Improvement", 0.0);
        int countOfIssues=0;

        for(Issue issue: this.issueService.listIssues()){
            String str = issue.getIssueType();
            countOfIssues++;
            if(str.equals("Defect")){
                result.put("Defect", result.get("Defect")+1);
            }
            else if(str.equals("Story")){
                result.put("Story", result.get("Story")+1);
            }
            else if(str.equals("Improvement")){
                result.put("Improvement", result.get("Improvement")+1);
            }
            else if(str.equals("Task")){
                result.put("Task", result.get("Task")+1);
            }
        }

        result.put("Defect", result.get("Defect") * 100 / countOfIssues);
        result.put("Story", result.get("Story") * 100 / countOfIssues);
        result.put("Task", result.get("Task") * 100 / countOfIssues);
        result.put("Improvement", result.get("Improvement") * 100 / countOfIssues);

        return result;
    }
    public  Map<String, Double> statisticByErrorType(){
        Map<String, Double> result = new HashMap<>();
        result.put("Functional", 0.0);
        result.put("Requirement", 0.0);
        result.put("GUI", 0.0);
        result.put("Performance", 0.0);
        result.put("Security", 0.0);
        int countOfIssues=0;

        for(Issue issue: this.issueService.listIssues()){
            String str = issue.getErrorType();
            countOfIssues++;
            if(str.equals("Functional")){
                result.put("Functional", result.get("Functional")+1);
            }
            else if(str.equals("Requirement")){
                result.put("Requirement", result.get("Requirement")+1);
            }
            else if(str.equals("GUI")){
                result.put("GUI", result.get("GUI")+1);
            }
            else if(str.equals("Performance")){
                result.put("Performance", result.get("Performance")+1);
            }
            else if(str.equals("Security")){
                result.put("Security", result.get("Security")+1);
            }
        }

        result.put("Functional",result.get("Functional")*100/countOfIssues);
        result.put("Requirement",result.get("Requirement")*100/countOfIssues);
        result.put("GUI",result.get("GUI")*100/countOfIssues);
        result.put("Performance", result.get("Performance") * 100 / countOfIssues);
        result.put("Security", result.get("Security") * 100 / countOfIssues);

        return result;
    }
    public  Map<String, Double> statisticByMonth(){
        Map<String, Double> result = new HashMap<>();
        int countOfIssues=0;

        for(int i=1; i<=12; i++)
            if(i<10)
                result.put("0"+i+"", 0.0);
            else result.put(i+"", 0.0);

        for(Issue issue: this.issueService.listIssues()){
            String reportDate = issue.getCreatedDate();
            String str[] = reportDate.split("-");

            countOfIssues++;
            for(int i=1; i<=12; i++) {
                if (i < 10) {
                    if (str[1].equals("0" + i + "")) {
                        result.put("0" + i + "", result.get("0" + i + "") + 1);
                    }
                } else if (str[1].equals(i + "")) {
                    result.put(i + "", result.get(i + "") + 1);
                }
            }
        }
        return result;
    }
    public  Map<String, Double> statisticByStatus(){
        Map<String, Double> result = new HashMap<>();
        result.put("Opened", 0.0);
        result.put("In progress", 0.0);
        result.put("Resolved", 0.0);
        result.put("Closed", 0.0);
        result.put("TBR", 0.0);
        result.put("Postponed", 0.0);
        result.put("Reopened", 0.0);
        int countOfIssues=0;

        for(Issue issue: this.issueService.listIssues()){
            String str = issue.getStatus();
            countOfIssues++;
            if(str.equals("Opened")){
                result.put("Opened", result.get("Opened")+1);
            }
            else if(str.equals("In progress")){
                result.put("In progress", result.get("In progress")+1);
            }
            else if(str.equals("Resolved")){
                result.put("Resolved", result.get("Resolved")+1);
            }
            else if(str.equals("Closed")){
                result.put("Closed", result.get("Closed")+1);
            }
            else if(str.equals("TBR")){
                result.put("TBR", result.get("TBR")+1);
            }
            else if(str.equals("Postponed")){
                result.put("Postponed", result.get("Postponed")+1);
            }
            else if(str.equals("Reopened")){
                result.put("Reopened", result.get("Reopened")+1);
            }
        }

        result.put("Opened",result.get("Opened")*100/countOfIssues);
        result.put("In progress",result.get("In progress")*100/countOfIssues);
        result.put("Resolved",result.get("Resolved")*100/countOfIssues);
        result.put("Closed",result.get("Closed")*100/countOfIssues);
        result.put("TBR",result.get("TBR")*100/countOfIssues);
        result.put("Postponed", result.get("Postponed") * 100 / countOfIssues);
        result.put("Reopened", result.get("Reopened") * 100 / countOfIssues);

        return result;
    }
    public  Map<String, Double> statisticByAssignee(){
        Map<String, Double> result = new HashMap<>();
        result.put("Developer", 0.0);
        result.put("QA", 0.0);
        result.put("Backlog", 0.0);
        result.put("Other", 0.0);
        int countOfIssues=0;

        for(Issue issue: this.issueService.listIssues()){
            String str = issue.getAssignee();
            countOfIssues++;
            if(str.equals("Developer")){
                result.put("Developer", result.get("Developer")+1);
            }
            else if(str.equals("QA")){
                result.put("QA", result.get("QA")+1);
            }
            else if(str.equals("Backlog")){
                result.put("Backlog", result.get("Backlog")+1);
            }
            else if(str.equals("Other")){
                result.put("Other", result.get("Other")+1);
            }
        }

        result.put("Developer",result.get("Developer")*100/countOfIssues);
        result.put("QA",result.get("QA")*100/countOfIssues);
        result.put("Backlog",result.get("Backlog")*100/countOfIssues);
        result.put("Other", result.get("Other") * 100 / countOfIssues);

        return result;
    }
}
