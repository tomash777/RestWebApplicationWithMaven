import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.*;
import javax.ws.rs.core.Response;
import java.io.IOException;
import java.io.PrintWriter;

//@WebServlet(name = "convert", urlPatterns = "/convert")
public class ConvertServlet extends HttpServlet {

    Client client = ClientBuilder.newClient();

    WebTarget baseTarget = client.target("http://localhost:8181/api/");
    WebTarget romanTarget = baseTarget.path("roman/{number}");
    WebTarget hexadecimalTarget = baseTarget.path("hexadecimal/{number}");


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String type = req.getParameter("type");
        String number = req.getParameter("number");

        PrintWriter out1 = res.getWriter();

        if(type.equals("roman")){
            //System.out.println("roman");
            Response response = romanTarget
                    .resolveTemplate("number",number)
                    .request().get(Response.class);
            String convertedNumber = response.readEntity(String.class);
            //System.out.println(convertedNumber);
            out1.println(convertedNumber);

        }

        else {
            Response response = hexadecimalTarget
                    .resolveTemplate("number",number)
                    .request().get(Response.class);
            String convertedNumber = response.readEntity(String.class);
            out1.println(convertedNumber);
        }

    }
}