package tools;

import java.util.Base64;

public class CodecKitTools {


    /**
     * Java8中的Base64编码
     * @param str
     * @return
     */
    public static String encodeByJava8(String str) {
        try {
            return Base64.getEncoder().encodeToString(str.getBytes("UTF-8"));
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    /**
     * Java8中的Base64解码
     * @param str
     * @return
     */
    public static String decodeByJava8(String str) {
        byte[] result = Base64.getDecoder().decode(str.getBytes());
        return new String(result);
    }
}
