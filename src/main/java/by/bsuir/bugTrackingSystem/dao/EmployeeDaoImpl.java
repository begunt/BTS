package by.bsuir.bugTrackingSystem.dao;

import by.bsuir.bugTrackingSystem.model.Employee;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

/**
 * Created by tbegu_000 on 06.11.2016.
 */
@Repository
public class EmployeeDaoImpl implements EmployeeDao {

    private static final org.slf4j.Logger logger = LoggerFactory.getLogger(EmployeeDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addEmployee(Employee employee) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(employee);
        logger.info("Employee successfully saved. Employee details: " + employee);
    }

    @Override
    public void updateEmployee(Employee employee) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(employee);
        logger.info("Employee successfully update. Employee details: " + employee);
    }

    @Override
    public void removeEmployee(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Employee employee = (Employee) session.load(Employee.class, new Integer(id));

        if(employee!=null){
            session.delete(employee);
        }
        logger.info("Employee successfully removed. Employee details: " + employee);
    }

    @Override
    public Employee getEmployeeById(int id) {
        Session session =this.sessionFactory.getCurrentSession();
        Employee employee = (Employee) session.load(Employee.class, new Integer(id));
        logger.info("Employee successfully loaded. Employee details: " + employee);

        return employee;
    }

    @Override
    public List<Employee> listEmployees() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Employee> employeeList = session.createQuery("from Employee").list();

        for(Employee employee: employeeList){
            logger.info("employee list: " + employee);
        }

        return employeeList;
    }

    @Override
    public List<Employee> listManagers() {
        List<Employee> managerList = getRoleList(1);

        return managerList;
    }

    @Override
    public List<Employee> listEnginers() {
        List<Employee> managerList = getRoleList(2);

        return managerList;
    }

    public List<Employee> getRoleList (int idRole){
        List<Employee> employeeList = listEmployees();
        List<Employee> roleList = new ArrayList<Employee>();
        Employee role = new Employee();

        for (int i=0; i < employeeList.size(); i++){
            if(employeeList.get(i).getIdRole() == idRole) {
                role = employeeList.get(i);
                roleList.add(role);
            }
        }
        return roleList;
    }
}

