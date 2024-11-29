/**
 * 
 */
 
 function toggleReplyForm(event) {
            const replyForm = event.target.closest('.bd-comment').querySelector('.bd-reply-form');
            replyForm.style.display = replyForm.style.display === 'block' ? 'none' : 'block';
        }
        
 function downloadFile(filePath) {
        const link = document.createElement('a');
        link.href = filePath;
        link.download = '';
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    }

// 신고 버튼 클릭 시 모달에 boardNo와 comNo 값을 설정
function setReportData(boardNo, comNo, reporterNo, teamNo) {
    // 모달 내부의 boardNo와 comNo input 필드에 값 설정
    document.getElementById("report-boardNo").value = boardNo;
    document.getElementById("report-comNo").value = comNo;
    document.getElementById("report-reporterNo").value = reporterNo;
    document.getElementById("report-teamNo").value = teamNo;
}

function setCommentData(comParentNo, boardNo) {
    document.getElementById("comParentNo").value = comParentNo;
    document.getElementById("comment-boardNo").value = boardNo;
}


