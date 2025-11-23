package cn.itcast.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

import cn.itcast.shop.adminuser.vo.AdminUser;

/**
 * 权限拦截器: 检查管理员是否登录
 */
public class PrivilegeInterceptor extends MethodFilterInterceptor {

    private static final long serialVersionUID = 1L;

    @Override
    protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
        try {
            // 获取请求和会话
            HttpServletRequest request = ServletActionContext.getRequest();
            if (request == null) {
                return ActionSupport.LOGIN;
            }
            
            HttpSession session = request.getSession(false);
            if (session == null) {
                return ActionSupport.LOGIN;
            }
            
            // 判断是否登录,如果登录,放行,没有登录,跳转到登录页面.
            AdminUser adminUser = (AdminUser) session.getAttribute("existAdminUser");
            if (adminUser != null) {
                // 已经登录过，继续执行
                return actionInvocation.invoke();
            } else {
                // 跳转到登录页面:
                ActionSupport support = (ActionSupport) actionInvocation.getAction();
                support.addActionError("您还没有登录!没有权限访问!");
                return ActionSupport.LOGIN;
            }
        } catch (Exception e) {
            e.printStackTrace();
            // 发生异常，返回登录页面
            return ActionSupport.LOGIN;
        }
    }
}
