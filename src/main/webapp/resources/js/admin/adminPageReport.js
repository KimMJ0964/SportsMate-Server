// window.onload = function() {
//     getData(limit);
// };

// //무한스크롤 관련 데이터
// let limit = 1;
// let lastScroll = 0;
// let page = 0;
// let nowPageLimit = 0;
// let nextPageLimit = 0;
// let loadingData = false;  // 데이터를 요청 중인지 확인하는 변수

// // 데이터를 가져오는 함수
// function getData(limit) {
//     // 데이터를 이미 요청 중일 때는 새로운 요청을 하지 않도록 방지
//     if (loadingData) return;
//     loadingData = true;

//     // 다음 페이지
//     nextPageLimit = (page + 1) * limit;

//     $.ajax({
//         type: "POST",
//         enctype: 'multipart/form-data',
//         url: "selectReportList.me", // 서버 API URL
//         async: true,  // 비동기 호출로 변경
//         data: {
//             "nextPageLimit": nextPageLimit,
//             "limit": limit
//         },
//         success: function(data) {
//           console.log(data)
//             if (data && Array.isArray(data)) {
//                 // 데이터를 화면에 추가
//                 data.forEach(function(pn) {
//                     // HTML 템플릿 생성
//                     let html = `
//                      <div class="result-container">
//                         <div class="victory-container">
//                           <div class="victory-row">
//                               <div class="team-info">
//                                   <form action="">
//                                       <table>
//                                           <tr>
//                                               <td>
//                                                   <p><b>경기장:</b> ${pn.pnGround}</p>
//                                               </td>
//                                               <td>
//                                                   <p><b>신고일:</b> ${pn.pnDate}</p>
//                                               </td>
//                                           </tr>
//                                           <tr>
//                                               <td>
//                                                   <p><b>신고자:</b> ${pn.pnReporter}</p>
//                                               </td>
//                                               <td>
//                                                   <p><b>신고대상:</b> ${pn.memNo}</p>
//                                               </td>
//                                           </tr>
//                                           <tr>
//                                               <td colspan="2">
//                                                   <p><b>신고사유:</b> ${pn.pnContent}</p>
//                                               </td>
//                                           </tr>
//                                       </table>
//                                       <div class="report-btns">
//                                           <button class="cancle-btn">거절</button>
//                                           <button class="report-btn">승인</button>
//                                       </div>
//                                   </form>
//                               </div>
//                           </div>
//                         </div>
//                       </div>
//                     `;
//                     // 생성된 HTML을 .victory-container에 추가
//                     $(".wrap").append(html);
//                 });

//                 // 페이지 수 증가
//                 page += 1;
//             }
//         },
//         error: function(data, status, err) {
//             console.error('Error loading data', err);
//         },
//         complete: function() {
//             // 데이터 로딩이 완료되면 요청 중 상태를 false로 변경
//             loadingData = false;
//         }
//     });
// }

// // 스크롤 이벤트 처리
// $(document).scroll(function(e) {
//     var currentScroll = $(this).scrollTop();
//     var documentHeight = $(document).height();
//     var nowHeight = $(this).scrollTop() + $(window).height();

//     // 스크롤이 아래로 내려갔을 때만 이벤트 진행
//     if (currentScroll > lastScroll) {
//         if (documentHeight < (nowHeight + (documentHeight * 0.1))) {
//             // 데이터 요청 (10개의 데이터를 요청)
//             getData(1);
//         }
//     }

//     // 현재 위치 최신화
//     lastScroll = currentScroll;
// });