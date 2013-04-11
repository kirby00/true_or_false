class HomeController < ApplicationController
  def index
    @statements = Statement.latest
    @answers = Answer.user_answers(session[:user_id]) if current_user
  end
end
