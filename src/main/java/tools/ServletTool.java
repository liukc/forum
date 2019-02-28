package tools;

import bean.News;
import bean.Question;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ServletTool {
    static public News news(HttpServletRequest request){

        News news=new News();
        String newsId=request.getParameter("newsId");
        if(newsId!=null && !newsId.isEmpty())
            news.setNewsId(Integer.parseInt(request.getParameter("newsId")));

        news.setCaption(request.getParameter("caption"));
        news.setAuthor(request.getParameter("author"));
        news.setNewsType(request.getParameter("newsType"));
        //uedit上传的内容的数据名称是：editorValue
        news.setContent(request.getParameter("editorValue"));
        String a=request.getParameter("newsTime");
        //DateTimeFormatter用于将字符串解析成LocalDateTime类型的对象，或者反之
        LocalDateTime localDateTime=LocalDateTime.parse(a, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
        news.setNewsTime(localDateTime);

        return news;
    }
    static public Question question(HttpServletRequest request) throws UnsupportedEncodingException {

        Question question=new Question();
        String questionId=request.getParameter("questionId");
        if(questionId!=null && !questionId.isEmpty())
            question.setQuestionId(Integer.parseInt(request.getParameter("questionId")));
        //String caption = new String(request.getParameter("caption").getBytes("ISO8859_1"),"utf-8");
        question.setCaption(request.getParameter("caption"));
        //String author = new String(request.getParameter("author").getBytes("ISO8859_1"),"utf-8");
        question.setAuthor(request.getParameter("author"));
        //String questionType = new String(request.getParameter("questionType").getBytes("ISO8859_1"),"utf-8");
        question.setQuestionType(request.getParameter("questionType"));
        //uedit上传的内容的数据名称是：editorValue
        //String editorValue = new String(request.getParameter("editorValue").getBytes("ISO8859_1"),"utf-8");
        question.setContent(request.getParameter("editorValue"));
        String a=request.getParameter("questionTime");
        //DateTimeFormatter用于将字符串解析成LocalDateTime类型的对象，或者反之
        LocalDateTime localDateTime=LocalDateTime.parse(a, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
        question.setQuestionTime(localDateTime);

        return question;
    }
}
