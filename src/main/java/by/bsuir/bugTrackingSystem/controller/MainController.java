package by.bsuir.bugTrackingSystem.controller;

import by.bsuir.bugTrackingSystem.model.Employee;
import by.bsuir.bugTrackingSystem.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by tbegu_000 on 06.11.2016.
 */
@Controller
@SessionAttributes("employeeSession")
public class MainController {
    private EmployeeService employeeServiceMain;

    @Autowired(required = true)
    @Qualifier(value = "employeeServiceMain")
    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeServiceMain = employeeService;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView main() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("success", new Boolean(true));
        modelAndView.addObject("employee", new Employee());
        modelAndView.setViewName("index");
        return modelAndView;
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public ModelAndView loginBTS (@ModelAttribute("employee") Employee employee){
            List<Employee> employeeList = this.employeeServiceMain.listEmployees();
            ModelAndView modelAndView = new ModelAndView();

            for (Employee employee1 : employeeList) {
                if (employee1.getLogin().equals(employee.getLogin()) && employee1.getPassword().equals(employee.getPassword())) {
                    modelAndView.setViewName("mainMenu");
                    modelAndView.addObject("employeeSession", this.employeeServiceMain.getEmployeeById(employee1.getIdEmployee()));
                    return modelAndView;
                }
            }
            modelAndView.setViewName("index");
            modelAndView.addObject("success", new Boolean(false));
            return modelAndView;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logoutBTS(HttpSession request) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("success", new Boolean(true));
        modelAndView.addObject("employee", new Employee());
        modelAndView.addObject("employeeSession", new Employee());
        modelAndView.setViewName("index");
        request.removeAttribute("employeeSession");

        return modelAndView;
    }

    @RequestMapping(value = "/mainmenu",method = RequestMethod.GET)
    public ModelAndView mainMenu(HttpServletRequest request) {
        return accessCheck(request, "mainMenu");
    }

    public ModelAndView accessCheck(HttpServletRequest request, String page){
        ModelAndView modelAndView = new ModelAndView();
        HttpSession session = request.getSession();
        Employee employee = (Employee)session.getAttribute("employeeSession");

        if(employee.getFirstName()==null){
            modelAndView.setViewName("accessdenied");
            return modelAndView;
        }
        else {
            modelAndView.setViewName(page);
            return modelAndView;
        }
    }
}
