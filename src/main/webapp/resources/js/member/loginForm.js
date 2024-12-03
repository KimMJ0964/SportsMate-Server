const naverLogin= (clientId) =>{
    // const redirectURI = encodeURIComponent(redirectURI); // redirectURL을 UTF-8로 인코딩하여 저장

    // 랜덤한 수 2개를 넣어줘야한다. (36진수로 변환 후 2개 뽑는다.)
    const state = Math.random().toString(36).substring(2);
    let apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    const redirectURI = encodeURIComponent("http://localhost:7777/SportsMate/naver-login");
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;

    location.href = apiURL;
}
const kakaoLogin = (clientId) => {
    const state = Math.random().toString(36).substring(2); // 유니크한 state 값 생성
    let apiURL = "https://kauth.kakao.com/oauth/authorize?";
    apiURL += "client_id=" + clientId;
    apiURL += "&redirect_uri=http://localhost:7777/SportsMate/kakao-login";
    apiURL += "&response_type=code"; // 응답 유형
    apiURL += "&state=" + encodeURIComponent(state); // state 인코딩
    location.href = apiURL; // 최종 URL로 이동
};
