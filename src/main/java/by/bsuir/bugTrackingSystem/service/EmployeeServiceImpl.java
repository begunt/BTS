package by.bsuir.bugTrackingSystem.service;

import by.bsuir.bugTrackingSystem.dao.EmployeeDao;
import by.bsuir.bugTrackingSystem.model.Employee;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by tbegu_000 on 06.11.2016.
 */
@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

    private EmployeeDao employeeDao;

    public void setEmployeeDao(EmployeeDao employeeDao) {
        this.employeeDao = employeeDao;
    }

    @Override
    public void addEmployee(Employee employee) {
        this.employeeDao.addEmployee(employee);
    }

    @Override
    public void updateEmployee(Employee employee) {
        this.employeeDao.updateEmployee(employee);
    }

    @Override
    public void removeEmployee(int id) {
        this.employeeDao.removeEmployee(id);
    }

    @Override
    public Employee getEmployeeById(int id) {
        return this.employeeDao.getEmployeeById(id);
    }

    @Override
    public List<Employee> listEmployees() {
        return this.employeeDao.listEmployees();
    }

    @Override
    public List<Employee> listManagers() {
        return this.employeeDao.listManagers();
    }

    @Override
    public List<Employee> listEnginers() {
        return this.employeeDao.listEnginers();
    }
}
