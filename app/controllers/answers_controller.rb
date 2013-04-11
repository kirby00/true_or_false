class AnswersController < ApplicationController
  def create

    if request.xhr?

      answer = (params.slice("question_id", "user_answer", "user_id"))
      answer[:user_id] = answer[:user_id].to_i
      answer[:question_id] = answer[:question_id].to_i
      answer[:user_answer] = answer[:user_answer] == "true"

      if Answer.create(answer)
        render :json => { :status => 'true' }
      else
        render :json => { :status => 'false' }
      end
    end
  end
end
