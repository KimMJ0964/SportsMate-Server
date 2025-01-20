# [SportsMate] 스포츠 구단 매칭 웹사이트

## 목차

1. [프로젝트 소개](#프로젝트-소개)  
2. [개발 환경 및 기술 스택](#개발-환경-및-기술-스택)  
3. [화면 구성](#화면-구성)  

---

## 프로젝트 소개

**SportsMate**는 스포츠(축구, 농구, 풋살, 야구) 활동을 즐기는 사람들을 연결해주는 플랫폼입니다.  
사용자가 팀을 구성해서 경기를 해야하는 팀 스포츠 중 대표적인 축구, 풋살, 농구, 야구 종목의 팀 구성 부터 경기를 진행할 구장 대여, 각 팀끼리 경기를 매칭시켜주는 기능 제공

### 팀원 구성
- **이철규**: PM
- **강주원**: 일정관리자
- **김민재**: DBA
- **김현준**: 이슈관리자
- **이명건**: 형상관리자

### 역할
- **이철규**: 대관 승인, 대관 거절, 경기 리스트, 구장정보 수정, 구장정보 탈퇴, 문의
- **강주원**: 회원가입, 로그인(네이버, 카카오), 비밀번호 찾기, 구단 창설, 구단 가입 신청, 경기 결과 입력, 경고 사유 등록
- **김민재**: 마이페이지, 커뮤니티, 전적페이지, 구단 미니 홈피
- **김현준**: 대관 결제, 결제 성공 / 실패, 사이트 관리자 페이지, 차단 유저 관리, 신고 관리
- **이명건**: 구장 페이지, 팀 랭킹 페이지

### 주요 기능
- **스포츠 팀 매칭**: 원하는 팀을 선택하고 매칭을 신청.
- **마이페이지**: 개인 기록, 소속 클럽, 신청 내역 관리.
- **커뮤니티**: 사용자들 간의 소통 공간 제공.
- **구단 미니 홈피**: 구단 관리 및 구단원들 간의 소통 공간 제공.
- **전적페이지**: 사용자의 전적 조회.
- **구장페이지**: 구장 조회 및 예약.
- **랭킹페이지**: 구단 랭킹 조회.
- **구단 메뉴 페이지**: 구단 생성 및 단원 모집.

---

## 개발 환경 및 기술 스택

### 개발 환경

- **운영체제:**  
  <img src="https://img.shields.io/badge/Windows%2010-0078D6?style=for-the-badge&logo=Windows&logoColor=white">
  <img src="https://img.shields.io/badge/macOS-000000?style=for-the-badge&logo=apple&logoColor=white">

- **IDE:**  
  <img src="https://img.shields.io/badge/Visual%20Studio%20Code-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white">
  <img src="https://img.shields.io/badge/IntelliJ%20IDEA-000000?style=for-the-badge&logo=intellijidea&logoColor=white">

- **형상 관리:**  
  <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white">
  <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white">
  <img src="https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=notion&logoColor=white">
  <img src="https://img.shields.io/badge/Discord-5865F2?style=for-the-badge&logo=discord&logoColor=white">

### 기술 스택
### Stacks

- <img src="https://img.shields.io/badge/Server-%23121011?style=for-the-badge">
  <img src="https://img.shields.io/badge/ApacheTomcat-F8DC75?style=for-the-badge&logo=ApacheTomcat&logoColor=black">
  
- <img src="https://img.shields.io/badge/Frontend-%23121011?style=for-the-badge">

  <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white">
  <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=CSS3&logoColor=white">
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=black">
  <img src="https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jQuery&logoColor=white">

- <img src="https://img.shields.io/badge/Backend-%23121011?style=for-the-badge">
  <img src="https://img.shields.io/badge/JSP-007396?style=for-the-badge&logo=Java&logoColor=white">
  <img src="https://img.shields.io/badge/Java-%23ED8B00?style=for-the-badge&logo=openjdk&logoColor=white">
  <img src="https://img.shields.io/badge/MyBatis-BF0D3E?style=for-the-badge">
  <img src="https://img.shields.io/badge/JSTL-007396?style=for-the-badge&logo=Java&logoColor=white">
  <img src="https://img.shields.io/badge/GSON-FFCA28?style=for-the-badge">
  <img src="https://img.shields.io/badge/Guava-34A853?style=for-the-badge">

- <img src="https://img.shields.io/badge/UI Framework-%23121011?style=for-the-badge">
  <img src="https://img.shields.io/badge/Bootstrap-7952B3?style=for-the-badge&logo=Bootstrap&logoColor=white">

### Database
- <img src="https://img.shields.io/badge/Database-%23121011?style=for-the-badge">
  <img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=MySQL&logoColor=white">

---

## 논리적 모델링

https://www.erdcloud.com/d/KRtu99yQC76YKd3iL
![erd](https://github.com/user-attachments/assets/679684e6-43b9-487a-a4e2-032be899ebb7)

---

## 화면 구성

| **페이지**                    | **기능**                                                                                                                                                            | **이미지**                    |
|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------|
| **로그인 페이지**              | - 로그인<br>- 회원가입<br>- 아이디/비밀번호 찾기                                                                                                                  | ![로그인](https://github.com/user-attachments/assets/6d43a270-b261-4f81-a5c0-1756d3b70566) |
| **메인 페이지**                | - 실시간 랭킹<br>- 지역 전적 확인<br>- 현재 진행 중인 매칭                                                                                                        | ![메인](https://github.com/user-attachments/assets/7d7d4b16-372e-4f2c-b362-66290e0317e1) |
| **마이페이지**                 | - 내 정보 출력 및 수정<br>- 내 전적 확인<br>- 내 소속 구단 및 입단 신청 목록<br>- 문의 내역                                                                         | ![마이페이지](https://github.com/user-attachments/assets/853cc6f0-62e7-4681-aef9-041d13368ecd) |
| **사이트 관리자 페이지**       | - 대관 결제 (성공/실패)<br>- 차단 유저 및 신고 관리                                                                                                              | ![사이트 관리자](https://github.com/user-attachments/assets/0c8b2e07-e44f-41cd-af1b-72322f85143d) |
| **구장 관리자 페이지**         | - 대관 승인/거절<br>- 경기 리스트 및 결과 입력<br>- 구장 정보 수정/탈퇴<br>- 문의 및 경고 사유 등록                                                               | ![구장 관리자](https://github.com/user-attachments/assets/3406b5f3-5ed2-4bbe-9215-3714d70883ef) |
| **커뮤니티**                   | - 게시판 및 댓글 기능<br>- 게시판 및 댓글 신고 기능                                                                                                               | ![커뮤니티](https://github.com/user-attachments/assets/f6d20d2d-e579-40d1-852d-fa8353b179eb) |
| **구단 미니홈피**              | - 커뮤니티 기능<br>- 구단원 목록 출력<br>- 구단 투표<br>- 구단 및 매치 관리                                                                                       | ![구단 미니홈피](https://github.com/user-attachments/assets/1e64761e-92a0-4f34-94fb-cfdcc6f736a9) |
| **구단 메뉴 페이지**           | - 구단 창설<br>- 가입 신청                                                                                                                                       | ![구단 메뉴](https://github.com/user-attachments/assets/19e5a772-cdb7-4bf5-b0fa-a2d5bb6f8d24) |
| **구장 페이지**                | - 구장 조회 및 예약                                                                                                                                               | ![구장](https://github.com/user-attachments/assets/67df3ce5-a45c-4e09-855f-96e0b0ee2831) |
| **랭킹 페이지**                | - 구단 랭킹 확인                                                                                                                                                 | ![랭킹](https://github.com/user-attachments/assets/bb4665ce-555d-41db-8272-d975b42bf727) |

---
