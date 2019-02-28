package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import bean.Question;
import bean.QuestionType;
import service.QuestionService;
import tools.Message;
import tools.PageInformation;
import tools.ServletTool;
import tools.Tool;
import tools.WebProperties;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class QuestionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setCharacterEncoding("UTF-8");
        String type=request.getParameter("type1");
        QuestionService questionService=new QuestionService();
        Message message=new Message();
        HttpSession session =request.getSession();
        if(type.equals("add")){
            Question question=new Question();
            String questionId=request.getParameter("questionId");
            if(questionId!=null && !questionId.isEmpty())
                question.setQuestionId(Integer.parseInt(request.getParameter("questionId")));
            String caption = new String(request.getParameter("caption").getBytes("ISO8859_1"),"utf-8");
            question.setCaption(caption);
            String author = new String(request.getParameter("author").getBytes("ISO8859_1"),"utf-8");
            question.setAuthor(author);
            String questionType = new String(request.getParameter("questionType").getBytes("ISO8859_1"),"utf-8");
            question.setQuestionType(questionType);
            //uedit上传的内容的数据名称是：editorValue
            String editorValue = new String(request.getParameter("editorValue").getBytes("ISO8859_1"),"utf-8");
            question.setContent(editorValue);
            String a=request.getParameter("questionTime");
            //DateTimeFormatter用于将字符串解析成LocalDateTime类型的对象，或者反之
            LocalDateTime localDateTime=LocalDateTime.parse(a, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
            question.setQuestionTime(localDateTime);
            int result=questionService.add(question);
            message.setResult(result);
            if(result==1){
                message.setMessage("添加新闻成功！");
                message.setRedirectUrl("/forum/index.jsp");
            }else if(result==0){
                message.setMessage("添加新闻失败！请联系管理员！");
                message.setRedirectUrl("/forum/index.jsp");
            }
            request.setAttribute("message", message);
            getServletContext().getRequestDispatcher("/jsp/message.jsp").forward(request,response);

        }else if(type.equals("showQuestion")){
            PageInformation pageInformation=new PageInformation();
            Tool.getPageInformation("question", request, pageInformation);
            List<Question> questiones=questionService.getOnePage(pageInformation);
            session.setAttribute("questiones", questiones);
            session.setAttribute("pageInformation", pageInformation);
            //request.setAttribute("newses", newss);
            //getServletContext().getRequestDispatcher("/jsp/news.jsp").forward(request,response);
            response.sendRedirect("/forum/jsp/discuss.jsp");

        }else if(type.equals("showAQuestion")){
            Integer questionId=Integer.parseInt(request.getParameter("questionId"));
            Question question=questionService.getQuestionById(questionId);
            session.setAttribute("question", question);
            getServletContext().getRequestDispatcher("/jsp/showQuestion.jsp").forward(request,response);


        }else if(type.equals("deleteANews")||type.equals("manageNews")){
            PageInformation pageInformation=new PageInformation();
            Tool.getPageInformation("news", request, pageInformation);
            List<Question> questiones=null;

            if(type.equals("manageNews"))
                questiones=questionService.getOnePage(pageInformation);
            else if(type.equals("deleteANews"))
                questiones=questionService.deletes(pageInformation);

            request.setAttribute("pageInformation", pageInformation);
            request.setAttribute("questiones", questiones);
            getServletContext().getRequestDispatcher("/news/manage/manageNews.jsp").forward(request,response);
        }else if(type.equals("editANews")){//显示编辑页面
            PageInformation pageInformation=new PageInformation();
            Tool.getPageInformation("question", request, pageInformation);
            Integer questionId=Integer.parseInt(pageInformation.getIds());
            Question question=questionService.getQuestionById(questionId);
            request.setAttribute("pageInformation", pageInformation);
            request.setAttribute("question", question);
            getServletContext().getRequestDispatcher("/news/manage/editANews.jsp").forward(request,response);
        }else if(type.equals("edit")){//修改新闻
            Question question=ServletTool.question(request);
            int result=questionService.update(question);
            message.setResult(result);
            if(result==1){
                message.setMessage("添加新闻成功！请添加新的新闻！");
            }else if(result==0){
                message.setMessage("添加新闻失败！请联系管理员！");
            }
            message.setRedirectTime(1000);
            request.setAttribute("message", message);
            getServletContext().getRequestDispatcher("/forum/message.jsp").forward(request,response);
        }else if(type.equals("homepageTypes1")){//主页多个分类新闻区
            String questionTypesString=new String(WebProperties.config.getString("newsTypes").getBytes("ISO-8859-1"),"UTF-8");
            String[] questionTypes=questionTypesString.split(",");
            Integer homePageQuestionN=Integer.parseInt(WebProperties.config.getString("homePageQuestionN"));
            List<List<Question>>  questionesList=questionService.getByTypesTopN(questionTypes, homePageQuestionN);
            request.setAttribute("questionTypes", questionTypes);
            request.setAttribute("questionesList", questionesList);
            request.setAttribute("homePageQuestionCaptionMaxLength",
                    Integer.parseInt(WebProperties.config.getString("homePageQuestionCaptionMaxLength")));
            getServletContext().getRequestDispatcher("forum/index2.jsp").include(request,response);
            return;
        }else if(type.equals("homepageTypes")){//主页多个分类新闻区
            String questionTypesString=new String(WebProperties.config.getString("questionTypes").getBytes("ISO-8859-1"),"UTF-8");
            String[] questionTypes=questionTypesString.split(",");
            Integer homePageQuestionN=Integer.parseInt(WebProperties.config.getString("homePageQuestionN"));
            List<List<String>> questionCaptionsList=new ArrayList<List<String>>();
            List<List<Question>>  questionesList=questionService.getByTypesTopN1(questionTypes, homePageQuestionN,questionCaptionsList);
            int questionTypesNumber=questionTypes.length;
            request.setAttribute("questionTypes", questionTypes);
            request.setAttribute("questionTypesNumber", questionTypesNumber);
            request.setAttribute("questionesList", questionesList);
            request.setAttribute("questionCaptionsList",questionCaptionsList);
            getServletContext().getRequestDispatcher("/index2.jsp").include(request,response);
            return;

        } else if(type.equals("searchQuestion")){//通过关键字搜索新闻
            String questionName=request.getParameter("search");
            Question question=questionService.getQuestionByName(questionName);
            request.setAttribute("question", question);
            getServletContext().getRequestDispatcher("/forum/jsp/search.jsp").forward(request,response);

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
