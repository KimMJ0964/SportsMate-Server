package com.kh.sportsmate.common.template;

import com.kh.sportsmate.common.vo.PageInfo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

/**
 * packageName    : com.kh.sportsmate.common.template
 * fileName       : Template
 * author         : jun
 * date           : 2024. 11. 7.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 7.        jun       최초 생성
 */
public class Template {
    /**
     * @param listCount   총 게시글 수
     * @param currentPage 현재페이지
     * @param pageLimit   하단에 보여질 페이징바의 수
     * @param boardLimit  한페이지에 보여질 게시글 최대 수
     * @return PageInfo 객체
     */
    public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
        int maxPage = (int) Math.ceil((double) listCount / boardLimit);
        int startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
        int endPage = startPage + pageLimit - 1;
        endPage = (endPage > maxPage) ? maxPage : endPage;
        return new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
    }

    public static String saveFile(MultipartFile upfile, HttpSession session, String path) {
        //파일원본명
        String originName = upfile.getOriginalFilename();

        //확장자
        String ext = originName.substring(originName.lastIndexOf("."));

        //년월일시분초
        String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

        //5자리 랜덤값
        int randNum = (int) (Math.random() * 90000) + 10000;

        String changeName = currentTime + "_" + randNum + ext;

        //첨부파일 저장할 폴더의 물리적 경로
        String savePath = session.getServletContext().getRealPath(path);

        try {
            upfile.transferTo(new File(savePath + changeName));
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }

        return changeName;
    }

    // API에 GET 요청 보낸 후 응답을 받아오는 메서드
    public static String get(String apiURL, Map<String, String> requestHeaders) {
        HttpURLConnection conn = connect(apiURL);

        try {
            conn.setRequestMethod("GET"); // 요청 메서드 변경
            for (Map.Entry<String, String> header : requestHeaders.entrySet()) { // map은 이터레이터를 상속받을 수없기 때문에(순서가 없음)
                conn.setRequestProperty(header.getKey(), header.getValue());
            }
            int responseCode = conn.getResponseCode();
            if (responseCode == 200) {
                return readBody(conn.getInputStream());
            }
            return null;
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("API요청을 통한 응답 실패 : " + e);
        }
    }

    // API에 연결하기 위한 HttpURLConnection 객체 생성 후 반환
    public static HttpURLConnection connect(String apiUrl) {

        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection) url.openConnection(); // 요청 연결
        } catch (MalformedURLException e) {
            e.printStackTrace();
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("연결에 실패하였습니다. : " + apiUrl, e);
        }
    }

    public static String readBody(InputStream bodyInput) {
        String inputLine;
        StringBuffer res;
        try (BufferedReader br = new BufferedReader(new InputStreamReader(bodyInput))) {
            res = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                res.append(inputLine);
            }

        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("바디정보를 읽는데 실패하였습니다. ", e);
        }
        return res.toString();
    }
}
