function confirmTeamOut(tno) {
        const confirmation = confirm("정말로 구단을 탈퇴하시겠습니까?");
        if (confirmation) {
            // "예"를 누르면 tno와 함께 이동
            window.location.href = `teamSelfOut.tm?tno=${tno}`;
        } else {
            // "아니요"를 누르면 취소 메시지 표시
            alert("구단 탈퇴가 취소되었습니다.");
        }
    }