/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.Date;



/**
 *
 * @author acer
 */
public class StartupProjectsDTO {
    private String project_id;
    private String project_name;
    private String Description;
    private String Status;
    private Date estimated_launch;

    public StartupProjectsDTO() {
        this.project_id = "";
        this.project_name = "";
        this.Description = "";
        this.Status = "";
    }

    public StartupProjectsDTO(String project_id, String project_name, String Description, String Status, Date estimated_launch) {
        this.project_id = project_id;
        this.project_name = project_name;
        this.Description = Description;
        this.Status = Status;
        this.estimated_launch = estimated_launch;
    }

    public String getProject_id() {
        return project_id;
    }

    public void setProject_id(String project_id) {
        this.project_id = project_id;
    }

    public String getProject_name() {
        return project_name;
    }

    public void setProject_name(String project_name) {
        this.project_name = project_name;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public Date getEstimated_launch() {
        return estimated_launch;
    }

    public void setEstimated_launch(Date estimated_launch) {
        this.estimated_launch = estimated_launch;
    }
    
    
}
