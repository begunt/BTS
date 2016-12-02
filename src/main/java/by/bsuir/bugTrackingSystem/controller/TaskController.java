package by.bsuir.bugTrackingSystem.controller;

import by.bsuir.bugTrackingSystem.model.Employee;
import by.bsuir.bugTrackingSystem.model.Project;
import by.bsuir.bugTrackingSystem.model.Task;
import by.bsuir.bugTrackingSystem.service.ProjectService;
import by.bsuir.bugTrackingSystem.service.TaskService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by tbegu_000 on 06.11.2016.
 */
@Controller
@RequestMapping("/taskController")
public class TaskController {
    private TaskService taskService;
    private ProjectService projectService;

    @Autowired(required = true)
    @Qualifier(value = "taskService")
    public void setTaskService(TaskService taskService) {
        this.taskService = taskService;
    }

    @Autowired(required = true)
    @Qualifier(value = "projectService")
    public void setProjectService(ProjectService projectService) {
        this.projectService = projectService;
    }


    @RequestMapping(value = "tasks", method = RequestMethod.GET)
    public String listTasks(Model model, HttpServletRequest request){
        String page = accessCheck(request, "tasks");
        if (page != "accessdenied") {
            model.addAttribute("task", new Task());
            model.addAttribute("listTasks", this.taskService.listTasks());
            model.addAttribute("project", new Project());
            model.addAttribute("listProjects", this.projectService.listProjects());
        }
        return page;
    }

    @RequestMapping(value = "/tasks/add", method = RequestMethod.POST)
    public String addTask(@ModelAttribute("task") Task task, HttpServletRequest request){
        String page = accessCheck(request, "redirect:/taskController/tasks");
        if (page != "accessdenied") {
            if (task.getIdTask() == 0) {
                this.taskService.addTask(task);
            } else {
                this.taskService.updateTask(task);
            }
        }

        return page;
    }

    @RequestMapping("/remove/{id}")
    public String removeTask(@PathVariable("id") int id, HttpServletRequest request){
        String page = accessCheck(request, "redirect:/taskController/tasks");
        if (page != "accessdenied") {
            this.taskService.removeTask(id);
        }
        return page;
    }

    @RequestMapping("edit/{id}")
    public String editTask(@PathVariable("id") int id, Model model, HttpServletRequest request){
        String page = accessCheck(request, "tasks");
        if (page != "accessdenied") {
            model.addAttribute("task", this.taskService.getTaskById(id));
            model.addAttribute("listTasks", this.taskService.listTasks());
            model.addAttribute("project", new Project());
            model.addAttribute("listProjects", this.projectService.listProjects());
        }
        return page;
    }

    @RequestMapping("taskdata/{id}")
    public String taskData(@PathVariable("id") int id, Model model, HttpServletRequest request){
        String page = accessCheck(request, "taskdata");
        if (page != "accessdenied") {
            model.addAttribute("task", this.taskService.getTaskById(id));
            model.addAttribute("project", new Project());
            model.addAttribute("listProjects", this.projectService.listProjects());
        }
        return page;
    }


    @RequestMapping(value = "search", method = RequestMethod.GET)
    public String searchTask (Model model, HttpServletRequest request){
        model.addAttribute("project", new Project());
        model.addAttribute("listProjects", this.projectService.listProjects());
        model.addAttribute("task", new Task());
        model.addAttribute("listTasks", this.taskService.listTasks());

        return accessCheck(request,"tasksearch");
    }

    @RequestMapping(value = "search", method = RequestMethod.POST)
    public String search (@ModelAttribute("task") Task task, HttpServletRequest request, Model model){
        List<Task> searchListTasks = new ArrayList<Task>();

        for(Task taskFromBD: this.taskService.listTasks()){
            int indexInStr = -1;

            if(task.getName() != null) {
                indexInStr = taskFromBD.getName().indexOf(task.getName());
                if (indexInStr != -1)
                    searchListTasks.add(taskFromBD);
            }

            if(task.getDescription() != null) {
                indexInStr = taskFromBD.getDescription().indexOf(task.getDescription());
                if (indexInStr != -1)
                    searchListTasks.add(taskFromBD);
            }

            if(taskFromBD.getIdTask() == task.getIdTask()) {
                searchListTasks.add(taskFromBD);
            }
        }

        model.addAttribute("project", new Project());
        model.addAttribute("listProjects", this.projectService.listProjects());
        model.addAttribute("task", new Task());
        model.addAttribute("listTasks", searchListTasks);

        return accessCheck(request,"tasksearch");
    }

    @RequestMapping(value = "filter", method = RequestMethod.POST)
    public String filter (@ModelAttribute("task") Task task, HttpServletRequest request, Model model){
        List <Task> searchListTasks = new ArrayList<Task>();
        ObjectMapper oMapper = new ObjectMapper();
        // object -> Map
        Map<String, Object> mapTask = oMapper.convertValue(task, Map.class);

        for(Task taskFromBD: this.taskService.listTasks()){
            boolean flag = true;
            Map<String, Object> mapProjectFromBD = oMapper.convertValue(taskFromBD, Map.class);
            for (String key : mapProjectFromBD.keySet()) {
                if (mapTask.get(key) instanceof String)
                    if (!mapTask.get(key).equals("0") && !mapTask.get(key).equals(mapProjectFromBD.get(key))) {
                        flag = false;
                    }
                    else {
                        if (!mapTask.get(key).equals(mapProjectFromBD.get(key)) && !mapTask.get(key).equals(0)) {
                            flag = false;
                        }
                    }
            }
            if (flag)
                searchListTasks.add(taskFromBD);
        }

        model.addAttribute("project", new Project());
        model.addAttribute("listProjects", this.projectService.listProjects());
        model.addAttribute("task", new Task());
        model.addAttribute("listTasks", searchListTasks);

        return accessCheck(request,"tasksearch");
    }


    public String accessCheck(HttpServletRequest request, String page){
        HttpSession session = request.getSession();
        Employee employee = (Employee)session.getAttribute("employeeSession");
        if(employee.getFirstName()==null)
            return "accessdenied";
        else return page;
    }
}
