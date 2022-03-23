# FutureAir
<br>

### ✔ Project Schedule
2022.01.10 - 2022.02.28 - ing

|Goal|Start Date|Done Date|Status|
|-----|-----|-----|-----|
|1. 프로젝트 기획 |2022/01/02|2022/01/16|Done 👌|
|2. 프로토타입 제작&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|2022/01/13|2022/01/16|Done 👌|
|3. 웹 디자인|2022/01/17|2022/01/31|Done 👌|
|4. 프론트엔드 개발|2022/01/21||Working On 💻|
|5. 백엔드개발|2022/01/27||Working On 💻|
|6. 오류 수정 및 개선|||To Do 📌|

<br><br>
### ✔ Technology Stack
Spring, Oracle, Javascript, AdobeXd, Figma, Ajex, Github, AWS   
<br><br>

### ✔ Project Outline
미래항공은 메인페이지와 관리자페이지로 구분되어있는 항공사 웹사이트 팀프로젝트이다. <br>
Future Airはmain pageとadmin pageに分かれている航空会社のウェブサイトだ。<br>

- [MainPage](http://15.165.189.61:8080/futureair/) (id = future1, password = 1234) (doing front-end) <br>
항공권예약 및 캔슬 등의 서비스 이용 / お客様が航空券の予約·キャンセルなどのサービスを利用　<br><br>
- [AdminPage](http://15.165.189.61:8080/futureair/admin) (id = admin, password = 1234) (doing back-end) <br>
관리자가 항공권예약, 비행일정, 게시판 등을 관리 / 未来航空管理者が予約·飛行日程などのサービスを管理 <br>
<br><br>
#### 💻 My Work
##### 1. Web Design /  Front-end
메인페이지와 관리자페이지 전체의 웹디자인, HTML, CSS 작성

##### 2. Back-and
Main page - 항공권예약, 예약취소, 마이페이지 등 / 飛行予約、キャンセル、マイページなど <br>
Admin page - 대시보드, 비행관리, 예약관리, 메일서비스 등 / ダッシュボード、飛行管理、予約管理、メールサービスなど

##### 3. Server
AWS를 이용하여 웹서버를 구축하여 스프링 웹프로젝트를 서비스 / AWSを利用してウェブサーバーを構築し、スプリングウェブプロジェクトをサービス

<br><br>

### ✔ Reference Site
#### Design Reference
- [behance](https://www.behance.net/gallery/117127319/Link-Airlines-UXUI-Design) 
- [behance](https://www.behance.net/gallery/83605803/Aeroflot-Russian-Airlines) 
- [behance](https://www.behance.net/gallery/123963877/Airline-Dashboard) 
<br>

#### Code Reference
- [koreanair](https://www.koreanair.com/kr/ko/in-flight/aircraft) 
- [flyasiana](https://flyasiana.com/C/KR/KO/index) 
- [dashboardpack](https://dashboardpack.com/live-demo-preview/?livedemo=378761) 
<br><br>

### ✔ Requirement

#### 관리자페이지
##### 1. 홈
- 관리자페이지의 홈은 대시보드 형식으로 이루어져있다
- 오늘의 매출액, 예약수, 비행일정, 방문자(개발전) 를 알아볼수있다.
- 인기노선, 년간 매출그래프, 예약분석, 항공편 상황, 대륙별 점유율, 최근예약현황 을 한눈에 알아볼수 있다.
- 최근 예약현황의 예약번호를 클릭 시 1-1의 예약정보 상세 팝업이 뜬다
<br>

![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbKQNk6%2Fbtrw5PFwhOM%2FqXjkiIBuJa6f8p55WeAk7k%2Fimg.jpg)

1-1 상세회원정보
- 회원의 정보를 한눈에 볼 수 있는 팝업이다.
- 회원정보, 예약내역, 예약내역상세, 마일리지 페이지로 구성되어있다

회원정보
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FCcSWC%2FbtrwXzqrVJ4%2F22l3Il5i3KNIUxGLzTI2vK%2Fimg.jpg)

예약내역
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fs0H53%2FbtrwLbD52Ko%2FpRP96SkKaGeoTcArHiGVF0%2Fimg.jpg)

예약내역상세
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbpVeR0%2Fbtrw5QLqy9W%2FzC4JuJxErU5uRNZypyjeI1%2Fimg.jpg)

마일리지
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcZOZtu%2FbtrwTOhQbhK%2Frv3b7mTcNxmUO2RdqaTYaK%2Fimg.jpg)
<br><br>

##### 2. 비행일정
- 출발일, 출발지, 도착지, 비행번호를 이용하여 검색할 수있다.
- 디폴트로 출발일이 오늘부터 일년 후 까지로 설정되어있다.
- 2-2.비행추가를 클릭하여 비행일정을 추가 할 수있다.
- 비행번호를 클릭하면 2-1.비행정보 페이지로 이동되며 남은 좌석 가격등의 정보와 예약정보를 확인, 취소를 할 수있다.
- 액션 기능을 통하여 수정, 삭제를 할수 있다.
<br>

![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcUxWFY%2FbtrwZZoJcVc%2FN9kZ0l5VFKbl3zlEoWdBA1%2Fimg.png)
##### 2-1. 비행정보
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbRJkfg%2Fbtrw2NuQSTm%2FC3INcnIm9xFml6FiVKFHn0%2Fimg.jpg)
##### 2-2. 비행추가 / 비행수정
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqSCyk%2FbtrwT1tOYh4%2FRFJp8YkxfEmv8u01R6BWQK%2Fimg.jpg)

<br><br>

##### 3. 예약현황
- 출발일, 예약일, 예약자, 예약번호를 이용하여 예약을 검색할 수 있다.
- 액션을 이용하여 예약을 취소시킬 수 있다.
- 예약번호를 클릭하면 1-1 의 예약내역 상세로 연결된다.
<br>

![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FPT4dE%2FbtrwK90slEy%2FOCBxx8JfzuvKS0O5Jc9qnK%2Fimg.jpg)

<br><br>

### ✔ Specificity
<br><br>

### ✔ Areas for Improvement
