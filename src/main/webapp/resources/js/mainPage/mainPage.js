$(document).ready(function() {
    $('#activityArea').change(function() {
        var selectedValue = $(this).val();

        // AJAX request
        $.ajax({
            url: 'mainRegionMatch.mn',
            type: 'POST',
            data: { activityArea: selectedValue },
            success: function(response) {
                console.log('Response:', response);

                if (response.status === 'success') {
                    var matches = response.matches;
                    matches.forEach(function(match) {
                        console.log('매치: ', match);
                    });
                } else {
                    console.error('Error:', response.message);
                }
            },
            error: function(xhr, status, error) {
                console.error('Error: ' + error);
            }
        });
    });
});