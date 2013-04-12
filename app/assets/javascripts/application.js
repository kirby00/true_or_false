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

  $("#ajax_loader").hide();

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
          $('ul').prepend('<li class="row-fluid new-question"><p>' + response.question +
            '</p><div class="info"></div></li>'
          );
        } else {
          $('body').prepend('<div class="alert alert-error">Question not saved to database.</div>');
          $('#addQuestion').modal('hide');
        }

      }
    });
    e.preventDefault();
  });

$(window).scroll(function() {

    if($(window).scrollTop() + 10 > $(document).height() - $(window).height()) {

      $('div#ajax_loader').show();

      setTimeout(function () {

        $.ajax({

          url: "/statements/get_statements/" + $("li:last").attr("id") ,
          type : "GET",

          success: function(html)
          {
            if(html)
            {
              $("ul#questions").append(html);
              $('div#ajax_loader').hide();
            }
            else
            {
              $('div#ajax_loader').html('~ END ~');
            }
          }
        });

      }, 2000); // setTimeout for testing
    }
  });


  $('#questions a').bind('click', function(e) {
    var href = $(this).attr('href');
    var data = href.split("/");
    // var sessionId = Helpers.sessionId();
    // var statementId = $(this).attr('data-statement-id');
    // var answer = $(this).attr("data-answer");

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
          var list_item = $(this).parent().parent().parent();
          var infoDiv = $(this).parent().parent();

          $(this).parent().hide();

          var statement_answer = response.answer;

          if(statement_answer == response.user_answer) {
            var answer_html = '<span class="icon-ok"></span>';
          } else {
            var answer_html = '<span class="icon-remove"></span>';
          }

          $(infoDiv).html('<div class="your-answer"> <h4 class="your-answer">your answer:' + response.user_answer + '</h4>' + answer_html + '</div>');
          $(list_item).css({"background-color": "transparent"});

        } else {
          $('body').prepend('<div class="alert alert-error">System Error: answer not saved to database.</div>');
        }

      }
    });
    e.preventDefault();
  });

});