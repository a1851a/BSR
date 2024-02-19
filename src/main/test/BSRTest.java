import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class BSRTest {

    public static void main(String[] args) {
        try {
            String url = "https://heho.com.tw/archives/category/health-care";
            Document doc = Jsoup.connect(url).get();

            //標題、網址
            Elements webs = doc.select("h5.post-title.is-large a");
            for (Element web : webs) {
                System.out.println(web.text());
                System.out.println(web.attr("href"));
            }
            
            //連結
//            Elements hrefs = doc.select("h5.post-title.is-large a>href");
//            for (Element href : hrefs) {
//                System.out.println(href.text());
//            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
