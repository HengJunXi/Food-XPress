package foodxpress;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "foodxpress.VendorLoginServlet")
public class VendorLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String vendorId = request.getParameter("vendor_id").replace("\'", "");
        String password = request.getParameter("password").replace("\'", "");
        SQLProvider provider = new SQLProvider();
        Repository repository = new Repository(provider);
        Vendor vendor = repository.vendorLogin(vendorId, password);

        if (vendor != null) {
            HttpSession session = request.getSession();
            session.setAttribute("vendor", vendor);
            response.sendRedirect("vendor-home");
        } else {
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("window.location.replace('vendor-login');");
            out.println("alert('Wrong vendor id or password. Please try again.');");
            out.println("</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
