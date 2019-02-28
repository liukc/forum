package servlet;

import bean.Comment;
import bean.CommentUserView;
import bean.User;
import service.CommentService;
import tools.PageInformation;
import tools.Tool;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class CommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type=request.getParameter("type");
        String newsId=request.getParameter("newsId");
        CommentService commentService=new CommentService();
        if(type.equals("showCommnet")){
            PageInformation pageInformation=new PageInformation();
            Tool.getPageInformation("commentUserView", request, pageInformation);
            pageInformation.setSearchSql(" (newsId="+newsId+") ");
            pageInformation.setOrder("desc");
            pageInformation.setOrderField("time");
            List<CommentUserView> commentUserViews=commentService.getOnePage(pageInformation);
            request.setAttribute("pageInformation", pageInformation);
            request.setAttribute("commentUserViews", commentUserViews);
            getServletContext().getRequestDispatcher("/forum/comment/showComment.jsp").include(request,response);
            return ;
        }else if(type.equals("praise")){//点赞
            String commentId=request.getParameter("commentId");

            commentService.paise(Integer.parseInt(commentId));
            String url="/servlet/NewsServlet?type1=showANews&newsId="+newsId
                    +"&page"+request.getParameter("page")
                    +"&pageSize"+request.getParameter("pageSize")
                    +"&totalPageCount"+request.getParameter("totalPageCount");
            getServletContext().getRequestDispatcher(url).forward(request,response);
        }else if(type.equals("addCommnet")){//添加评论
            Comment comment=new Comment();
            comment.setContent(request.getParameter("content"));
            comment.setNewsId(Integer.parseInt(newsId));
            User user=(User)request.getSession().getAttribute("user");
            comment.setUserId(user.getUserId());
            String commentId=request.getParameter("commentId");

            String url;
            if(commentId==null || commentId.isEmpty()){
                commentService.addComment(comment);//对新闻的回复
                url="/servlet/NewsServlet?type1=showANews&newsId="+newsId
                        +"&page=1&addCommnet=addCommnet";
            }else{
                comment.setCommentId(Integer.parseInt(commentId));
                commentService.addCommentToComment(comment);//对回复的回复
                url="/servlet/NewsServlet?type1=showANews&newsId="+newsId
                        +"&page=1";
            }


            getServletContext().getRequestDispatcher(url).forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
