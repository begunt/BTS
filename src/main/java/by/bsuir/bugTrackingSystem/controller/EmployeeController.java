package by.bsuir.bugTrackingSystem.controller;

import by.bsuir.bugTrackingSystem.model.Employee;
import by.bsuir.bugTrackingSystem.service.EmployeeService;
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
@RequestMapping("/employeeController")
public class EmployeeController {
    private EmployeeService employeeService;

    @Autowired(required = true)
    @Qualifier(value = "employeeService")
    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @RequestMapping(value = "employees", method = RequestMethod.GET)
    public String listEmployees(Model model, HttpServletRequest request){
        String page = accessCheck(request, "employees");
        if (page != "accessdenied") {
            model.addAttribute("employee", new Employee());
            model.addAttribute("listEmployees", this.employeeService.listEmployees());
        }
        return page;
    }

    @RequestMapping(value = "managers", method = RequestMethod.GET)
    public String listManagers(Model model, HttpServletRequest request){
        String page = accessCheck(request, "employees");
        if (page != "accessdenied") {
            model.addAttribute("employee", new Employee());
            model.addAttribute("listEmployees", this.employeeService.listManagers());
        }
        return page;
    }

    @RequestMapping(value = "enginers", method = RequestMethod.GET)
    public String listEnginers(Model model, HttpServletRequest request){
        String page = accessCheck(request, "employees");
        if (page != "accessdenied") {
            model.addAttribute("employee", new Employee());
            model.addAttribute("listEmployees", this.employeeService.listEnginers());
        }
        return page;
    }

    @RequestMapping(value = "/employees/add", method = RequestMethod.POST)
    public String addEmployee(@ModelAttribute("employee") Employee employee, HttpServletRequest request){
        String pageManagers = accessCheck(request, "redirect:/employeeController/managers");
        String pageEnginers = accessCheck(request, "redirect:/employeeController/enginers");
        if (pageManagers != "accessdenied" || pageEnginers != "accessdenied") {
            if (employee.getIdEmployee() == 0)
                this.employeeService.addEmployee(employee);
            else this.employeeService.updateEmployee(employee);

            if(employee.getIdRole() == 1)
               return pageManagers;
            else return pageEnginers;
        }
        else return pageEnginers;
    }

    @RequestMapping("/remove/{id}")
    public String removeEmployee(@PathVariable("id") int id, HttpServletRequest request){
        String pageManagers = accessCheck(request, "redirect:/employeeController/managers");
        String pageEnginers = accessCheck(request, "redirect:/employeeController/enginers");
        if (pageManagers != "accessdenied" || pageEnginers != "accessdenied") {
            int idRole = this.employeeService.getEmployeeById(id).getIdRole();
            this.employeeService.removeEmployee(id);

            if (idRole == 1)
                return "redirect:/employeeController/managers";
            else return "redirect:/employeeController/enginers";
        }
        else return pageEnginers;
        //return "redirect:/employeeController/employees";
    }

    @RequestMapping("edit/{id}")
    public String editEmployee(@PathVariable("id") int id, Model model, HttpServletRequest request){
        String page = accessCheck(request, "employees");
        if (page != "accessdenied") {
            model.addAttribute("employee", this.employeeService.getEmployeeById(id));
            Employee employee = this.employeeService.getEmployeeById(id);
            if (employee.getIdRole() == 1)
                model.addAttribute("listEmployees", this.employeeService.listManagers());
            else model.addAttribute("listEmployees", this.employeeService.listEnginers());
        }
        return page;
    }

    @RequestMapping("employeedata/{id}")
    public String employeeData(@PathVariable("id") int id, Model model, HttpServletRequest request){
        String page = accessCheck(request, "employeedata");
        if (page != "accessdenied") {
            model.addAttribute("employee", this.employeeService.getEmployeeById(id));
        }
        return page;
    }

    @RequestMapping(value = "search", method = RequestMethod.GET)
    public String searchEmployee (Model model, HttpServletRequest request){
        model.addAttribute("employee", new Employee());
        model.addAttribute("listEmployees", this.employeeService.listEmployees());

        return accessCheck(request,"employeesearch");
    }

    @RequestMapping(value = "search", method = RequestMethod.POST)
    public String search (@ModelAttribute("employee") Employee employee, HttpServletRequest request, Model model){
        List<Employee> searchListEmployees = new ArrayList<Employee>();

        for(Employee employeeFromBD: this.employeeService.listEmployees()){
            int indexInStr = -1;

            if(employee.getFirstName() != null) {
                indexInStr = employeeFromBD.getFirstName().indexOf(employee.getFirstName());
                if (indexInStr != -1)
                    searchListEmployees.add(employeeFromBD);
            }

            if(employee.getLastName() != null) {
                indexInStr = -1;
                indexInStr = employeeFromBD.getLastName().indexOf(employee.getLastName());
                if (indexInStr != -1) {
                    searchListEmployees.add(employeeFromBD);
                }
            }

            if(employee.getLogin() != null) {
                indexInStr = -1;
                indexInStr = employeeFromBD.getLogin().indexOf(employee.getLogin());
                if (indexInStr != -1) {
                    searchListEmployees.add(employeeFromBD);
                }
            }

            if(employeeFromBD.getSalary() == employee.getSalary()) {
                searchListEmployees.add(employeeFromBD);
            }

            if(employeeFromBD.getIdEmployee() == employee.getIdEmployee()) {
                searchListEmployees.add(employeeFromBD);
            }
        }

        model.addAttribute("employee", new Employee());
        model.addAttribute("listEmployees", searchListEmployees);

        return accessCheck(request,"employeesearch");
    }

    @RequestMapping(value = "filter", method = RequestMethod.POST)
    public String filter (@ModelAttribute("employee") Employee employee, HttpServletRequest request, Model model){
        List <Employee> searchListEmployees = new ArrayList<Employee>();
        ObjectMapper oMapper = new ObjectMapper();
        // object -> Map
        Map<String, Object> mapEmployee = oMapper.convertValue(employee, Map.class);

        for(Employee employeeFromBD: this.employeeService.listEmployees()){
            boolean flag = true;
            Map<String, Object> mapEmployeeFromBD = oMapper.convertValue(employeeFromBD, Map.class);
            for (String key : mapEmployeeFromBD.keySet()) {
                if (mapEmployee.get(key) instanceof String)
                    if (!mapEmployee.get(key).equals("0") && !mapEmployee.get(key).equals(mapEmployeeFromBD.get(key))) {
                        flag = false;
                    }
                    else {
                        if (!mapEmployee.get(key).equals(mapEmployeeFromBD.get(key)) && !mapEmployee.get(key).equals(0)) {
                            flag = false;
                        }
                    }
            }
            if (flag)
                searchListEmployees.add(employeeFromBD);
        }

        model.addAttribute("employee", new Employee());
        model.addAttribute("listEmployees", searchListEmployees);

        return accessCheck(request,"employeesearch");
    }


    public String accessCheck(HttpServletRequest request, String page){
        HttpSession session = request.getSession();
        Employee employee = (Employee)session.getAttribute("employeeSession");
        if(employee.getFirstName()==null)
            return "accessdenied";
        else return page;
    }
}
