
//datepicker with default options
$(function() {
		$( "#from" ).datepicker({
			dateFormat: "yy-mm-dd",
			minDate: '-7d',
			maxDate: '-1d',
			defaultDate: "-1d",
			changeMonth: true,
			numberOfMonths: 2,
			onClose: function( selectedDate ) {
				$( "#to" ).datepicker("option", "minDate", (selectedDate > defaultDate ? '0' : selectedDate));
			},
		});
		$( "#to" ).datepicker({
			dateFormat: "yy-mm-dd",
			defaultDate: "0",
			minDate: '-6d',
			maxDate: '0',
			changeMonth: true,
			numberOfMonths: 2,
			onClose: function( selectedDate ) {
				//$( "#from" ).datepicker( "option", "maxDate", (selectedDate > defaultDate ? '-1d' : selectedDate) );
				$( "#from" ).datepicker( "option", "maxDate", selectedDate);
			}
		});

		$("#slider").slider({ 
			min: 10,
			max: 2000,
			step: 10,
			//value: gon.radius
			value: 100
		});
	});