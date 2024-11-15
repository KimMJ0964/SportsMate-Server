/**
 * 
 */
 
document.querySelectorAll('.day-box').forEach(day => {
				    day.addEventListener('click', function() {
				        // 모든 day-box에서 selected 클래스를 제거
				        document.querySelectorAll('.day-box').forEach(box => {
				            box.classList.remove('selected');
				        });
				        // 클릭된 요소에만 selected 클래스 추가
				        this.classList.add('selected');
				    });
				});
				
document.querySelectorAll('.time-box').forEach(day => {
				    day.addEventListener('click', function() {
				        // 모든 day-box에서 selected 클래스를 제거
				        document.querySelectorAll('.time-box').forEach(box => {
				            box.classList.remove('selected');
				        });
				        // 클릭된 요소에만 selected 클래스 추가
				        this.classList.add('selected');
				    });
				});