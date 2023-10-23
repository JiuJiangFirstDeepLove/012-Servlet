package filter;

import model.User;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "FontFilter",urlPatterns = "/*")
public class FontFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse requestp = (HttpServletResponse)resp;

        String uri = request.getRequestURI();
        if(uri.contains("/cart/")){
            User u = (User) request.getSession().getAttribute("user");
            if(u==null) {
                if(uri.contains("/api/")){
                    requestp.getWriter().print("login");
                }else{
                    requestp.sendRedirect("/user_login.jsp");
                }
            }else {
                // pass the request along the filter chain
                chain.doFilter(req, resp);
            }
        }else{
            // pass the request along the filter chain
            chain.doFilter(req, resp);
        }


    }
}
