package tools;

import com.helloblog.domain.Article;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class CollectionTools {

    //向collection中加入所有的collections
    public static <T> void addCollections(Collection<T> collection ,Collection<T>[] collections){
        for (Collection<T> c :
                collections) {
            for (T t :
                    c) {
                if(!isExit(collection,t)){
                    collection.add(t);
                }
            }
        }
    }

    //这里比较可以从写other的equals方法实现自己的业务逻辑
    public static <T> boolean isExit(Collection<T> collection,T other) {
        for (T t :
                collection) {
            if(t.equals(other)){
                return true;
            }
        }
        return false;
    }

    public static void main(String[] args) {
        List<Article> a1 = new ArrayList<>();
        List<Article> a2 = new ArrayList<>();

        Article x1 = new Article();
        Article x2 = new Article();
        Article x3 = new Article();
        x1.setArtid(111);
        x2.setArtid(222);
        x3.setArtid(333);

        a1.add(x1);
        a1.add(x2);
        a2.add(x2);
        a2.add(x3);

        List<Article> a3 = new ArrayList<>();
        CollectionTools.addCollections(a3,new Collection[]{a1,a2});

        for (Article a:
                a3) {
            System.out.println(a.getArtid());

        }
        System.out.println(a3.size());
    }

}
