// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require_tree .
//= require jquery
//= require best_in_place
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.foundation
//= require jquery-ui
//= require foundation
//= require turbolinks
//= require jquery_nested_form

// $(function(){ $(document).foundation(); });
// $(document).foundation();
$(document).on('turbolinks:load', function() {
  $(document).foundation();

})
$(function(){



  $(document).ready(function(){

      /* Activating Best In Place */
      jQuery(".best_in_place").best_in_place();


  });
});
