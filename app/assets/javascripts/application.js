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
//= require jquery.ui.all
//= require twitter/bootstrap
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.bootstrap3
//= require underscore
//= require gmaps/google
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

function dataTableFunction(){
	$(document).ready(function(){
		// For fixed width containers
		$('#customers').dataTable({
		  sDom: "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
		  "aaSorting": [[ 0, "desc" ]],    	 
    	   sPaginationType:  "full_numbers"
		});
	});
}	


    

