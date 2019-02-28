package bean;

import java.time.LocalDateTime;

public class Question {
    private Integer questionId;
    private String questionType;
    private String author;
    private String caption;
    private String content;
    private LocalDateTime questionTime;
    public Integer getQuestionId() {
        return questionId;
    }
    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }
    public String getQuestionType() {
        return questionType;
    }
    public void setQuestionType(String questionType) {
        this.questionType = questionType;
    }
    public String getAuthor() {
        return author;
    }
    public void setAuthor(String author) {
        this.author = author;
    }
    public String getCaption() {
        return caption;
    }
    public void setCaption(String caption) {
        this.caption = caption;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public LocalDateTime getQuestionTime() {
        return questionTime;
    }
    public void setQuestionTime(LocalDateTime questionTime) {
        this.questionTime = questionTime;
    }

}
