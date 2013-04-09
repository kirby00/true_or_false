class HomeController < ApplicationController
  def index
    @statements = Statement.all
    @statement = Statement.new
    if current_user
      @answers = Answer.find_all_by_user_id(session[:user_id])
    end
  end
end
