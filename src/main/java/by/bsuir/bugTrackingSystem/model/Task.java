package by.bsuir.bugTrackingSystem.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by tbegu_000 on 06.11.2016.
 */
@Entity
@Table(name = "TASK")
public class Task {
    @Id
    @Column(name = "idTask")
    private int idTask;

    @Column(name = "idProject")
    private int idProject;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    public int getIdTask() {
        return idTask;
    }

    public void setIdTask(int idTask) {
        this.idTask = idTask;
    }

    public int getIdProject() {
        return idProject;
    }

    public void setIdProject(int idProject) {
        this.idProject = idProject;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Task{" +
                "idTask=" + idTask +
                ", idProject=" + idProject +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
