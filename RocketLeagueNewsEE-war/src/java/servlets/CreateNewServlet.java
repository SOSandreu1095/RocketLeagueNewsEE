/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.rocket.entities.News;
import com.rocket.session.NewsFacade;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;
import javax.ejb.EJB;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Andreu
 */
@MultipartConfig
public class CreateNewServlet extends HttpServlet {

    private static final Pattern NONLATIN = Pattern.compile("[^\\w-]");
    private static final Pattern WHITESPACE = Pattern.compile("[\\s]");

    @EJB
    private NewsFacade newsFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        //Request sserver context get path etc
        try {
            String username = request.getRemoteUser();
            String title = request.getParameter("titlenew");
            String description = request.getParameter("description");

            Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
            InputStream fileContent = filePart.getInputStream();

            News n = new News();
            n.setTitle(title);
            n.setDescription(description);
            n.setUsername(username);
            n.setDate(new Date());

            String slug = toSlug(title);
            int indSlug = 1;
            while (newsFacade.slugExists(slug + "-" + indSlug)) {
                indSlug++;
            }
            n.setSlug(slug + "-" + indSlug);

            newsFacade.create(n);

            //Ahora guardar la imagen
            BufferedImage image = ImageIO.read(fileContent);
            String path = request.getServletContext().getRealPath("")
                    + File.separator + "img" + File.separator + "uploads" + File.separator + n.getId() + ".png";

            File outputFile = new File(path);
            //Escribimos sobre el fichero la imagen tipo png
            ImageIO.write(resizeBufferedImage(image, 720, 480), "png", outputFile);

            Map<String, String> mess = new HashMap<>();
            mess.put("mess", "New Addedd");

            Gson gson = new GsonBuilder().create();
            response.setContentType("application/json");
            PrintWriter pw = response.getWriter();
            pw.println(gson.toJson(mess));

        } catch (Exception e) {
            Map<String, String> emess = new HashMap<>();
            emess.put("error", "Server error");

            Gson gson = new GsonBuilder().create();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.setContentType("application/json");
            PrintWriter pw = response.getWriter();
            pw.println(gson.toJson(emess));
        }

    }

    private String toSlug(String input) {
        String nowhitespace = WHITESPACE.matcher(input).replaceAll("-");
        String normalized = Normalizer.normalize(nowhitespace, Form.NFD);
        String slug = NONLATIN.matcher(normalized).replaceAll("");
        return slug.toLowerCase(Locale.ENGLISH);
    }

    private BufferedImage resizeBufferedImage(BufferedImage img, int newW, int newH) {
        Image tmp = img.getScaledInstance(newW, newH, Image.SCALE_SMOOTH);
        BufferedImage dimg = new BufferedImage(newW, newH, BufferedImage.TYPE_INT_ARGB);

        Graphics2D g2d = dimg.createGraphics();
        g2d.drawImage(tmp, 0, 0, null);
        g2d.dispose();

        return dimg;
    }

}
