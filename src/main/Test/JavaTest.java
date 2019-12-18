import net.sf.json.JSONObject;
import org.apache.commons.lang.time.DateUtils;
import org.junit.Test;

import java.awt.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class JavaTest {
    @Test
    public void dateTest() throws ParseException {
        String str = "100~~~asa~~~dau~~~";
        System.out.println(str.replaceAll("~~~","%"));


        List<Integer> a = new ArrayList<>();
        a.add(new Integer(10000));
        System.out.println(a.contains(10000));
        a.add(10000);

        System.out.println(new Integer(10000)==new Integer(10000));


        JSONObject jsonObject = new JSONObject();
        jsonObject.put("username","张山");
        jsonObject.put("password","zhangsan");
        System.out.println(jsonObject);

        System.out.println(new Date(System.currentTimeMillis()));

        String strDate = new String("2019-11-28");
        Date date = DateUtils.parseDate("2019-11-28", new String[]{"yyyy-MM-dd","yyyy/MM/dd"});
        System.out.println(date.getMonth());

        SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-mm-dd" );
        Date date1 = sdf.parse("2019-11-28");
        Date date2 = new Date(System.currentTimeMillis());
        Date date3 = new Date(date1.getTime());
        System.out.println("date1 :  " + date1.getTime());
        System.out.println("date1 :  " + date2.getTime());
        System.out.println(date2.getMonth() + " : " + date2.getDay());
        System.out.println(date1.getMonth() + " : " + date1.getDay());
        System.out.println(date3.getMonth() + " : " + date3.getDay());


    }
}
