$(document).ready(function() {
   $('.help').tooltip();
   
    $.ajax({
        url: 'http://localhost:3000/api/v1/rates',
        type: 'GET',
        data: { 'destination' : 'AF', 'weight' : '27500', 'destination_zone' : '02', 'services' : [
			{ 'type' : 'airmail', 'packaging' : 'letter', intl_signed_for : false },
			{ 'type' : 'airsure', 'packaging' : 'letter' },
			{ 'type' : 'banana', 'packaging' : 'letter' },
			{ type : 'express_48', saturday_delivery : true, large_size : true },
			{ type : 'express_48', saturday_delivery : false, large_size : true }
		 ]},
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
