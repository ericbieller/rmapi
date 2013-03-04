$(document).ready(function() {
   $('.help').tooltip();
   
    $.ajax({
        url: 'http://localhost:3000/api/v1/rates',
        type: 'GET',
        data: { 'destination' : 'AF', 'weight' : '27500', 'destination_zone' : '02', 'packaging' : 'letter', 'services' : [{ 'name' : 'airmail', 'packaging' : 'letter' }]},
        dataType: "json",
        //beforeSend: setHeader,
        success: function(response) {
            if (response.error) {
                alert(response.details);
            } else {
                $("#response").append(JSON.stringify(response) + '\n');
            }
        }
    });
});
