function sliderLogic(){
	 $(document).ready(function(){
		var previous_from = 0;
		var previous_to = 0;
        $("#magnitude_range").ionRangeSlider({
            min: -1.0,
            max: 10.0,
            from: gon.mag_from_value,
            to: gon.mag_to_value,
            type: 'double',
            step: 0.1,
            prettify: false,
            hasGrid: true,
            onChange: function(obj){        // function-callback, is called on every change
	        	 if(previous_from != obj.fromNumber)
	        	 {
	        	 	console.log("from: ", obj.fromNumber);
	        	 	previous_from = obj.fromNumber;
	        	 }
	        	 else if(previous_to != obj.toNumber)
	        	 {
	        	 	console.log("  to: ", obj.toNumber);
	        	 	previous_to =  obj.toNumber;
	        	 }
	        	 else
	        	 {
	        	 	previous_from = obj.fromNumber;
	        	 	previous_to =  obj.toNumber;
	        	 }            	
		    }
        });
        
              
        $("#felt_range").ionRangeSlider({
            min: 0,
            max: 843,
            from: 0,
            to:544,
            type: 'double',
            step: 10,
            prettify: false,
            hasGrid: true,
            onFromChange: function(fromValue){        // function-callback, is called on every change
		        console.log("felt from value"+ fromValue);
		    },
            onToChange: function(toValue){        // function-callback, is called on every change
		        console.log("felt to value"+ toValue);
		    }
        });
        
         $("#dimension_range").ionRangeSlider({
            min: 0.4,
            max: 7.0,
            from: 1,
            to: 5,
            type: 'double',
            step: 0.5,
            prettify: false,
            hasGrid: true,
            onChange: function(obj){        // function-callback, is called on every change
            	console.log("dimension max "+ jQuery("#dimension_range").max);
		        console.log("dimension max & min values="+ jQuery("#dimension_range").val());
		    }
        });
        
         $("#cdi_range").ionRangeSlider({
            min: 0.0,
            max: 10.0,
            from: 2.0,
            to: 6.0,
            type: 'double',
            step: 0.1,
            prettify: false,
            hasGrid: true,
            onChange: function(obj){        // function-callback, is called on every change
		        console.log("cdi max & min values="+ jQuery("#cdi_range").val());
		    }
        });

    });
}