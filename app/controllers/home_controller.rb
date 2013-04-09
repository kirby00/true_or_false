class HomeController < ApplicationController
  def index
    session[:user_id] = 1
    @statements = Statement.all
    @statement = Statement.new
  end
end
