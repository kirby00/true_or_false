class HomeController < ApplicationController
  def index
    @statements = Statement.all
    @statement = Statement.new
  end
end
