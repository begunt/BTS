package by.bsuir.bugTrackingSystem.dao;

import by.bsuir.bugTrackingSystem.model.Task;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by tbegu_000 on 06.11.2016.
 */
@Repository
public class TaskDaoImpl implements TaskDao {
    private static final Logger logger = LoggerFactory.getLogger(TaskDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addTask(Task task) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(task);
        logger.info("Task successfully saved. Task details: " + task);
    }

    @Override
    public void updateTask(Task task) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(task);
        logger.info("Task successfully update. Task details: " + task);
    }

    @Override
    public void removeTask(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Task task = (Task) session.load(Task.class, new Integer(id));

        if(task!=null){
            session.delete(task);
        }
        logger.info("Task successfully removed. Task details: " + task);
    }

    @Override
    public Task getTaskById(int id) {
        Session session =this.sessionFactory.getCurrentSession();
        Task task = (Task) session.load(Task.class, new Integer(id));
        logger.info("Task successfully loaded. Task details: " + task);

        return task;
    }

    @Override
    public List<Task> listTasks() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Task> taskList = session.createQuery("from Task").list();

        for(Task task: taskList){
            logger.info("task list: " + task);
        }

        return taskList;
    }
}
