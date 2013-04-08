class HomeController < ApplicationController
  def index
    @statements = Statement.all
  end
end
