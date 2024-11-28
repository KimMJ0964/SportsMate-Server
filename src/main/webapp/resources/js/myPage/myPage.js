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

function qnatoggleHeight(event) {
	const container = event.target.closest('.questionContainer');
	const currentHeight = container.style.height;

	// Toggle height between '50px' and 'max-content'
	container.style.height = currentHeight === '50px' ? 'max-content' : '50px';
}

const viewButtons = document.querySelectorAll('.view-btn');

viewButtons.forEach(button => {
	button.addEventListener('click', function () {
		// 클릭된 버튼에서 data-* 속성 값을 가져옴
		const name = this.getAttribute('data-name');
		const age = this.getAttribute('data-age');
		const gender = this.getAttribute('data-gender');
		const rank = this.getAttribute('data-rank');
		const abl = this.getAttribute('data-abl');
		const posi = this.getAttribute('data-posi');
		const intro = this.getAttribute('data-intro');
		const profile = this.getAttribute('data-profile');
		const context = this.getAttribute('data-context');

		if (!profile) {
			console.log("프로필명이 없습니다");
			document.getElementById('my-modal-join-profile-image').src = context + "/resources/images/user_default_profile.png";
		} else {
			console.log("프로필명 : " + profile);
			document.getElementById('my-modal-join-profile-image').src = context + "/resources/images/userProFile/" + profile;
		}

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
	button.addEventListener('click', function () {
		const stadiumNo = this.getAttribute('data-stadiumno');
		const matchNo = this.getAttribute('data-matchno');

		document.getElementById('modalStadiumNo').value = stadiumNo;
		document.getElementById('modalMatchNo').value = matchNo;
	});
});

$(document).on('click', '.bestplayer-btn', function () {
	console.log("bestplayer-btn 클릭")
	var teamANo = $(this).data('atno');
	var teamBNo = $(this).data('btno');

	$.ajax({
		url: 'getTeamInfo.mp', // 서버에서 팀 정보를 받아올 URL
		type: 'GET',
		data: {
			teamANo: teamANo,
			teamBNo: teamBNo
		},
		success: function (response) {
			console.log(response);
			const aTeamInfo = response.aTeamInfo;
			const bTeamInfo = response.bTeamInfo;
			const aTeamName = response.aTeamInfo[0]?.teamName || 'Unknown A Team';
			const bTeamName = response.bTeamInfo[0]?.teamName || 'Unknown B Team';
			const aTeamProfile = response.aTeamInfo[0]?.teamProfile || 'Unknown A Team Img';
			const bTeamProfile = response.bTeamInfo[0]?.teamProfile || 'Unknown B Team Img';

			console.log('A팀 이름:', aTeamName); // A팀 이름 출력
			console.log('B팀 이름:', bTeamName); // B팀 이름 출력

			console.log('A팀 프로필 이미지:', aTeamProfile); // A팀 이름 출력
			console.log('B팀 프로필 이미지:', bTeamProfile); // B팀 이름 출력

			// a팀 이름 삽입
			$('.aTeam-name span').text(aTeamName);

			// b팀 이름 삽입
			$('.bTeam-name span').text(bTeamName);

			// a팀 멤버 정보 출력
			let aTeamHtml = '';
			aTeamInfo.forEach(member => {
				console.log(member)
				if (member.memberProfile) {
					aTeamHtml += `
						<tr>
							<td><div class="modal-ateam-table-img">
								<img src="/SportsMate/resources/images/userProFile/` + member.memberProfile + `" style="width: 50px; height: 50px; border-radius: 50px;">
							</div></td>
							<td><div class="modal-ateam-table-name">` + member.memName + ' / ' + member.position + `</div></td>
							<td><div class="modal-ateam-table-vote-btn">
								<img class="vote-btn" src="/SportsMate/resources/images/my_uncheck_vote.png" data-bestmno="` + member.memNo + `" onclick="updateBestMNo(this)">
							</div></td>
						</tr>`;
				} else {
					aTeamHtml += `
						<tr>
							<td><div class="modal-ateam-table-img">
								<img src="/SportsMate/resources/images/user_default_profile.png" style="width: 50px; height: 50px; border-radius: 50px;">
							</div></td>
							<td><div class="modal-ateam-table-name">` + member.memName + ' / ' + member.position + `</div></td>
							<td><div class="modal-ateam-table-vote-btn">
								<img class="vote-btn" src="/SportsMate/resources/images/my_uncheck_vote.png" data-bestmno="` + member.memNo + `" onclick="updateBestMNo(this)">
							</div></td>
						</tr>`;
				}
			});
			$(".modal-ateam-table").html(aTeamHtml);

			// b팀 멤버 정보 출력
			let bTeamHtml = '';
			bTeamInfo.forEach(member => {
				console.log(member)
				if (member.memberProfile) {
					bTeamHtml += `
						<tr>
							<td><div class="modal-bteam-table-img">
								<img src="/SportsMate/resources/images/userProFile/` + member.memberProfile + `" style="width: 50px; height: 50px; border-radius: 50px;">
							</div></td>
							<td><div class="modal-bteam-table-name">` + member.memName + ' / ' + member.position + `</div></td>
							<td><div class="modal-bteam-table-vote-btn">
								<img class="vote-btn" src="/SportsMate/resources/images/my_uncheck_vote.png" data-bestmno="` + member.memNo + `" onclick="updateBestMNo(this)">
							</div></td>
						</tr>`;
				} else {
					bTeamHtml += `
						<tr>
							<td><div class="modal-bteam-table-img">
								<img src="/SportsMate/resources/images/user_default_profile.png" style="width: 50px; height: 50px; border-radius: 50px;">
							</div></td>
							<td><div class="modal-bteam-table-name">` + member.memName + ' / ' + member.position + `</div></td>
							<td><div class="modal-bteam-table-vote-btn">
								<img class="vote-btn" src="/SportsMate/resources/images/my_uncheck_vote.png" data-bestmno="` + member.memNo + `" onclick="updateBestMNo(this)">
							</div></td>
						</tr>`;
				}
			});
			$(".modal-bteam-table").html(bTeamHtml);
		},
		error: function () {
			alert("팀 정보를 불러오는 데 실패했습니다.");
		}
	});
});

// 이미지 클릭 시 상태 변경
$(document).on('click', '.vote-btn', function () {
	// 모든 이미지를 원래대로 설정
	$('.vote-btn').each(function () {
		$(this).attr('src', `/SportsMate/resources/images/my_uncheck_vote.png`);
	});

	// 클릭한 이미지만 my_check_vote.png로 변경
	$(this).attr('src', `/SportsMate/resources/images/my_check_vote.png`);
});

function updateBestMNo(imgElement) {
	const bestMNo = imgElement.getAttribute('data-bestmno');

	document.getElementById('bestMNo').value = bestMNo;
}

document.addEventListener("DOMContentLoaded", function () {
	// 모든 이미지에 클릭 이벤트 추가
	const images = document.querySelectorAll(".qnaImage");
	const answerContentDiv = document.querySelector(".qnaAnswerContent");

	images.forEach(image => {
		image.addEventListener("click", function () {
			// 이미지의 data-content 값을 가져와 모달의 qnaAnswerContent div에 출력
			const content = image.getAttribute("data-content");
			answerContentDiv.textContent = content;
		});
	});
});