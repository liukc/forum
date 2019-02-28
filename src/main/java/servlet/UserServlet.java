package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import bean.User;
import bean.Userinformation;
import service.UserService;
import tools.*;

public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String type=request.getParameter("type1");
        UserService userService=new UserService();
        HttpSession session =request.getSession();
        Message message=new Message();
        if(type.equals("register")){//注册
            String picString = (String) request.getSession().getAttribute("piccode");
            String checkCode = request.getParameter("verifyCode");
            PrintWriter out = response.getWriter();
            if (picString.toUpperCase().equals(checkCode.toUpperCase())) {
                out.println("验证码正确");
                User user=new User();
                Encript encript = new Encript();

                String code=CodeUtil.generateUniqueCode();
                user.setCode(code);
                user.setType(request.getParameter("type"));
                user.setName(request.getParameter("name"));
                //user.setPassword(request.getParameter("password"));
                //md5加密
                user.setPassword(encript.md5(request.getParameter("password")));

                user.setEmail(request.getParameter("email"));
                if(user.getType().equals("user"))
                    user.setEnable("use");
                else
                    user.setEnable("stop");

                int result=userService.register(user);
                message.setResult(result);
                if(result==1){
                    message.setMessage("注册成功！");
                    message.setRedirectUrl("jsp/login.jsp");
                }else if(result==0){
                    message.setMessage("同名用户已存在，请改名重新注册！");
                    message.setRedirectUrl("jsp/register.jsp");
                }else{
                    message.setMessage("注册失败！");
                    message.setRedirectUrl("jsp/register.jsp");
                }
            }
            else{
                message.setMessage("验证码错误！");
                message.setRedirectUrl("jsp/register.jsp");
            }
            request.setAttribute("message", message);
            getServletContext().getRequestDispatcher("/jsp/message.jsp").forward(request,response);
        }else if(type.equals("login")){//登陆
            User user=new User();
            user.setName(request.getParameter("name"));
            user.setPassword(request.getParameter("password"));
            int result=userService.login(user);
            message.setResult(result);
            if(result==1){
                user.setPassword(null);//防止密码泄露
                request.getSession().setAttribute("user", user);
                //session.setAttribute("user",user);
                String originalUrl=(String)request.getSession().getAttribute("originalUrl");
                Userinformation userinformation=userService.getByUserId(user.getUserId());
                //request.setAttribute("userinformation", userinformation);

                session.setAttribute("userinformation", userinformation);

                if(originalUrl==null)
                    response.sendRedirect("/forum/index.jsp?type=logined");
                    //getServletContext().getRequestDispatcher("/index.jsp?type=logined").forward(request,response);
                else
                    response.sendRedirect(originalUrl);

                return;
            }else if(result==0){
                message.setMessage("用户存在，但已被停用，请联系管理员！");
                message.setRedirectUrl("/forum/jsp/login.jsp");
            }else if(result==-1){
                message.setMessage("用户不存在，或者密码错误，请重新登录！");
                message.setRedirectUrl("/forum/jsp/login.jsp");
            }else if(result==-2){
                message.setMessage("出现其它错误，请重新登录！");
                message.setRedirectUrl("/forum/jsp/login.jsp");
            }
            request.setAttribute("message", message);
            getServletContext().getRequestDispatcher("/jsp/message.jsp").forward(request,response);
        }else if(type.equals("exit")){
            request.getSession().removeAttribute("user");
            response.sendRedirect("/index.jsp");
        }else if(type.equals("showPage")){//显示用户
            PageInformation pageInformation=new PageInformation();
            Tool.getPageInformation("user", request, pageInformation);
            List<User> users=userService.getOnePage(pageInformation);

            //统计各用户类型的数据
            int userCount = 0;
            int managerCount = 0;
            int anonymousCount = 0;
            int newsAuthorCount = 0;
            for(User user: users){
                if(user.getType().equals("user"))
                    userCount++;
                else if("manager".equals(user.getType()))
                    managerCount++;
                else if("anonymous".equals(user.getType()))
                    anonymousCount++;
                else
                    newsAuthorCount++;
            }
            session.setAttribute("userCount",userCount);
            session.setAttribute("managerCount",managerCount);
            session.setAttribute("anonymousCount",anonymousCount);
            session.setAttribute("newsAuthorCount",newsAuthorCount);


            session.setAttribute("pageInformation", pageInformation);
            session.setAttribute("users", users);
            response.sendRedirect("/forum/jsp/userShow.jsp");
        }else if(type.equals("delete")){
            PageInformation pageInformation=new PageInformation();
            Tool.getPageInformation("user", request, pageInformation);
            pageInformation.setSearchSql(" (type='user' or type='newsAuthor')");
            List<User> users=userService.deletes(pageInformation);
            session.setAttribute("pageInformation", pageInformation);
            session.setAttribute("users", users);
            response.sendRedirect("/forum/jsp/userDelete.jsp");
        }else if(type.equals("changePassword")){
            String newPassword=request.getParameter("newPassword");
            User user=(User)request.getSession().getAttribute("user");
            user.setPassword(request.getParameter("oldPassword"));
            Integer result=userService.changePassword(user,newPassword);
            message.setResult(result);
            if(result==1){
                message.setMessage("修改密码成功！");
            }else if(result==0){
                message.setMessage("修改密码失败，请联系管理员！");
            }
            message.setRedirectTime(1000);
            request.setAttribute("message", message);
            getServletContext().getRequestDispatcher("/forum/jsp/message.jsp").forward(request,response);
        }else if(type.equals("showPrivate")){//显示普通用户个人信息
            User user=(User)request.getSession().getAttribute("user");
            if("user".equals(user.getType())){
                Userinformation userinformation=userService.getByUserId(user.getUserId());
                session.setAttribute("userinformation", userinformation);
            }
            getServletContext().getRequestDispatcher("/forum/jsp/personal.jsp").forward(request,response);
        }else if(type.equals("changePrivate2")){//修改普通用户个人信息的第二步：修改信息
            User user=(User)request.getSession().getAttribute("user");
            Integer result=userService.updatePrivate(user, request);
            message.setResult(result);
            if(result==5){
                message.setMessage("修改个人信息成功！");
                message.setRedirectUrl("/forum/servlet/UserServlet?type1=showPrivate");

            }else if(result==0){
                message.setMessage("修改个人信息失败，请联系管理员！");
                message.setRedirectUrl("/forum/servlet/UserServlet?type1=showPrivate");
            }
            request.setAttribute("message", message);
            getServletContext().getRequestDispatcher("/forum/jsp/message.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
