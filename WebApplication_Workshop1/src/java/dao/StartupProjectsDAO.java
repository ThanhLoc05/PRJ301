/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.StartupProjectsDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author acer
 */
public class StartupProjectsDAO implements IDAO<StartupProjectsDTO, String>{
    @Override
    public boolean create(StartupProjectsDTO entity){
        String sql = "INSERT INTO tblStartupProjects"
                + "(project_id, project_name, Description, Status, estimate_launch)"
                + "VALUES(?, ?, ?, ?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, entity.getProject_id());
            ps.setString(2, entity.getProject_name());
            ps.setString(3, entity.getDescription());
            ps.setString(4, entity.getStatus());
            ps.setDate(5, (Date) entity.getEstimated_launch());
            int i = ps.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return false;
    }

    @Override
    public List<StartupProjectsDTO> readAll() {
        return null;
    }

    @Override
    public StartupProjectsDTO readById(String id) {
        return null;
    }

    @Override
    public boolean update(StartupProjectsDTO entity) {
        return false;
    }

    @Override
    public List<StartupProjectsDTO> search(String searchTerm) {
        return null;
    }
    
    public List<StartupProjectsDTO> searchByName(String searchTerm){
        String sql = "SELECT * FROM tblStartupProjects WHERE title LIKE ?";
        List<StartupProjectsDTO> list = new ArrayList<StartupProjectsDTO>();
        
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                StartupProjectsDTO sp = new StartupProjectsDTO(
                                rs.getString("project_id"),
                                rs.getString("project_name"),
                                rs.getString("Description"),
                                rs.getString("Staus"),
                                rs.getDate("estimate_lauch"));
                list.add(sp);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return list;
    }
    

        
}
