class HomeController < ApplicationController
  def index
    # session[:user_id] = 1
    @statements = Statement.latest
    @answers = Answer.user_answers(session[:user_id]) if current_user
  end
end
