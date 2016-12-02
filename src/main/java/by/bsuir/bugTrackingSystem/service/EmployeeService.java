package by.bsuir.bugTrackingSystem.service;

import by.bsuir.bugTrackingSystem.model.Employee;

import java.util.List;

/**
 * Created by tbegu_000 on 06.11.2016.
 */
public interface EmployeeService {
    public void addEmployee(Employee employee);

    public void updateEmployee(Employee employee);

    public void removeEmployee(int id);

    public Employee getEmployeeById(int id);

    public List<Employee> listEmployees();

    public List<Employee> listManagers();

    public List<Employee> listEnginers();
}

