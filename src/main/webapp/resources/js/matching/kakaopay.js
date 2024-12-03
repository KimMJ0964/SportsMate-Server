$(function() {
    const name = document.querySelector('#stadium').value;
    const price = document.querySelector('#price').value;

    $("#btn-pay-ready").click(function(e) {
        e.preventDefault();  // 폼 제출을 막음
        // 아래 데이터 외에도 필요한 데이터를 원하는 대로 담고, Controller에서 @RequestBody로 받으면 됨
        let data = {
            name: name,    // 카카오페이에 보낼 대표 상품명
            totalPrice: price // 총 결제금액
        };
        
        $.ajax({
            type: 'POST',
            url: 'payMatch.st',
            data: JSON.stringify(data),
            contentType: 'application/json',
            success: function(response) {
                location.href = response.next_redirect_pc_url;
            },
            error: function(){
                console.log("결제실패");
            }
        });
    });
});