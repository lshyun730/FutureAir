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

##### 4. 회원정보
- 이름, 아이디, 이메일, 전화번호, 성별, 등급을 이용하여 고객을 검색할 수 있다.
- 액션의 4-1.수정을 이용하여 고객정보를 수정할 수 있다. (삭제기능은 수정중)
- 아이디를 클릭하면 1-1.회원정보 팝업창이 뜬다
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbo2kPb%2FbtrxsCTEIC5%2FWbHonvVmEoud1D2WeNqyGk%2Fimg.png)

<br>

##### 4-1. 회원수정
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbwKCf7%2Fbtrxrc8Mt2a%2FmVcMfroJkyo00FaTXaP5rK%2Fimg.jpg)

<br><br>

##### 5. 회원등급
- 회원등급 정보를 볼 수 있으며 5-1.등급추가 버튼을 눌러 등급을 추가할 수도있다.
- 회권등급을 삭제하면 승급조건을 기준으로 한단계 낮은 단계로 해당등급의 회원을 이동시키며 등급을 삭제한다.
- 회원등급별 회원관리를 통하여 5-3.마일리지 일괄적립 및 5-4.등급변경을 할 수 있다. (개발전)
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbkrWFD%2Fbtrxlq1iond%2FpyVCruuosaW9TP0cAHRqA1%2Fimg.png)

<br>

##### 5-1. 회원등급추가
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbvS4UP%2FbtrxkMpYBte%2FPuIUkCKuHLabKsPrFr3pZ1%2Fimg.jpg)
##### 5-2. 회원등급수정
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbbHtKy%2FbtrxsExdt0V%2FruVwfyNVKckhxtGOHiaeg0%2Fimg.jpg)
##### 5-3. 마일리지일괄적립
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fr1dMr%2FbtrxoXjZwhz%2FwYP7gnHQg0DEwtYqpS4S21%2Fimg.jpg)
##### 5-4. 등급변경
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbRdQmT%2FbtrxoV0MWx7%2FkY1ejwhphAhv29AjozGJ8K%2Fimg.jpg)
<br><br>

##### 6. 메일발송
- 자동메일 설정은 고객이 각 메일항목을 실행했을 때 상태가 체크되어 있다면 자동으로 메일을 보내주는 기능을 한다.
- 자동메일 설정의 6-1.수정하기, 6-2.미리보기를 클릭하여 상태를 변경 및 확인할 수 있다.
- 대량메일 발송은 젠체회원 혹은 회원등급 별로 단체 메일을 발송할 수 있다. 
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fcxf0F7%2Fbtrxt1r8baR%2FHFV9QlCLL1KVpHKR8NUifk%2Fimg.png)

<br>

##### 6-1. 자동메일 수정하기
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fb22Hpc%2FbtrxmAvNWIK%2FaK3cBPowIx53ntQgALKqq0%2Fimg.jpg)
##### 6-2. 자동메일 미리보기
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FVzmp1%2Fbtrxu9XM0pr%2FHXQpR63nTwbG1PfdwMf55k%2Fimg.jpg)

<br><br>

##### 7. 게시물관리
- 작성일, 게시판, 답변상태, 검색어를 이용하여 게시물을 검색할 수 있다.
- 액션의 7-2수정, 삭제기능을 수정 및 삭제를 할 수 있다.
- 답변가능한 게시판일 경우 답변상태와 7-2.답변하기 기능이 보인다. 
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fb3Lqgq%2FbtrxsDyhfuw%2FYZ1ICZtBx8x6yh2mMK4yo1%2Fimg.png)

<br>

##### 7-1. 게시글 수정
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbS2IJi%2Fbtrxmz4KAnS%2FJy2aBuUMtQP25dLl6ejgk0%2Fimg.jpg)
##### 7-2. 답변하기
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fb5Y2AJ%2FbtrxkflFsLj%2FkUgI5SAjplwm6PwsmZdCAk%2Fimg.jpg)

<br><br>

##### 8. 게시판설정
- 게시판이름, 글갯수, 게시판 관리등의 게시판 정보를 볼 수 있는 페이지이다.
- 7-1.게시판 추가를 통하여 게시판을 추가할 수 있다.
- 7-2.게시판 수정을 통하여 게시판 정보를 수정할 수 있다.
- 게시판을 삭제할 시 해당게시판의 게시물도 같이 삭제된다
- 게시판관리의 글보기를 누르면 해당 게시판의 검색필터가 걸린 게시물관리 페이지로 이동된다.
- 7-3.게시판관리의 글쓰기를 누르면 해당 게시판의 새글을 작성할 수 있다.
- 7-4.공지글을 누르면 공지글 팝업이 뜨며 공지글 추가 및 해제가 가능하다.
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FENWyp%2Fbtrxt16J5zN%2FlvzIseBe0t8dkjy0Pa33N1%2Fimg.png)

<br>

##### 7-1. 게시판 추가
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbilm1I%2Fbtrxu9DtYPz%2FXG8YupKfS3BI478MAeX0a1%2Fimg.jpg)
##### 7-2. 게시판 수정
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FD1kDG%2FbtrxkMcr9QC%2FvYFJUAJOhCPOmlDTstOLLk%2Fimg.jpg)
##### 8-3. 게시판 글쓰기
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fc8kGLu%2FbtrxoVNe1GK%2FCUSF9q8RSuJgzjufe72BU0%2Fimg.jpg)
##### 8-3. 게시판 공지글
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fx3AyP%2Fbtrxt004z46%2FfuijQt8h5KRN2VQYv8uCRK%2Fimg.jpg)


### ✔ Specificity
<br><br>

### ✔ Areas for Improvement
- [ ] 메인페이지의 항공권 예약 메소드 작성하기
- [ ] 관리자페이지 홈의 오늘의 총 방문자 수가 보이도록 하기
- [ ] 관리자페이지 회원정보의 회원정보 삭제 시 참조 테이블 문제 해결하기
- [ ] 관리자페이지 회원등급의 마일리지 일괄적립, 등급변경 코드 작성
- [ ] 관리자페이지 메일발송의 자동메일 설정의 미리보기시 디폴트 CSS 가 적용되는 부분 수정하기
- [ ] 관리자페이지 메일발송의 대량메일 발송 완료 시 완료 메세지 뜨게 하기

