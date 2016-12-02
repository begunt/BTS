package by.bsuir.bugTrackingSystem.service;

import by.bsuir.bugTrackingSystem.dao.ProjectDao;
import by.bsuir.bugTrackingSystem.model.Project;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by tbegu_000 on 05.11.2016.
 */
@Service
@Transactional
public class ProjectServiceImpl implements ProjectService{
    private ProjectDao projectDao;

    public void setProjectDao(ProjectDao projectDao) {
        this.projectDao = projectDao;
    }

    @Override
    public void addProject(Project project) {
        this.projectDao.addProject(project);
    }

    @Override
    public void updateProject(Project project) {
        this.projectDao.updateProject(project);
    }

    @Override
    public void removeProject(int id) {
        this.projectDao.removeProject(id);
    }

    @Override
    public Project getProjectById(int id) {
        return this.projectDao.getProjectById(id);
    }

    @Override
    public List<Project> listProjects() {
        return this.projectDao.listProjects();
    }
}
