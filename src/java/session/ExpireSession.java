
package session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class ExpireSession {
    public static void expireSession(HttpServletRequest req){
        HttpSession session = req.getSession();
        session.invalidate();
    }
}
