# FutureAir

<br>

### ✔ Project Schedule

2022.01.10 - 2022.02.28 - ing

<br><br>

### ✔ Technology Stack
- Design - AdobeXd, Figma, Photoshop, Illustration
- Frontend - Javascript
- Backend - Spring
- Database - Oracle(mybatis)
- Deployment - AWS

<br><br>

### ✔ Project Outline

Future Air is an airline website consisting of main page and admin page

<br>

⭐ Description

<a href="https://drive.google.com/file/d/1KyrHD26Puyi6UNcJ6drwaJwf-QXvhKp5/view"><img alt="GitHub" src ="https://img.shields.io/badge/Japanese-B7472A.svg?&style=for-the-badge&logo=Microsoft PowerPoint&logoColor=white"/></a>

<br>

⭐ Demo

<a href = "http://15.165.189.61:8080/futureair/admin"><img alt="GitHub" src ="https://img.shields.io/badge/Admin Page-181717.svg?&style=for-the-badge&logo=GitHub&logoColor=white"/></a>

Manager can manage services such as reservations, flight schedules, etc
(id = admin, password = 1234)

<br>

<a href = "http://15.165.189.61:8080/futureair/"><img alt="GitHub" src ="https://img.shields.io/badge/Main Page-181717.svg?&style=for-the-badge&logo=GitHub&logoColor=white"/></a>

Customers can use services such as airline ticket reservation and cancellation
(id = future1, password = 1234)

<br>

<br><br>

#### 💻 My Work

##### 1. Web Design / Front-end

Web design, HTML, CSS for the entire page

##### 2. Back-and

Flight reservation, cancellation, My Page, etc. <br>
Dashboards, flight management, reservation management, mail services, etc

##### 3. Server

Build a Web Server Using AWS EC2

<br><br>

### ✔ Reference Site

#### Design Reference

