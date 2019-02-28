package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import dao.DatabaseDao;
import bean.News;
import bean.Question;
import service.NewsService;
import service.QuestionService;
import tools.Message;
import tools.PageInformation;
import tools.Tool;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
        HttpSession session =request.getSession();
        List<News> newses=new ArrayList<News>();
        List<Question> questiones = new ArrayList<Question>();
        //创建查询语句
        String search = request.getParameter("search");
        String searchSql = "caption like"+"'%"+search+"%'";
        PageInformation pageInformation=new PageInformation();
        pageInformation.setTableName("news");
        pageInformation.setSearchSql(searchSql);
        String sqlSelect=Tool.getSql(pageInformation,"select");
        //
        DatabaseDao databaseDao = null;
        try {
            databaseDao = new DatabaseDao();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        try {
            databaseDao.query(sqlSelect);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        try {
            while (databaseDao.next()) {
                News news=new News();
                news.setNewsId(databaseDao.getInt("newsId"));
                news.setCaption(databaseDao.getString("caption"));
                news.setAuthor(databaseDao.getString("author"));
                news.setNewsType(databaseDao.getString("newsType"));
                news.setNewsTime(databaseDao.getLocalDateTime("newsTime"));
                news.setPublishTime(databaseDao.getTimestamp("publishTime"));
                newses.add(news);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        session.setAttribute("newses", newses);
        pageInformation.setTableName("question");
        sqlSelect=Tool.getSql(pageInformation,"select");
        try {
            databaseDao.query(sqlSelect);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        try {
            while (databaseDao.next()) {
                Question question = new Question();
                question.setQuestionId(databaseDao.getInt("questionId"));
                question.setCaption(databaseDao.getString("caption"));
                question.setAuthor(databaseDao.getString("author"));
                question.setQuestionType(databaseDao.getString("questionType"));
                question.setQuestionTime(databaseDao.getLocalDateTime("questionTime"));
                questiones.add(question);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        session.setAttribute("questiones", questiones);
        response.sendRedirect("/forum/jsp/search.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
