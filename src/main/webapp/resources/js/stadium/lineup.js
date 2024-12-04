async function fetchTeamMembers(teamNo) {
    try {
        const response = await fetch(`/api/team-members?teamNo=${teamNo}`);
        if (!response.ok) throw new Error("Failed to fetch team members");
        return await response.json();
    } catch (error) {
        console.error("Error fetching team members:", error);
        return [];
    }
}

async function renderTeamMembers(teamNo) {
    const teamMembers = await fetchTeamMembers(teamNo);
    const container = document.getElementById("member-lineup");
    container.innerHTML = "";

    teamMembers
        .filter(member => member.status === "Y") // 활성화된 멤버만 포함
        .forEach(member => {
            const memberDiv = document.createElement("div");
            memberDiv.classList.add("form-check");

            const checkbox = document.createElement("input");
            checkbox.type = "checkbox";
            checkbox.classList.add("form-check-input");
            checkbox.id = `team${teamNo}_member${member.memNo}`;
            checkbox.name = "selectedPlayers";
            checkbox.value = member.memNo;

            const label = document.createElement("label");
            label.classList.add("form-check-label");
            label.htmlFor = `team${teamNo}_member${member.memNo}`;

            memberDiv.appendChild(checkbox);
            memberDiv.appendChild(label);
            container.appendChild(memberDiv);
        });
}

// 팀 번호 가져오기
const teamNo = document.getElementById("stadium-info").dataset.teamNo;
renderTeamMembers(teamNo);
