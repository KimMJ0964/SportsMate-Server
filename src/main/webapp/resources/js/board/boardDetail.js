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