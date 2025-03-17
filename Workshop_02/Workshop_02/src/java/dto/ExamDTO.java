
package dto;

public class ExamDTO {
    private int exam_id, category_id, total_marks,Duration;
    private String exam_title, Subject;

    public ExamDTO() {
    }

    public ExamDTO(int exam_id, int category_id, int total_marks, int Duration, String exam_title, String Subject) {
        this.exam_id = exam_id;
        this.category_id = category_id;
        this.total_marks = total_marks;
        this.Duration = Duration;
        this.exam_title = exam_title;
        this.Subject = Subject;
    }

    public int getExam_id() {
        return exam_id;
    }

    public void setExam_id(int exam_id) {
        this.exam_id = exam_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getTotal_marks() {
        return total_marks;
    }

    public void setTotal_marks(int total_marks) {
        this.total_marks = total_marks;
    }

    public int getDuration() {
        return Duration;
    }

    public void setDuration(int Duration) {
        this.Duration = Duration;
    }

    public String getExam_title() {
        return exam_title;
    }

    public void setExam_title(String exam_title) {
        this.exam_title = exam_title;
    }

    public String getSubject() {
        return Subject;
    }

    public void setSubject(String Subject) {
        this.Subject = Subject;
    }

    @Override
    public String toString() {
        return "ExamDTO{" + "exam_id=" + exam_id + ", category_id=" + category_id + ", total_marks=" + total_marks + ", Duration=" + Duration + ", exam_title=" + exam_title + ", Subject=" + Subject + '}';
    }
    
}
