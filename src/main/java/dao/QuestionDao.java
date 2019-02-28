package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tools.PageInformation;
import tools.Tool;
import bean.Question;

public class QuestionDao {
    public Integer add(Question question,DatabaseDao databaseDao) throws SQLException{
        String sql="insert into question(caption,author,questionType,content,questionTime) values("
                +"'"+question.getCaption()+"','"
                +question.getAuthor()+"','"
                +question.getQuestionType()+"','"
                +question.getContent()+"','"
                +question.getQuestionTime()+"')";
        return databaseDao.update(sql);
    }
    public Integer update(Question question,DatabaseDao databaseDao) throws SQLException{
        String sql=" update question set caption='"+question.getCaption()
                +"',author='"+question.getAuthor()
                +"',newsType='"+question.getQuestionType()
                +"',content='"+question.getContent()
                +"',newsTime='"+question.getQuestionTime()
                +"' where newsId="+question.getQuestionId().toString();
        return databaseDao.update(sql);
    }


    public List<Question> getOnePage(PageInformation pageInformation,DatabaseDao databaseDao) throws SQLException{
        List<Question> questiones=new ArrayList<Question>();
        String sqlCount=Tool.getSql(pageInformation,"count");
        Integer allRecordCount=databaseDao.getCount(sqlCount);//符合条件的总记录数
        Tool.setPageInformation(allRecordCount, pageInformation);//更新pageInformation的总页数等

        String sqlSelect=Tool.getSql(pageInformation,"select");

        //不取出新闻内容
        sqlSelect=sqlSelect.replace("*", " questionId,caption,author,questionType,questionTime ");

        databaseDao.query(sqlSelect);
        while (databaseDao.next()) {
            Question question=new Question();
            question.setQuestionId(databaseDao.getInt("questionId"));
            question.setCaption(databaseDao.getString("caption"));
            question.setAuthor(databaseDao.getString("author"));
            question.setQuestionType(databaseDao.getString("questionType"));
            question.setQuestionTime(databaseDao.getLocalDateTime("questionTime"));
            questiones.add(question);
        }
        return questiones;
    }

    public Question getById(Integer questionId) throws SQLException,Exception{
        DatabaseDao databaseDao=new DatabaseDao();
        Question question=new Question();

        databaseDao.getById("question", questionId);
        while (databaseDao.next()) {
            question.setQuestionId(databaseDao.getInt("questionId"));
            question.setCaption(databaseDao.getString("caption"));
            question.setAuthor(databaseDao.getString("author"));
            question.setQuestionType(databaseDao.getString("questionType"));
            question.setContent(databaseDao.getString("content"));
            question.setQuestionTime(databaseDao.getLocalDateTime("questionTime"));
        }

        return question;
    }

    //通过关键字获取新闻
    public Question getByName(String questionName) throws SQLException,Exception{
        DatabaseDao databaseDao=new DatabaseDao();
        Question question=new Question();

        databaseDao.getByName("news", questionName);
        while (databaseDao.next()) {
            question.setQuestionId(databaseDao.getInt("questionId"));
            question.setCaption(databaseDao.getString("caption"));
            question.setAuthor(databaseDao.getString("author"));
            question.setQuestionType(databaseDao.getString("questionType"));
            question.setContent(databaseDao.getString("content"));
            question.setQuestionTime(databaseDao.getLocalDateTime("questionTime"));
        }
        return question;
    }

    public Integer deletes(String tableName,String ids,DatabaseDao databaseDao)throws SQLException,Exception{
        return databaseDao.deletes(tableName, ids, databaseDao);
    }

    public List<Question> getByTypesTopN(String type, Integer n,
                                         DatabaseDao databaseDao)throws SQLException,Exception{
        List<Question> questiones=new ArrayList<Question>();
        String sql;
        if(type.equals("all"))
            sql="select questionId,caption,author,questionType,questionTime from news order by questionTime desc limit 0,"+n.toString();
        else
            sql="select questionId,caption,author,questionType,questionTime from news where questionType ='" + type +"' order by newsTime desc limit 0,"+n.toString();

        databaseDao.query(sql);
        while (databaseDao.next()) {
            Question question=new Question();
            question.setQuestionId(databaseDao.getInt("questionId"));
            question.setCaption(databaseDao.getString("caption"));
            question.setAuthor(databaseDao.getString("author"));
            question.setQuestionType(databaseDao.getString("questionType"));
            question.setQuestionTime(databaseDao.getLocalDateTime("questionTime"));
            questiones.add(question);
        }
        return questiones;
    }
}
