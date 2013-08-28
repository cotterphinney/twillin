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
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  var mutedFields = 1;
  var nonMutedFields = 2;

  $('#add-field-muted').click(function () {
  	mutedFields ++;
  	var newMutedField = '<input id="muted_number" name="numbers[muted]['+mutedFields+']" type="text" placeholder="Enter a number" />';
  	$('#muted').append($(newMutedField).hide().fadeIn('fast'));
  	console.log(mutedFields);
  });

  $('#remove-field-muted').click(function () {
    if (mutedFields > 1) {
      $('#muted input').last().remove();
      mutedFields --;
    }
    console.log(mutedFields);
  });

  $('#add-field-nonmuted').click(function () {
  	nonMutedFields ++;
  	var newNonMutedField = '<input id="nonmuted_number" name="numbers[nonmuted]['+nonMutedFields+']" type="text" placeholder="Enter a number" />';
  	$('#non-muted').append($(newNonMutedField).hide().fadeIn('fast'));
  	console.log(nonMutedFields);
  });

  $('#remove-field-nonmuted').click(function () {
    if (nonMutedFields > 2) {
      $('#non-muted input').last().remove();
      nonMutedFields --;
    }
    console.log(nonMutedFields);
  });
});