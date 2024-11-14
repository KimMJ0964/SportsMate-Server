/**
 * 
 */
 
 function toggleReplyForm(event) {
            const replyForm = event.target.closest('.bd-comment').querySelector('.bd-reply-form');
            replyForm.style.display = replyForm.style.display === 'block' ? 'none' : 'block';
        }