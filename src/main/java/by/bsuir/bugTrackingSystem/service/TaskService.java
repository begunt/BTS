package by.bsuir.bugTrackingSystem.service;

import by.bsuir.bugTrackingSystem.model.Task;

import java.util.List;

/**
 * Created by tbegu_000 on 06.11.2016.
 */
public interface TaskService {
    public void addTask(Task task);

    public void updateTask(Task task);

    public void removeTask(int id);

    public Task getTaskById(int id);

    public List<Task> listTasks();
}
