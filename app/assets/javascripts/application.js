// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function() {

  $('#add-question').submit(function(e) {

    $.ajax({
      url: "/statements",
      type: "post",
      data: $('#add-question').serialize(),

      success: function(response)
      {
        if(response.status == "true")
        {
          $('body').prepend('<div class="alert alert-success">Question added to database.</div>');
          $('#addQuestion').modal('hide');
          $('ul').prepend('<li><p>' + response.question + '</p><a href="#">true</a> <a href="#">false</a></li>');
        } else {
          $('body').prepend('<div class="alert alert-error">Question not saved to database.</div>');
          $('#addQuestion').modal('hide');
        }

      }
    });
    e.preventDefault();
  });

  $('a').click(function(){
    this
  });
/*
$('#questions li a').bind('click', function(e) {
    var href = $(this).attr('href');
    var data = href.split("/");
    alert("user_id: " + data[0] +
          "question_id: " + data[1] +
          "user_answer: " + data[2]
      );
    e.preventDefault();
  });
*/



  $('#questions a').bind('click', function(e) {
    var href = $(this).attr('href');
    var data = href.split("/");

    $.ajax({
      url: "/answers",
      type: "post",
      context: this,
      data: {
        'user_id'     : data[0],
        'question_id' : data[1],
        'user_answer' : data[2]
      },

      success: function(response)
      {
        if(response.status == "true")
        {
          $(this).parent().hide();
        } else {
          $('body').prepend('<div class="alert alert-error">System Error: answer not saved to database.</div>');
        }

      }
    });
    e.preventDefault();
  });



});