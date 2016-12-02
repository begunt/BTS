package by.bsuir.bugTrackingSystem.service;

import by.bsuir.bugTrackingSystem.model.Project;

import java.util.List;

/**
 * Created by tbegu_000 on 05.11.2016.
 */
public interface ProjectService {
    public void addProject(Project project);

    public void updateProject(Project project);

    public void removeProject(int id);

    public Project getProjectById(int id);

    public List<Project> listProjects();
}
