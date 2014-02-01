function sliderLogic(){
	 $(document).ready(function(){
		var previous_from = 0;
		var previous_to = 0;
        $("#magnitude_range").ionRangeSlider({
            min: -1.0,
            max: 10.0,           
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
            min: 0,
            max: 10.0,            
            type: 'double',
            step: 0.5,
            prettify: false,
            hasGrid: true           
        });
        
         $("#cdi_range").ionRangeSlider({
            min: 0.0,
            max: 10.0,            
            type: 'double',
            step: 0.1,
            prettify: false,
            hasGrid: true            
        });
    });
}