google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(drawChart2);

//chart 관련
let ctoday = 0
let coneDay = 0
let ctwoDay = 0
let cthreeDay = 0
let cfourDay = 0

window.onload = function() {
  // 페이지 로딩이 완료되면 getChartData() 함수 호출
  getChartData();
};

//차트 데이터 ajax요청
function getChartData(){
  $.ajax({
    url: "drawChart.me",
    success: function(res){
      ctoday = res[0].today
      coneDay = res[0].oneDay
      ctwoDay = res[0].twoDay
      cthreeDay = res[0].threeDay
      cfourDay = res[0].fourDay

      drawChart2(ctoday, coneDay, ctwoDay, cthreeDay, cfourDay);
    },
    error: function(){
      console.log("차트 생성 ajax 실패")
    }
  })
}

// 날짜 포맷팅 함수
function formatDate(date) {
  const year = date.getFullYear();
  const month = String(date.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1
  const day = String(date.getDate()).padStart(2, '0');
  
  return `${year}/${month}/${day}`;
}

// 날짜에서 X일 전 구하기
function getPreviousDates(date, numDays) {
  const previousDate = new Date(date);
  previousDate.setDate(date.getDate() - numDays);
  return formatDate(previousDate);
}

// 현재 날짜
const currentDate = new Date();
console.log("현재 날짜:", formatDate(currentDate));
console.log("1일 전:", getPreviousDates(currentDate, 1));
console.log("2일 전:", getPreviousDates(currentDate, 2));
console.log("3일 전:", getPreviousDates(currentDate, 3));
console.log("4일 전:", getPreviousDates(currentDate, 4));

//차트 그리기
function drawChart2(ctoday, coneDay, ctwoDay, cthreeDay, cfourDay) {
  var data = google.visualization.arrayToDataTable([
    ['날짜', '접속자'],
    [getPreviousDates(currentDate, 4),  cfourDay],
    [getPreviousDates(currentDate, 3),  cthreeDay],
    [getPreviousDates(currentDate, 2),  ctwoDay],
    [getPreviousDates(currentDate, 1),  coneDay],
    [formatDate(currentDate),  ctoday]
  ]);

  var options = {
    title: '일별 접속자 수',
    hAxis: {title: '',  titleTextStyle: {color: '#333'}},
    vAxis: {minValue: 0}
  };

  var chart = new google.visualization.AreaChart(document.getElementById('chart_div2'));
  chart.draw(data, options);
}

$(window).resize(function(){
  drawChart2(ctoday, coneDay, ctwoDay, cthreeDay, cfourDay);
});

// Reminder: you need to put https://www.google.com/jsapi in the head of your document or as an external resource on codepen //