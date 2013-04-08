class StatementsController < ApplicationController
  def index
  end

  def new
    @statement = Statement.new
  end

  def create
    @statement = Statement.create(params[:statement])
    if @statement.save
      redirect_to statements_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
