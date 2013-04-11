class AnswersController < ApplicationController
  def create

    if request.xhr?

      answer = (params.slice("question_id", "user_answer", "user_id"))
      answer[:user_id] = answer[:user_id].to_i
      answer[:question_id] = answer[:question_id].to_i
      answer[:user_answer] = answer[:user_answer] == "true"

      if Answer.create(answer)
        statement = Statement.find(answer[:question_id])
        render :json => { :status => 'true', :user_answer => answer[:user_answer].to_s, :answer => statement.answer.to_s }
      else
        render :json => { :status => 'false' }
      end
    end
  end
end
