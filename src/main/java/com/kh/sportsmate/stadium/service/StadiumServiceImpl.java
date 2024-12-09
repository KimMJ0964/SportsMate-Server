package com.kh.sportsmate.stadium.service;

import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.stadium.model.dao.StadiumDao;
import com.kh.sportsmate.stadium.model.dto.QnaRequestDto;
import com.kh.sportsmate.stadium.model.dto.StadiumDetail;
import com.kh.sportsmate.stadium.model.dto.StadiumDetailmodal;
import com.kh.sportsmate.stadium.model.dto.StadiumQnaDto;
import com.kh.sportsmate.stadium.model.dto.StadiumReviewDto;
import com.kh.sportsmate.stadium.model.dto.StadiumSearch;
import com.kh.sportsmate.stadium.model.dto.WeatherResponse;
import com.kh.sportsmate.stadium.model.vo.StadiumQna;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class StadiumServiceImpl implements StadiumService{

	@Autowired
	private final SqlSessionTemplate sqlSession;
	
	@Autowired
	private final StadiumDao stadiumDao;

	@Override
	public int getSearchResultCount(String stadiumName, String stadiumAddress, String stadiumCategory,
			String stadiumStartTime, String stadiumEndTime, String selectedDate, String activityArea) {
		 Map<String, Object> params = new HashMap<>();
		    params.put("stadiumName", stadiumName);
		    params.put("stadiumAddress", stadiumAddress);
		    params.put("stadiumCategory", stadiumCategory);
		    params.put("stadiumStartTime", stadiumStartTime);
		    params.put("stadiumEndTime", stadiumEndTime);
		    params.put("selectedDate", selectedDate);
		    params.put("activityArea", activityArea);
		    return stadiumDao.getSearchResultCount(sqlSession, params);
	}

	@Override
	public List<StadiumSearch> getPaginatedStadiums(PageInfo pi, String stadiumName, String stadiumAddress,
			String stadiumCategory, String stadiumStartTime, String stadiumEndTime, String selectedDate, String activityArea) {
		 Map<String, Object> params = new HashMap<>();
		    params.put("stadiumName", stadiumName);
		    params.put("stadiumAddress", stadiumAddress);
		    params.put("stadiumCategory", stadiumCategory);
		    params.put("stadiumStartTime", stadiumStartTime);
		    params.put("stadiumEndTime", stadiumEndTime);
		    params.put("selectedDate", selectedDate);
		    params.put("activityArea", activityArea);

		    // 페이징 정보 추가
		    params.put("startRow", (pi.getCurrentPage() - 1) * pi.getBoardLimit());
		    params.put("boardLimit", pi.getBoardLimit());

		    return stadiumDao.getPaginatedStadiums(sqlSession, params);
	}

	@Override
	public StadiumDetail getStadiumDetail(int stadiumNo) {
		return stadiumDao.getStadiumDetail(sqlSession, stadiumNo);
	}

	@Override
	public List<StadiumReviewDto> getPagedReviewsByStadiumNo(int stadiumNo, int currentPage, int boardLimit) {
		int offset = (currentPage - 1) * boardLimit;
		return stadiumDao.selectReviewsByStadiumNo(sqlSession, stadiumNo, offset, boardLimit);
	}

	@Override
	public int getReviewCount(int stadiumNo) {
		return stadiumDao.selectReviewCountByStadiumNo(sqlSession, stadiumNo);
	}

	@Override
	public List<StadiumDetailmodal> getStadiumReservation(int teamNo) {
		return stadiumDao.StadiumReservation(sqlSession, teamNo);
	}
	
	@Override
    public List<StadiumDetailmodal> getPendingMatches(int teamNo) {
        return stadiumDao.getPendingMatches(sqlSession, teamNo);
    }

	@Override
	public int getTeamNoByMemNo(int memNo) {
		return stadiumDao.getTeamNoByMemNo(sqlSession, memNo);
	}
	
	@Override
	public boolean insertQna(StadiumQnaDto stadiumQnaDto) {
	    int result = stadiumDao.insertQna(sqlSession, stadiumQnaDto);
	    return result > 0;
	}

	@Override
	public int selectInquiryCount(int memNo) {
		return stadiumDao.selectInquiryCount(sqlSession, memNo);
	}

	@Override
	public ArrayList<StadiumQna> inquiryList(int memNo, PageInfo pi) {
		return stadiumDao.inquiryList(sqlSession, memNo, pi);
	}

	@Override
	public int inquiryUpdate(StadiumQna sq) {
		return stadiumDao.inquiryUpdate(sqlSession, sq);
	}

	@Override
	public List<WeatherResponse> getWeatherByAddress(String address) {
		List<WeatherResponse> weatherList = new ArrayList<>();

	    try {
	        // 공공 데이터 API 요청 URL
	        String apiUrl = "https://api.weatherapi.com/v1/forecast.json"; // 예시 URL
	        String apiKey = "YOUR_API_KEY"; // 실제 API 키를 사용하세요
	        String fullUrl = String.format("%s?key=%s&q=%s&days=7", apiUrl, apiKey, address);

	        // HTTP 요청
	        URL url = new URL(fullUrl);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");

	        // 응답 처리
	        if (conn.getResponseCode() == 200) {
	            InputStreamReader reader = new InputStreamReader(conn.getInputStream());
	            JsonObject jsonResponse = JsonParser.parseReader(reader).getAsJsonObject();

	            // 날씨 데이터 파싱
	            JsonArray forecastDays = jsonResponse.getAsJsonObject("forecast").getAsJsonArray("forecastday");
	            for (JsonElement day : forecastDays) {
	                JsonObject dayObj = day.getAsJsonObject();

	                // JSON 데이터 읽기
	                String date = dayObj.get("date").getAsString();
	                String condition = dayObj.getAsJsonObject("day").getAsJsonObject("condition").get("text").getAsString();
	                double minTemp = dayObj.getAsJsonObject("day").get("mintemp_c").getAsDouble();
	                double maxTemp = dayObj.getAsJsonObject("day").get("maxtemp_c").getAsDouble();
	                int conditionCode = mapConditionToCode(condition); // 날씨 코드 매핑

	                // WeatherResponse 객체 생성
	                WeatherResponse weatherResponse = new WeatherResponse();
	                weatherResponse.setDate(date);
	                weatherResponse.setDayOfWeek(convertToDayOfWeek(date));
	                weatherResponse.setCondition(condition);
	                weatherResponse.setMinTemp(minTemp);
	                weatherResponse.setMaxTemp(maxTemp);
	                weatherResponse.setIcon(getWeatherIcon(conditionCode));

	                weatherList.add(weatherResponse);
	            }
	        } else {
	            throw new RuntimeException("Failed to fetch weather data: " + conn.getResponseMessage());
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw new RuntimeException("Error occurred while fetching weather data.", e);
	    }

	    return weatherList;
	}

	// 요일 변환 메서드
	private String convertToDayOfWeek(String date) {
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    LocalDate localDate = LocalDate.parse(date, formatter);
	    DayOfWeek dayOfWeek = localDate.getDayOfWeek();
	    return dayOfWeek.getDisplayName(TextStyle.SHORT, Locale.KOREAN); // "월", "화", ...
	}

	// 날씨 코드 매핑 메서드
	private int mapConditionToCode(String condition) {
	    if (condition.contains("맑음")) return 1;
	    if (condition.contains("구름 조금")) return 2;
	    if (condition.contains("구름 많음")) return 3;
	    if (condition.contains("흐림")) return 4;
	    if (condition.contains("비")) return 5;
	    if (condition.contains("눈") && condition.contains("비")) return 6;
	    if (condition.contains("눈")) return 7;
	    return 0; // 알 수 없음
	}

	// 아이콘 매핑 메서드
	private String getWeatherIcon(int weatherCode) {
	    switch (weatherCode) {
	        case 1: return "/resources/images/weather/sunny.png";      // 맑음
	        case 2: return "/resources/images/weather/partly_cloudy.png"; // 구름 조금
	        case 3: return "/resources/images/weather/cloudy.png";     // 구름 많음
	        case 4: return "/resources/images/weather/overcast.png";   // 흐림
	        case 5: return "/resources/images/weather/rain.png";       // 비
	        case 6: return "/resources/images/weather/rain_snow.png";  // 비/눈
	        case 7: return "/resources/images/weather/snow.png";       // 눈
	        default: return "/resources/images/weather/unknown.png";   // 알 수 없음
	    }
	}

}
