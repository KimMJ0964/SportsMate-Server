document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.days-2 li').forEach(day => {
        day.addEventListener('click', function () {
            const selectedDate = this.getAttribute('data-date'); // YYYY-MM-DD 형식
            document.getElementById('hidden-selected-date').value = selectedDate;
            fetchMatches();
        });
    });

    document.getElementById('start-time').addEventListener('change', fetchMatches);
    document.getElementById('end-time').addEventListener('change', fetchMatches);

    function fetchMatches() {
        const selectedDate = document.getElementById('hidden-selected-date').value;
        const startTime = document.getElementById('start-time').value;
        const endTime = document.getElementById('end-time').value;

        if (!selectedDate || !startTime || !endTime) {
            return;
        }

        // AJAX 요청
        fetch(`/pendingMatches?stadiumNo=1&accessDate=${selectedDate}&reservStart=${startTime}&reservEnd=${endTime}`, {
            method: 'GET',
        })
            .then(response => response.json())
            .then(data => {
                updateMatches(data);
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }

    function updateMatches(matches) {
        const container = document.querySelector('.team-info-wrapper');
        container.innerHTML = '';

        if (matches.length === 0) {
            container.innerHTML = '<p>대기 중인 매치가 없습니다.</p>';
            return;
        }

        matches.forEach(match => {
            const matchDiv = document.createElement('div');
            matchDiv.className = 'team-info';
            matchDiv.innerHTML = `
                <p><strong>팀 이름:</strong> ${match.teamName}</p>
                <p><strong>평점:</strong> ${match.score}</p>
                <p><strong>팀 점수:</strong> ${match.teamPoint}</p>
            `;
            container.appendChild(matchDiv);
        });
    }
});
