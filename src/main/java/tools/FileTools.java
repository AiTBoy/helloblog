package tools;

import java.io.File;


public class FileTools {
    /**
     * 删除文件夹下所有子文件以及文件夹
     */
    public static void deleteDicrectory(File DIR){

        if(DIR == null || !DIR.exists()){
            return;
        }

        if(DIR.isDirectory()){
            File[] ls = DIR.listFiles();
            if(ls != null){
                for(File file : ls){
                    deleteDicrectory(file);
                }
                DIR.delete();
            }
        }else {
            DIR.delete();
        }
    }
}
