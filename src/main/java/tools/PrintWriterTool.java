package tools;

import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class PrintWriterTool {

    //向服务端发送json对象
    public static void sendJSON(HttpServletResponse response, JSONObject json){
        response.setCharacterEncoding("utf-8");
        PrintWriter printWriter = getPrintWriter(response);
        printWriter.print(json);
    }

    public static PrintWriter getPrintWriter(HttpServletResponse response){
        PrintWriter printWriter = null;
        try {
            printWriter = response.getWriter();
        } catch (IOException e) {
            System.out.println("获取客服端流失败");
            e.printStackTrace();
        }
        return printWriter;
    }

    //向服务端发送json对象
    public static void sendMessage(HttpServletResponse response, Object object){
        PrintWriter printWriter = getPrintWriter(response);
        response.setCharacterEncoding("utf-8");
        printWriter.print(object);
    }

}
