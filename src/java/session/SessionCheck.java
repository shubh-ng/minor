package session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionCheck {
    public static boolean checkSession(HttpServletRequest req){
        HttpSession session = req.getSession();
        String username = (String)session.getAttribute("username");
        String password = (String)session.getAttribute("password");
        if(username!=null && password!=null){
            return true;
        }
        return false;
    }
}
