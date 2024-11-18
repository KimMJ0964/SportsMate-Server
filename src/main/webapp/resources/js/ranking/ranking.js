document.querySelectorAll('.sport-btn').forEach(button => {
    button.addEventListener('click', function() {
        document.querySelectorAll('.sport-btn').forEach(btn => btn.classList.remove('active'));
        this.classList.add('active');
    });
});
