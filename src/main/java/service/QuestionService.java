package service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import tools.PageInformation;
import tools.WebProperties;
import dao.DatabaseDao;
import dao.QuestionDao;
import bean.Question;
import tools.Tool;

public class QuestionService {
    public Integer add(Question question){
        try {
            DatabaseDao databaseDao=new DatabaseDao();
            QuestionDao questionDao=new QuestionDao();
            return questionDao.add(question, databaseDao);
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        } catch (Exception e) {
            e.printStackTrace();
            return -2;
        }
    }

    public List<Question> getOnePage(PageInformation pageInformation) {
        List<Question> questiones=new ArrayList<Question>();
        try {
            DatabaseDao databaseDao=new DatabaseDao();
            QuestionDao questionDao=new QuestionDao();
            questiones=questionDao.getOnePage(pageInformation,databaseDao);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return questiones;
    }

    public Question getQuestionById(Integer questionId){
        QuestionDao questionDao=new QuestionDao();
        try {
            return questionDao.getById(questionId);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }
    public Question getQuestionByName(String questionName){
        QuestionDao questionDao=new QuestionDao();
        try {
            return questionDao.getByName(questionName);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    //删除多条记录
    public List<Question> deletes(PageInformation pageInformation) {
        List<Question> questiones=null;
        try {
            DatabaseDao databaseDao=new DatabaseDao();
            QuestionDao questionDao=new QuestionDao();
            questionDao.deletes(pageInformation.getTableName(),pageInformation.getIds(),databaseDao);
            pageInformation.setIds(null);
            questiones=questionDao.getOnePage(pageInformation,databaseDao);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return questiones;
    }

    public List<List<Question>> getByTypesTopN(String[] questionTypes, Integer n){
        List<List<Question>>  questionesList=new ArrayList<List<Question>>();
        try {
            DatabaseDao databaseDao=new DatabaseDao();
            QuestionDao questionDao=new QuestionDao();
            for(String type: questionTypes){
                List<Question> questiones=questionDao.getByTypesTopN(type, n, databaseDao);
                questionesList.add(questiones);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return questionesList;
    }

    public List<List<Question>> getByTypesTopN1(String[] questionTypes, Integer n,List<List<String>> questionCaptionsList){
        List<List<Question>>  questionesList=new ArrayList<List<Question>>();
        try {
            DatabaseDao databaseDao=new DatabaseDao();
            QuestionDao questionDao=new QuestionDao();
            for(String type: questionTypes){
                List<Question> questiones=questionDao.getByTypesTopN(type, n, databaseDao);
                List<String> questionCaptions=new ArrayList<String>();
                for(Question question:questiones){
                    String questionCaption=Tool.getStringByMaxLength(question.getCaption(),
                            Integer.parseInt(WebProperties.config.getString("homePageNewsCaptionMaxLength")));
                    questionCaptions.add(questionCaption);
                }
                questionesList.add(questiones);
                questionCaptionsList.add(questionCaptions);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return questionesList;
    }

    public Integer update(Question question){
        try {
            DatabaseDao databaseDao=new DatabaseDao();
            QuestionDao questionDao=new QuestionDao();
            return questionDao.update( question, databaseDao);
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        } catch (Exception e) {
            e.printStackTrace();
            return -2;
        }
    }
}
