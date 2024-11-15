/**
 * 
 */
 
function toggleHeight(event) {
	    const container = event.target.closest('.MyRecordContainer');
	    const currentHeight = container.style.height;

	    // Toggle height between '50px' and 'max-content'
	    container.style.height = currentHeight === '50px' ? 'max-content' : '50px';
	}
	
	function teamtoggleHeight(event) {
	    const container = event.target.closest('.myTeamContainer');
	    const appClubContainer = document.querySelector('.app-club-container');
	    const currentHeight = container.style.height;

	    // Toggle height between '50px' and 'max-content'
	      if (currentHeight === '50px') {
	        appClubContainer.style.display = 'block'; // Show app-club-container
	        container.style.height = '100%';
	    } else {
	        appClubContainer.style.display = 'none'; // Hide app-club-container
	        container.style.height = '50px';
	    }
	}
	
	function jointoggleHeight(event) {
	    const container = event.target.closest('.joinTeamPeopleContainer');
	    const currentHeight = container.style.height;

	    // Toggle height between '50px' and 'max-content'
	    container.style.height = currentHeight === '50px' ? 'max-content' : '50px';
	}
	
 const viewButtons = document.querySelectorAll('.view-btn');
	 
	    viewButtons.forEach(button => {
	        button.addEventListener('click', function() {
	            // 클릭된 버튼에서 data-* 속성 값을 가져옴
	            const name = this.getAttribute('data-name');
	            const age = this.getAttribute('data-age');
	            const gender = this.getAttribute('data-gender');
	            const rank = this.getAttribute('data-rank');
	            const abl = this.getAttribute('data-abl');
	            const posi = this.getAttribute('data-posi');
	            const intro = this.getAttribute('data-intro');
	            
	            const genderText = gender === 'M' ? '남자' : gender === 'F' ? '여자' : gender;
	            
	            // 모달 내용 업데이트
	            document.getElementById('applicantName').textContent = name;
	            document.getElementById('applicantAge').textContent = age;
	            document.getElementById('applicantGender').textContent = genderText;
	            document.getElementById('applicantRank').textContent = rank;
	            document.getElementById('applicantAbl').textContent = abl;
	            document.getElementById('applicantPosi').textContent = posi;
	            document.getElementById('applicantIntro').textContent = intro;
	        });
	    });
	    
	    document.querySelectorAll('.bestplayer-btn').forEach(button => {
	        button.addEventListener('click', function() {
	            const stadiumNo = this.getAttribute('data-stadiumno');
	            const matchNo = this.getAttribute('data-matchno');
	            
	            document.getElementById('modalStadiumNo').value = stadiumNo;
	            document.getElementById('modalMatchNo').value = matchNo;
	        });
	    });
	    