-   [behance](https://www.behance.net/gallery/117127319/Link-Airlines-UXUI-Design)
-   [behance](https://www.behance.net/gallery/83605803/Aeroflot-Russian-Airlines)
-   [behance](https://www.behance.net/gallery/123963877/Airline-Dashboard)
    <br>

#### Code Reference

-   [koreanair](https://www.koreanair.com/kr/ko/in-flight/aircraft)
-   [flyasiana](https://flyasiana.com/C/KR/KO/index)

<br><br>

### ✔ Requirement

#### admin page

##### 1. home

-   管理者ページの home はダッシュボード形式で作成されている。
-   本日の売上高、予約数、飛行日程、訪問者（開発前）を見ることができる。
-   人気路線、年間売上グラフ、予約分析、航空便状況、大陸別シェア、最近の予約状況が一目で分かる。
-   最近の予約状況の予約番号をクリックすると、1-1 の予約情報詳細ポップアップが表示される。
    <br>

![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbKQNk6%2Fbtrw5PFwhOM%2FqXjkiIBuJa6f8p55WeAk7k%2Fimg.jpg)

1-1 Detail user infomation

-   会員の情報が一目で分かるポップアップだ。
-   会員情報、予約内訳、予約内訳詳細、マイレージページで構成されている。

User Infomatin
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FCcSWC%2FbtrwXzqrVJ4%2F22l3Il5i3KNIUxGLzTI2vK%2Fimg.jpg)

User booking List
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fs0H53%2FbtrwLbD52Ko%2FpRP96SkKaGeoTcArHiGVF0%2Fimg.jpg)

User booking Details
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbpVeR0%2Fbtrw5QLqy9W%2FzC4JuJxErU5uRNZypyjeI1%2Fimg.jpg)

User mileage
![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcZOZtu%2FbtrwTOhQbhK%2Frv3b7mTcNxmUO2RdqaTYaK%2Fimg.jpg)
<br><br>

##### 2. Flight schedule

-   出発日、出発地、到着地、便名を利用して検索することができる。
-   デフォルトで出発日が今日から 1 年後までと設定されている。
-   2-2.飛行追加をクリックしてフライトスケジュールを追加することができる。
-   便名をクリックすると、2-1.フライト情報ページに移動され、残りの座席、価格などの情報と予約情報を確認、キャンセルができる。
-   アクション機能により修正·削除することができる。
    <br>

![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcUxWFY%2FbtrwZZoJcVc%2FN9kZ0l5VFKbl3zlEoWdBA1%2Fimg.png)

##### 2-1. Flight Infomation

![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbRJkfg%2Fbtrw2NuQSTm%2FC3INcnIm9xFml6FiVKFHn0%2Fimg.jpg)

##### 2-2. Add flight / Edit flight

![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqSCyk%2FbtrwT1tOYh4%2FRFJp8YkxfEmv8u01R6BWQK%2Fimg.jpg)

<br><br>

##### 3. Booking status

-   出発日、予約日、予約者、予約番号を利用して予約を検索することができる。
-   アクションを利用して予約をキャンセルさせることができる。
-   予約番号をクリックすると、1-1 の予約詳細につながる。
    <br>

![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FPT4dE%2FbtrwK90slEy%2FOCBxx8JfzuvKS0O5Jc9qnK%2Fimg.jpg)

<br><br>

##### 4. User information

-   名前、ID、メール、電話番号、性別、会員レベルを利用して会員を検索することができる。
-   アクションの 4-1.修正を利用して会員情報を修正することができる。 (削除機能は修正中)
-   ID をクリックすると 1-1.会員情報ポップアップウィンドウが表示される。
    ![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbo2kPb%2FbtrxsCTEIC5%2FWbHonvVmEoud1D2WeNqyGk%2Fimg.png)

<br>

##### 4-1. Edit user

![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbwKCf7%2Fbtrxrc8Mt2a%2FmVcMfroJkyo00FaTXaP5rK%2Fimg.jpg)

<br><br>

##### 5. User grade Infomation

-   会員レベルの情報を見ることができ、5-1 レベルの追加ボタンを押してレベルを追加することもできる。
-   会員レベルを削除すると、レベル条件を基準に 1 段階低い段階に該当レベルの会員を移動させ、レベルを削除する。
    ![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbkrWFD%2Fbtrxlq1iond%2FpyVCruuosaW9TP0cAHRqA1%2Fimg.png)

<br>

##### 5-1. Create user grade

![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbvS4UP%2FbtrxkMpYBte%2FPuIUkCKuHLabKsPrFr3pZ1%2Fimg.jpg)

##### 5-2. Edit user grade

![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbbHtKy%2FbtrxsExdt0V%2FruVwfyNVKckhxtGOHiaeg0%2Fimg.jpg)

##### 5-3. Add mileage

![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fr1dMr%2FbtrxoXjZwhz%2FwYP7gnHQg0DEwtYqpS4S21%2Fimg.jpg)

##### 5-4. Grade change

![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbRdQmT%2FbtrxoV0MWx7%2FkY1ejwhphAhv29AjozGJ8K%2Fimg.jpg)
<br><br>

##### 6. Send mail

-   自動メールの設定は、会員が各メール項目を実行した際に機能がチェックされている場合は、自動的にメールを送る機能を持つ。
-   自動メール設定の 6-1.修正、6-2.プレビューをクリックして状態を変更·確認できる。
-   大量メールの発送は、全会員または会員レベル別に団体メールを発送できる。
    ![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fcxf0F7%2Fbtrxt1r8baR%2FHFV9QlCLL1KVpHKR8NUifk%2Fimg.png)

<br>

##### 6-1. Modify automatic mail

![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fb22Hpc%2FbtrxmAvNWIK%2FaK3cBPowIx53ntQgALKqq0%2Fimg.jpg)

##### 6-2. Preview automatic mail

![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FVzmp1%2Fbtrxu9XM0pr%2FHXQpR63nTwbG1PfdwMf55k%2Fimg.jpg)

<br><br>

##### 7. Post management

-   作成日、ボード、回答状態、検索語を利用してポストを検索することができる。
-   アクションの 7-2 修正、削除機能を利用して修正および削除ができる。
-   返答可能なボードの場合、返答状態と 7-2.返答機能が見える。
    ![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fb3Lqgq%2FbtrxsDyhfuw%2FYZ1ICZtBx8x6yh2mMK4yo1%2Fimg.png)

<br>

##### 7-1. Post edit

![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbS2IJi%2Fbtrxmz4KAnS%2FJy2aBuUMtQP25dLl6ejgk0%2Fimg.jpg)

##### 7-2. Post answer

![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fb5Y2AJ%2FbtrxkflFsLj%2FkUgI5SAjplwm6PwsmZdCAk%2Fimg.jpg)

<br><br>

##### 8. Board settings

-   ボード名、ポスト数、ボード管理などのボード情報が見られるページである。
-   7-1.ボード追加によりボードを追加することができる。
-   7-2.ボード修正によりボード情報を修正することができる。
-   ボードを削除すると、そのボードのポストも削除される。
-   ボード管理のポスト表示を押すと、当該ボードの検索フィルターがかかったポスト管理ページに移動される。
-   7-3.ボード管理のポスト作成を押すと、当該ボードの新ポストを作成することができる。
-   7-4.固定ポスターを押すとポップアップが表示され、固定ポスターの追加·解除が可能。
    ![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FENWyp%2Fbtrxt16J5zN%2FlvzIseBe0t8dkjy0Pa33N1%2Fimg.png)

<br>

##### 7-1. Create board

![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbilm1I%2Fbtrxu9DtYPz%2FXG8YupKfS3BI478MAeX0a1%2Fimg.jpg)

##### 7-2. Edit board

![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FD1kDG%2FbtrxkMcr9QC%2FvYFJUAJOhCPOmlDTstOLLk%2Fimg.jpg)

##### 8-3. Post on the board

![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fc8kGLu%2FbtrxoVNe1GK%2FCUSF9q8RSuJgzjufe72BU0%2Fimg.jpg)

##### 8-3. Notice setting

![관리자페이지](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fx3AyP%2Fbtrxt004z46%2FfuijQt8h5KRN2VQYv8uCRK%2Fimg.jpg)

### ✔ Specificity

<br><br>

### ✔ Areas for Improvement

-   [ ] メインページの航空券予約メソッド作成。
-   [ ] 管理者ページ home の今日の総訪問者数が見えるようにする。
-   [ ] 管理者ページ会員情報の会員情報を削除する際、テーブル参照問題を解決する。
-   [ ] 管理者ページ会員レベルのマイレージ一括積み立て、レベル一括変更コードの作成。
-   [ ] 管理者ページメール送信の自動メール設定のプレビュー時、デフォルト CSS が適用される部分を修正する。
-   [ ] 管理者ページメール送信の大量メール送信完了時、完了メッセージを表示させるようにする。
