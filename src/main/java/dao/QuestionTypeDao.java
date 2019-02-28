package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.QuestionType;

public class QuestionTypeDao {
    public List<QuestionType> getAll() throws SQLException, Exception{
        List<QuestionType> questionTypes=new ArrayList<QuestionType>();
        String sql="select * from newstype";
        DatabaseDao databaseDao=new DatabaseDao();
        databaseDao.query(sql);
        while (databaseDao.next()) {
            QuestionType questionType=new QuestionType();
            questionType.setName(databaseDao.getString("name"));
            questionType.setQuestionTypeId(databaseDao.getInt("questionTypeId"));
            questionTypes.add(questionType);
        }
        return questionTypes;
    }
}
