package dao;

import dto.ExamDTO;
import utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ExamDAO {
    public List<ExamDTO> getExamsByCategory(int categoryId) {
        List<ExamDTO> exams = new ArrayList<>();
        String sql = "SELECT * FROM tblExams WHERE category_id = ?";
        
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, categoryId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int exam_id = rs.getInt("exam_id");
                    String exam_title = rs.getString("exam_title");
                    String subject = rs.getString("Subject");
                    int total_marks = rs.getInt("total_marks");
                    int duration = rs.getInt("Duration");
                    
                    exams.add(new ExamDTO(exam_id, categoryId, total_marks, duration, exam_title, subject));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return exams;
    }

   public boolean createExam(ExamDTO exam) {
        // Chú ý: Giả sử bảng tblExams có các cột: exam_id (auto-generated), exam_title, Subject, category_id, total_marks, Duration
        String sql = "INSERT INTO tblExams (exam_title, Subject, category_id, total_marks, Duration) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, exam.getExam_title());
            ps.setString(2, exam.getSubject());
            ps.setInt(3, exam.getCategory_id());
            ps.setInt(4, exam.getTotal_marks());
            ps.setInt(5, exam.getDuration());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    
}
