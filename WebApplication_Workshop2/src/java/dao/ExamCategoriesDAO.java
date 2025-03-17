package dao;

import dto.ExamCategoriesDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

public class ExamCategoriesDAO implements IDAO<ExamCategoriesDTO, Integer> {

    @Override
    public boolean create(ExamCategoriesDTO entity) {
        String sql = "INSERT INTO tblExamCategories (category_name, description) VALUES (?, ?)";
        try (Connection con = DBUtils.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, entity.getCategory_name());
            ps.setString(2, entity.getDescription());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public ExamCategoriesDTO readByID(Integer id) {
        String sql = "SELECT * FROM tblExamCategories WHERE category_id = ?";
        try (Connection con = DBUtils.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new ExamCategoriesDTO(
                        rs.getInt("category_id"),
                        rs.getString("category_name"),
                        rs.getString("description"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<ExamCategoriesDTO> readAll() {
        String sql = "SELECT * FROM tblExamCategories";
        List<ExamCategoriesDTO> list = new ArrayList<>();
        try (Connection con = DBUtils.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                list.add(new ExamCategoriesDTO(
                        rs.getInt("category_id"),
                        rs.getString("category_name"),
                        rs.getString("description")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean update(ExamCategoriesDTO entity) {
        String sql = "UPDATE tblExamCategories SET category_name = ?, description = ? WHERE category_id = ?";
        try (Connection con = DBUtils.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, entity.getCategory_name());
            ps.setString(2, entity.getDescription());
            ps.setInt(3, entity.getCategory_id());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(Integer id) {
        String sql = "DELETE FROM tblExamCategories WHERE category_id = ?";
        try (Connection con = DBUtils.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<ExamCategoriesDTO> getAllCategories() {
    List<ExamCategoriesDTO> categories = new ArrayList<>();
    String sql = "SELECT category_id, category_name, description FROM tblExamCategories";
    
    try (Connection conn = DBUtils.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
        
        while (rs.next()) {
            int id = rs.getInt("category_id");
            String name = rs.getString("category_name");
            String description = rs.getString("description");
            categories.add(new ExamCategoriesDTO(id, name, description));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    // Debug: In số lượng category lấy được từ database
    System.out.println("Number of categories from DB: " + categories.size());
    
    return categories;
}



    @Override
    public List<ExamCategoriesDTO> search(String searchTerm) {
        return null;
//        String sql = "SELECT * FROM tblExamCategories WHERE category_name LIKE ? OR description LIKE ?";
//        List<ExamCategoriesDTO> list = new ArrayList<>();
//        try (Connection con = DBUtils.getConnection();
//             PreparedStatement ps = con.prepareStatement(sql)) {
//            ps.setString(1, "%" + searchTerm + "%");
//            ps.setString(2, "%" + searchTerm + "%");
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new ExamCategoriesDTO(
//                        rs.getInt("category_id"),
//                        rs.getString("category_name"),
//                        rs.getString("description")));
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
    }

}
