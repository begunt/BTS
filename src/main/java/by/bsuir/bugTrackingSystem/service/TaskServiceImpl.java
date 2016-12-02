package by.bsuir.bugTrackingSystem.service;

import by.bsuir.bugTrackingSystem.dao.TaskDao;
import by.bsuir.bugTrackingSystem.model.Task;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by tbegu_000 on 06.11.2016.
 */
@Service
@Transactional
public class TaskServiceImpl implements TaskService{
    private TaskDao taskDao;

    public void setTaskDao(TaskDao taskDao) {
        this.taskDao = taskDao;
    }

    @Override
    public void addTask(Task task) {
        this.taskDao.addTask(task);
    }

    @Override
    public void updateTask(Task task) {
        this.taskDao.updateTask(task);
    }

    @Override
    public void removeTask(int id) {
        this.taskDao.removeTask(id);
    }

    @Override
    public Task getTaskById(int id) {
        return this.taskDao.getTaskById(id);
    }

    @Override
    public List<Task> listTasks() {
        return this.taskDao.listTasks();
    }
}
