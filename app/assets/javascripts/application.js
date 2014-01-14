// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.ui.all
//= require turbolinks
//= require_tree .

function hello_world() {
  	$(document).ready(function(){	
		alert("Hello from Jquery");
	});
}

function jqueryui_test_dialog() {
	$(document).ready(function(){		
$(function() {
			$( "#dialog" ).dialog();
		});
	});
}


function sliderLogic(){
	 $(document).ready(function(){

        $("#magnitude_range").ionRangeSlider({
            min: -1.0,
            max: 10.0,
            from: 0.2,
            to: 6,
            type: 'double',
            step: 0.1,
            prettify: false,
            hasGrid: true
        });
        
         $("#felt_range").ionRangeSlider({
            min: 44,
            max: 843,
            from: 144,
            to:544,
            type: 'double',
            step: 10,
            prettify: false,
            hasGrid: true
        });
        
         $("#dimension_range").ionRangeSlider({
            min: 0.4,
            max: 7.0,
            from: 1,
            to: 5,
            type: 'double',
            step: 0.5,
            prettify: false,
            hasGrid: true
        });
        
         $("#cdi_range").ionRangeSlider({
            min: 0.0,
            max: 10.0,
            from: 2.0,
            to: 6.0,
            type: 'double',
            step: 0.1,
            prettify: false,
            hasGrid: true
        });

    });
}
