# 지역 기반 공동구매 웹 애플리케이션: 같이사자(togetherlion) 🛒
![로고](https://user-images.githubusercontent.com/99342672/176973278-49bde153-075f-4bef-8170-18aed1276a26.PNG)

🔊 <b>프로젝트를 마치고 제가 담당하지 않았던 부분도 진행하며, 과정을 블로그에 기록했습니다.</b><br>
<b>더 많은 개발 내용과 사이트 UI는 블로그에서도 확인 가능합니다.</b><br>
[(Click!)블로그GO: 같이사자 내용 보러 가기](https://yong-codinglog.tistory.com/category/PROJECT/%EA%B0%99%EC%9D%B4%EC%82%AC%EC%9E%90%28%EA%B3%B5%EB%8F%99%EA%B5%AC%EB%A7%A4%29)

## 📚 기술 스택
- 개발 언어: Java
- 개발 환경: Eclipse
- Front-end: HTML/CSS, JavaScript
- Back-end: Spring Framework, JSP/Servlet, MyBatis
- DB: Oracle

<br>

## 🎤 프로젝트 개요
- 개발 기간: 2022.05.23 ~ 2022.07.29<br>
- 참여 인원: 6명 (김정용, 신시은, 우수정, 이시우, 이아린, 정은정)
- 역할: 팀장
- 담당 파트
  - 카카오지도 API를 활용하여 공동구매 게시물 CRUD 구현
  - 메인 지도에서 거래 지역 선택 시, 지역 별 상품을 볼 수 있도록 처리
  - 공동구매 게시물 댓글기능 및 신고 처리 기능
  - 관리자 및 회원 전체 Front-end
    
<br>

📌 <b>Target</b> : 20,30대 대학생 혹은 1인 가구

📌 <b>Reference Site</b> : 당근마켓(idea), 마켓컬리(UI)

📌 <b>개요</b>: 인터넷 쇼핑을 하다보면, 혼자 사기에 양이 많거나 무료 배송비 기준을 채우느라 굳이 필요 없는 상품을 담았던 적이 있습니다. <br>그래서 소비자들이 상품을 더 합리적/효율적으로 구입할 수 있도록 도움을 주는 웹 애플리케이션을 개발했습니다.

<h3><i>‘아.. 사고는 싶은데 혼자 쓰기에는 너무 많은데..‘</i>, <i>‘아 근처에 누구 같이 살 사람 없나...'</i> 생각하신 적이 있으신가요?!<br><br>
  
그럼 **같이사자**와 함께 **공구**해요~~🎵</h3>

<br>

## 🥝 같이사자의 주요 기능
- 지도에서 거래하고 싶은 지역을 선택하고, 선택한 지역에서 진행 중인 공동구매를 확인할 수 있습니다.
- 거래 지역과 거래 일시를 선택하고 게시물을 작성하여 다른 회원들과 공동구매를 진행할 수 있습니다.
- 참여하고 싶은 공동구매가 있다면, 포인트 충전/결제 후 참여할 수 있습니다.
- 마이페이지에서 내가 진행/참여한 공동구매 목록 확인, 찜, 포인트 충전 등을 할 수 있습니다.
- 매너지수 별 다른 사자모양도 확인해보세요.<br>
  (공동구매 진행/참여 시 매너지수 상승, 게시물/댓글 신고 승인처리 시 매너지수 하락)
- 공동구매 게시물에서 댓글로 다른 회원들과 이야기를 나눌 수 있습니다. (신고 가능)

<br>

## ⚙️ DB (ERDCloud 사용)
Link: https://www.erdcloud.com/d/4HjJATBWgjeRvRSZK
<br><br>
![yong_final_ERD](https://user-images.githubusercontent.com/99342672/205446566-7e7ef015-7eaa-4344-bbad-0329b817e897.png)

<br>

## 🎞 스토리보드 (카카오오븐 사용)
<b>메인</b><br>
![스토리보드_메인](https://github.com/yong-k/readmePractice/assets/99342672/cb6b5ff3-5818-4128-ad36-7ee4cfbf1eef)
<br><br><br>
<b>공동구매 게시물 - 회원(공동구매 미참여)</b><br>
![스토리보드_공동구매게시물](https://github.com/yong-k/readmePractice/assets/99342672/5f2a5751-e9eb-47d9-ae94-070e5f605890)
<br><br><br>
<b>마이페이지 메인</b><br>
![스토리보드_마이페이지](https://github.com/yong-k/readmePractice/assets/99342672/d90b3012-1d9e-4d75-9420-ddbc0e1578f7)
<br><br>

<br>


## 🦁 실제 사이트 화면
<h3>해당 페이지마다 블로그 링크를 올렸으니, 더 많은 내용 보시려면 참고해주세요.</h3>

<b>메인</b> &nbsp;&nbsp;[(Click!)블로그GO: 메인 더 자세히 보러 가기](https://yong-codinglog.tistory.com/28)<br>
![00_메인화면](https://user-images.githubusercontent.com/99342672/198884944-3996f61b-dc93-4f45-900d-ae1d1acc6a3c.png)
<br><br><br>
<b>회원가입</b> &nbsp;&nbsp;[(Click!)블로그GO: 회원가입 더 자세히 보러 가기](https://yong-codinglog.tistory.com/7)<br>
![02-1_경고문구](https://github.com/yong-k/readmePractice/assets/99342672/9387682f-ed94-4cd0-bdb2-08f5ab8e14ea)
<br><br><br>
<b>공동구매 게시물 (글 작성자 입장)</b> &nbsp;&nbsp;[(Click!)블로그GO: 공동구매 더 자세히 보러 가기](https://yong-codinglog.tistory.com/category/PROJECT/%EA%B0%99%EC%9D%B4%EC%82%AC%EC%9E%90%28%EA%B3%B5%EB%8F%99%EA%B5%AC%EB%A7%A4%29?page=1)<br>
![13_9-5_글작성완료_1](https://github.com/yong-k/readmePractice/assets/99342672/1c831ad8-7671-4d90-922b-c0824f3e1dab)
<br><br><br>
<b>공동구매 게시물 (비작성자 회원 입장)</b> &nbsp;&nbsp;[(Click!)블로그GO: 공동구매 더 자세히 보러 가기](https://yong-codinglog.tistory.com/category/PROJECT/%EA%B0%99%EC%9D%B4%EC%82%AC%EC%9E%90%28%EA%B3%B5%EB%8F%99%EA%B5%AC%EB%A7%A4%29?page=1)<br>
![12-9-8_신고할 게시물](https://github.com/yong-k/readmePractice/assets/99342672/c9f3233f-ae3e-4720-b450-0bb5b146bc78)
<br><br><br>
<b>마이페이지 > 회원 헤더</b> &nbsp;&nbsp;[(Click!)블로그GO: 마이페이지 더 자세히 보러 가기](https://yong-codinglog.tistory.com/9)<br>
![06_마이페이지헤더1_hover](https://github.com/yong-k/readmePractice/assets/99342672/478771ec-d2ad-4d7d-9ae3-7ce498518228)
<br><br><br>
<b>포인트 충전</b> &nbsp;&nbsp;[(Click!)블로그GO: 포인트 더 자세히 보러 가기](https://yong-codinglog.tistory.com/18)<br>
![09-2-1_마이페이지_포인트메인_목록예시(전체)](https://github.com/yong-k/readmePractice/assets/99342672/8b29d058-abbe-46a5-8eef-5de5796d11c6)
<br><br><br>
<b>댓글 신고</b> &nbsp;&nbsp;[(Click!)블로그GO: 신고 더 자세히 보러 가기](https://yong-codinglog.tistory.com/31)<br>
![12-9-2_댓글신고팝업](https://github.com/yong-k/readmePractice/assets/99342672/3152b004-5d63-4afe-b00b-b383e9401c62)
<br><br><br>

<br>

