jQuery(document).ready(function(){
});

function rmapiCtrl($scope) {
	$scope.countries = [
		{name:"Afghanistan", code: "AF"},
		{name:"Albania", code: "AL"},
		{name:"Algeria", code: "DZ"},
		{name:"American Samoa", code: "AS"},
		{name:"Andorra", code: "AD"},
		{name:"Angola", code: "AO"},
		{name:"Anguilla", code: "AI"},
		{name:"Antigua and Barbuda", code: "AG"},
		{name:"Argentina", code: "AR"},
		{name:"Armenia", code: "AM"},
		{name:"Aruba", code: "AW"},
		{name:"Australia", code: "AU"},
		{name:"Austria", code: "AT"},
		{name:"Azerbaijan", code: "AZ"},
		{name:"Bahamas", code: "BS"},
		{name:"Bahrain", code: "BH"},
		{name:"Bangladesh", code: "BD"},
		{name:"Barbados", code: "BB"},
		{name:"Belarus", code: "BY"},
		{name:"Belgium", code: "BE"},
		{name:"Belize", code: "BZ"},
		{name:"Benin", code: "BJ"},
		{name:"Bermuda", code: "BM"},
		{name:"Bhutan", code: "BT"},
		{name:"Bolivia", code: "BO"},
		{name:"Bosnia and Herzegowina", code: "BA"},
		{name:"Botswana", code: "BW"},
		{name:"Bouvet Island", code: "BV"},
		{name:"Brazil", code: "BR"},
		{name:"Brunei Darussalam", code: "BN"},
		{name:"Bulgaria", code: "BG"},
		{name:"Burkina Faso", code: "BF"},
		{name:"Burma (Myanmar)", code: "MM"},
		{name:"Burundi", code: "BI"},
		{name:"Cambodia", code: "KH"},
		{name:"Cameroon", code: "CM"},
		{name:"Canada", code: "CA"},
		{name:"Cape Verde", code: "CV"},
		{name:"Cayman Islands", code: "KY"},
		{name:"Central African Republic", code: "CF"},
		{name:"Chad", code: "TD"},
		{name:"Chile", code: "CL"},
		{name:"China (People's Republic)", code: "CN"},
		{name:"Christmas Island", code: "CX"},
		{name:"Cocos Island", code: "CC"},
		{name:"Colombia", code: "CO"},
		{name:"Comoros", code: "KM"},
		{name:"Congo, People's Republic of", code: "CG"},
		{name:"Cook Islands", code: "CK"},
		{name:"Costa Rica", code: "CR"},
		{name:"Cote D'Ivoire", code: "CI"},
		{name:"Croatia (Hrvatska)", code: "HR"},
		{name:"Cuba", code: "CU"},
		{name:"Cyprus", code: "CY"},
		{name:"Czech Republic", code: "CZ"},
		{name:"Democratic Republic of Congo (Zaire)", code: "CD"},
		{name:"Denmark", code: "DK"},
		{name:"Djibouti", code: "DJ"},
		{name:"Dominica", code: "DM"},
		{name:"Dominican Republic", code: "DO"},
		{name:"East Timor", code: "TL"},
		{name:"Ecuador", code: "EC"},
		{name:"Egypt", code: "EG"},
		{name:"El Salvador", code: "SV"},
		{name:"Equatorial Guinea", code: "GQ"},
		{name:"Eritrea", code: "ER"},
		{name:"Estonia", code: "EE"},
		{name:"Ethiopia", code: "ET"},
		{name:"Falkland Islands (Malvinas)", code: "FK"},
		{name:"Faroe Islands", code: "FO"},
		{name:"Fiji", code: "FJ"},
		{name:"Finland", code: "FI"},
		{name:"France", code: "FR"},
		{name:"French Guiana", code: "GF"},
		{name:"French Polynesia", code: "PF"},
		{name:"Gabon", code: "GA"},
		{name:"Gambia", code: "GM"},
		{name:"Georgia", code: "GE"},
		{name:"Germany", code: "DE"},
		{name:"Ghana", code: "GH"},
		{name:"Gibraltar", code: "GI"},
		{name:"Great Britain (United Kingdom)", code: "GB"},
		{name:"Greece", code: "GR"},
		{name:"Greenland", code: "GL"},
		{name:"Grenada", code: "GD"},
		{name:"Guadeloupe", code: "GP"},
		{name:"Guam", code: "GU"},
		{name:"Guatemala", code: "GT"},
		{name:"Guinea", code: "GN"},
		{name:"Guinea-Bissau", code: "GW"},
		{name:"Guyana", code: "GY"},
		{name:"Haiti", code: "HT"},
		{name:"Honduras", code: "HN"},
		{name:"Hong Kong", code: "HK"},
		{name:"Hungary", code: "HU"},
		{name:"Iceland", code: "IS"},
		{name:"India", code: "IN"},
		{name:"Indonesia", code: "ID"},
		{name:"Iran (Islamic Republic of)", code: "IR"},
		{name:"Iraq", code: "IQ"},
		{name:"Ireland (Republic of Ireland)", code: "IE"},
		{name:"Israel", code: "IL"},
		{name:"Italy", code: "IT"},
		{name:"Jamaica", code: "JM"},
		{name:"Japan", code: "JP"},
		{name:"Jordan", code: "JO"},
		{name:"Kazakhstan", code: "KZ"},
		{name:"Kenya", code: "KE"},
		{name:"Kiribati", code: "KI"},
		{name:"Kuwait", code: "KW"},
		{name:"Kyrgyzstan", code: "KG"},
		{name:"Laos (Lao People's Democratic Republic)", code: "LA"},
		{name:"Latvia", code: "LV"},
		{name:"Lebanon", code: "LB"},
		{name:"Lesotho", code: "LS"},
		{name:"Liberia", code: "LR"},
		{name:"Liechtenstein", code: "LI"},
		{name:"Lithuania", code: "LT"},
		{name:"Luxembourg", code: "LU"},
		{name:"Macao", code: "MO"},
		{name:"Macedonia (The Former Yugoslav Republic of)", code: "MK"},
		{name:"Madagascar", code: "MG"},
		{name:"Malawi", code: "MW"},
		{name:"Malaysia", code: "MY"},
		{name:"Maldives", code: "MV"},
		{name:"Mali", code: "ML"},
		{name:"Malta", code: "MT"},
		{name:"Marshall Islands", code: "MH"},
		{name:"Martinique", code: "MQ"},
		{name:"Mauritania", code: "MR"},
		{name:"Mauritius", code: "MU"},
		{name:"Mexico", code: "MX"},
		{name:"Micronesia, Federated States of", code: "FM"},
		{name:"Moldova, Republic of", code: "MD"},
		{name:"Monaco", code: "MC"},
		{name:"Mongolia", code: "MN"},
		{name:"Montenegro", code: "ME"},
		{name:"Montserrat", code: "MS"},
		{name:"Morocco", code: "MA"},
		{name:"Mozambique", code: "MZ"},
		{name:"Namibia", code: "NA"},
		{name:"Nauru", code: "NR"},
		{name:"Nepal", code: "NP"},
		{name:"Netherlands (Holland)", code: "NL"},
		{name:"Netherlands Antilles", code: "AN"},
		{name:"New Caledonia", code: "NC"},
		{name:"New Zealand", code: "NZ"},
		{name:"Nicaragua", code: "NI"},
		{name:"Niger", code: "NE"},
		{name:"Nigeria", code: "NG"},
		{name:"Niue", code: "NU"},
		{name:"Norfolk Island", code: "NF"},
		{name:"North Korea (Democratic Republic of Korea)", code: "KP"},
		{name:"Norway", code: "NO"},
		{name:"Oman", code: "OM"},
		{name:"Pakistan", code: "PK"},
		{name:"Palau", code: "PW"},
		{name:"Palestinian Territory, Occupied", code: "PS"},
		{name:"Panama", code: "PA"},
		{name:"Papua New Guinea", code: "PG"},
		{name:"Paraguay", code: "PY"},
		{name:"Peru", code: "PE"},
		{name:"Philippines", code: "PH"},
		{name:"Pitcairn", code: "PN"},
		{name:"Poland", code: "PL"},
		{name:"Portugal", code: "PT"},
		{name:"Puerto Rico", code: "PR"},
		{name:"Qatar", code: "QA"},
		{name:"Reunion", code: "RE"},
		{name:"Romania", code: "RO"},
		{name:"Russian Federation", code: "RU"},
		{name:"Rwanda", code: "RW"},
		{name:"Saint Helena", code: "SH"},
		{name:"Saint Kitts and Nevis", code: "KN"},
		{name:"Saint Lucia", code: "LC"},
		{name:"Saint Pierre and Miquelon", code: "PM"},
		{name:"Saint Vincent and The Grenadines", code: "VC"},
		{name:"Saipan", code: "MP"},
		{name:"San Marino", code: "SM"},
		{name:"Sao Tome and Principe", code: "ST"},
		{name:"Saudi Arabia", code: "SA"},
		{name:"Senegal", code: "SN"},
		{name:"Serbia", code: "RS"},
		{name:"Seychelles", code: "SC"},
		{name:"Sierra Leone", code: "SL"},
		{name:"Singapore", code: "SG"},
		{name:"Slovakia (Slovak Republic)", code: "SK"},
		{name:"Slovenia", code: "SI"},
		{name:"Solomon Islands", code: "SB"},
		{name:"Somalia", code: "SO"},
		{name:"South Africa", code: "ZA"},
		{name:"South Georgia and The South Sandwich Islands", code: "GS"},
		{name:"South Korea (Republic of Korea)", code: "KR"},
		{name:"Spain", code: "ES"},
		{name:"Sri Lanka", code: "LK"},
		{name:"Sudan", code: "SD"},
		{name:"Suriname", code: "SR"},
		{name:"Svalbard and Jan Mayen Islands", code: "SJ"},
		{name:"Swaziland", code: "SZ"},
		{name:"Sweden", code: "SE"},
		{name:"Switzerland", code: "CH"},
		{name:"Syrian Arab Republic", code: "SY"},
		{name:"Taiwan", code: "TW"},
		{name:"Tajikistan", code: "TJ"},
		{name:"Tanzania, United Republic of", code: "TZ"},
		{name:"Thailand", code: "TH"},
		{name:"Togo", code: "TG"},
		{name:"Tokelau", code: "TK"},
		{name:"Tonga", code: "TO"},
		{name:"Trinidad and Tobago", code: "TT"},
		{name:"Tunisia", code: "TN"},
		{name:"Turkey", code: "TR"},
		{name:"Turkmenistan", code: "TM"},
		{name:"Turks and Caicos Islands", code: "TC"},
		{name:"Tuvalu", code: "TV"},
		{name:"Uganda", code: "UG"},
		{name:"Ukraine", code: "UA"},
		{name:"United Arab Emirates", code: "AE"},
		{name:"United States", code: "US"},
		{name:"United States Minor Outlying Islands", code: "UM"},
		{name:"Uruguay", code: "UY"},
		{name:"Uzbekistan", code: "UZ"},
		{name:"Vanuatu", code: "VU"},
		{name:"Vatican City State (Holy See)", code: "VA"},
		{name:"Venezuela", code: "VE"},
		{name:"Vietnam", code: "VN"},
		{name:"Virgin Islands (British)", code: "VG"},
		{name:"Virgin Islands (U.S.)", code: "VI"},
		{name:"Wallis and Futuna Islands", code: "WF"},
		{name:"Western Sahara", code: "EH"},
		{name:"Western Samoa", code: "WS"},
		{name:"Yemen (Republic of)", code: "YE"},
		{name:"Zambia", code: "ZM"},
		{name:"Zimbabwe", code: "ZW"}];
	$scope.availableServices = [
		{
			name : 'airmail',
			enabled : false,
			hasPackaging : true,
			possiblePackagingTypes : ['postcard', 'letter', 'small_packet'],
			packagingType : '',
			has_intl_signed_for : true,
			intl_signed_for : false,
			has_extra_compensation : true,
			extra_compensation : false
		},
		{name : 'airsure'},
		{name : 'surface_mail'},
	];
	$scope.country = null;//$scope.countries[2];
	$scope.weight = 0;
	$scope.apiKey = '';
	$scope.destinationZone = '01';
	$scope.rates = [];
	$scope.errors = [];
	$scope.requestEndpoint = 'http://localhost:3000/api/v1/rates';
	$scope.requestPayload = 'your mom';
	
	$scope.needsDestinationZone = function(){
		return $scope.country && 'GB' == $scope.country.code;
	}
	
	$scope.getRates = function(){
		$scope.errors = [];
		if('' == $scope.apiKey){
			$scope.errors.push({message:'Please enter your API key'});
		}
		if(!$scope.country){
			$scope.errors.push({message:'Please select the destination country'});
		}
		if($scope.weight <= 0){
			$scope.errors.push({message:'Please enter valid weight'});
		}
		
		var $selectedMarkupServices = $('input[name="service\\[\\]"]:checked');
		if($selectedMarkupServices.length <= 0){
			$scope.errors.push({message:'Please select which shipping services you\'d like to calculate rates for'});
		}
		
		if($scope.errors == 0){
			var services = [];
			
			$selectedMarkupServices.each(function(){
				services.push({name:$(this).val(), packaging: 'letter'});
			});
			
			var payload = {
				api_key : $scope.apiKey,
				destination : $scope.country.code,
				destination_zone : $scope.destination_zone,
				weight : $scope.weight,
				services : [services]
			};
			$scope.requestPayload = JSON.stringify(payload);
			$scope.rates.push('test');
			
			jQuery.ajax({
				url: $scope.requestEndpoint,
				type: "GET",
				data: $scope.requestPayload,
				dataType: "json",
				contentType: "application/json; charset=utf-8",
				success: function (response) {
					console.log("success", response);
					
					$scope = angular.element($('#angularContainer')[0]).scope(); 
					$scope.$apply(function(){
						//populat rates member var
					});
				},
				error: function (response) {
					console.log("failed", response);
					$scope = angular.element($('#angularContainer')[0]).scope(); 
					$scope.$apply(function(){
						$scope.errors.push({message:response.statusText + ' ' + response.responseText});
					});
				}
			});

/*
			$http({
				url: $scope.requestEndpoint,
				method: "GET",
				data: payload
			}).success(function(data, status, headers, config) {
				console.log('success', data);
			}).error(function(data, status, headers, config) {
				console.log('error', data);
			});
			*/
		}
	}
}