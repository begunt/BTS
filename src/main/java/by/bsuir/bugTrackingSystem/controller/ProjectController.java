package by.bsuir.bugTrackingSystem.controller;

import by.bsuir.bugTrackingSystem.model.Employee;
import by.bsuir.bugTrackingSystem.model.Project;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


/**
 * Created by tbegu_000 on 05.11.2016.
 */
@Controller
@RequestMapping ("/projectController")
public class ProjectController {
    private ProjectService projectService;

    @Autowired(required = true)
    @Qualifier(value = "projectService")
    public void setProjectService(ProjectService projectService) {
        this.projectService = projectService;
    }

    @RequestMapping(value = "projects", method = RequestMethod.GET)
    public String listProjects(Model model, HttpServletRequest request){
        String page = accessCheck(request, "projects");
        if (page != "accessdenied") {
            model.addAttribute("project", new Project());
            model.addAttribute("listProjects", this.projectService.listProjects());
        }
        return page;
    }

    @RequestMapping(value = "/projects/add", method = RequestMethod.POST)
    public String addProject(@ModelAttribute("project") Project project, HttpServletRequest request){
        String page = accessCheck(request, "redirect:/projectController/projects");
        if (page != "accessdenied") {
            if (project.getIdProject() == 0) {
                this.projectService.addProject(project);
            } else {
                this.projectService.updateProject(project);
            }
        }
        return page;
    }

    @RequestMapping("/remove/{id}")
    public String removeProject(@PathVariable("id") int id, HttpServletRequest request){
        String page = accessCheck(request, "redirect:/projectController/projects");
        if (page != "accessdenied") {
            this.projectService.removeProject(id);
        }
        return page;
    }

    @RequestMapping("edit/{id}")
    public String editProject(@PathVariable("id") int id, Model model, HttpServletRequest request){
        String page = accessCheck(request, "projects");
        if (page != "accessdenied") {
            model.addAttribute("project", this.projectService.getProjectById(id));
            model.addAttribute("listProjects", this.projectService.listProjects());
        }
        return page;
    }

    @RequestMapping("projectdata/{id}")
    public String projectData(@PathVariable("id") int id, Model model, HttpServletRequest request){
        String page = accessCheck(request, "projectdata");
        if (page != "accessdenied") {
            model.addAttribute("project", this.projectService.getProjectById(id));
        }
        return page;
    }

    @RequestMapping(value = "search", method = RequestMethod.GET)
    public String searchProject (Model model, HttpServletRequest request){
        model.addAttribute("project", new Project());
        model.addAttribute("listProjects", this.projectService.listProjects());

        return accessCheck(request,"projectsearch");
    }

    @RequestMapping(value = "search", method = RequestMethod.POST)
    public String search (@ModelAttribute("project") Project project, HttpServletRequest request, Model model){
        List<Project> searchListProjects = new ArrayList<Project>();

        for(Project projectFromBD: this.projectService.listProjects()){
            int indexInStr = -1;

            if(project.getName() != null) {
                indexInStr = projectFromBD.getName().indexOf(project.getName());
                if (indexInStr != -1)
                    searchListProjects.add(projectFromBD);
            }

            if(project.getDescription() != null) {
                indexInStr = projectFromBD.getDescription().indexOf(project.getDescription());
                if (indexInStr != -1)
                    searchListProjects.add(projectFromBD);
            }

            if(projectFromBD.getIdProject() == project.getIdProject()) {
                searchListProjects.add(projectFromBD);
            }
        }

        model.addAttribute("project", new Project());
        model.addAttribute("listProjects", searchListProjects);

        return accessCheck(request,"projectsearch");
    }

    @RequestMapping(value = "filter", method = RequestMethod.POST)
    public String filter (@ModelAttribute("project") Project project, HttpServletRequest request, Model model){
        List <Project> searchListProjects = new ArrayList<Project>();
        ObjectMapper oMapper = new ObjectMapper();
        // object -> Map
        Map<String, Object> mapProject = oMapper.convertValue(project, Map.class);

        for(Project projectFromBD: this.projectService.listProjects()){
            boolean flag = true;
            Map<String, Object> mapProjectFromBD = oMapper.convertValue(projectFromBD, Map.class);
            for (String key : mapProjectFromBD.keySet()) {
                if (mapProject.get(key) instanceof String)
                    if (!mapProject.get(key).equals("0") && !mapProject.get(key).equals(mapProjectFromBD.get(key))) {
                        flag = false;
                    }
                    else {
                        if (!mapProject.get(key).equals(mapProjectFromBD.get(key)) && !mapProject.get(key).equals(0)) {
                            flag = false;
                        }
                    }
            }
            if (flag)
                searchListProjects.add(projectFromBD);
        }

        model.addAttribute("project", new Project());
        model.addAttribute("listProjects", searchListProjects);

        return accessCheck(request,"projectsearch");
    }

    public String accessCheck(HttpServletRequest request, String page){
        HttpSession session = request.getSession();
        Employee employee = (Employee)session.getAttribute("employeeSession");
        if(employee.getFirstName()==null)
            return "accessdenied";
        else return page;
    }
}
