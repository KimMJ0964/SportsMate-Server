// 서버에서 구단 멤버 데이터를 가져오는 함수
async function fetchTeamMembers(teamNo) {
    try {
        const response = await fetch(`/api/team-members?teamNo=${teamNo}`); // API 호출
        if (!response.ok) throw new Error("Failed to fetch team members");
        return await response.json(); // JSON 데이터를 반환
    } catch (error) {
        console.error("Error fetching team members:", error);
        return []; // 오류 발생 시 빈 배열 반환
    }
}

// 멤버 데이터를 화면에 렌더링하는 함수
async function renderTeamMembers(teamNo) {
    const teamMembers = await fetchTeamMembers(teamNo); // 서버에서 데이터 가져오기
    const container = document.getElementById("member-lineup");
    container.innerHTML = ""; // 기존 내용 초기화

    teamMembers.forEach(member => {
        const memberDiv = document.createElement("div");
        memberDiv.classList.add("form-check");

        const checkbox = document.createElement("input");
        checkbox.type = "checkbox";
        checkbox.classList.add("form-check-input");
        checkbox.id = `team${teamNo}_member${member.memNo}`;
        checkbox.name = "selectedMembers";
        checkbox.value = member.memNo; // 멤버 번호로 값 설정

        const label = document.createElement("label");
        label.classList.add("form-check-label");
        label.htmlFor = `team${teamNo}_member${member.memNo}`;
        label.textContent = member.memName; // 멤버 이름 표시

        memberDiv.appendChild(checkbox);
        memberDiv.appendChild(label);
        container.appendChild(memberDiv);
    });
}

// 모달이 열릴 때 멤버 데이터를 로드
document.getElementById("subscription").addEventListener("show.bs.modal", function () {
    const stadiumInfo = document.getElementById("stadium-info");
    const teamNo = stadiumInfo.dataset.teamNo; // dataset으로 teamNo 가져오기
    
    console.log("모달 창 열림 - teamNo 확인:", teamNo); // teamNo 값 출력
    
    if (teamNo && teamNo > 0) {
        renderTeamMembers(teamNo); // 렌더링 실행
    } else {
        console.error("teamNo가 올바르지 않음:", teamNo);
    }
});