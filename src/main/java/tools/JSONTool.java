package tools;

import net.sf.json.JSONObject;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class JSONTool {

    //获取json实例
    public static JSONObject getInstance(){
        return new JSONObject();
    }

    //将map 中键值对放入json对象中
    public static void putMap(JSONObject json, Map<String,Object> map){
        if(map == null)
            throw new RuntimeException("map is null.");

        Set<String> keys = map.keySet();

        Iterator iterator = keys.iterator();
        while (iterator.hasNext()) {
            String key = (String) iterator.next();
            json.put(key , map.get(key));
        }
    }

}
