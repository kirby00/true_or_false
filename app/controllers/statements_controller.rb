class StatementsController < ApplicationController
  def index
  end

  def new
    @statement = Statement.new
  end

  def create

    if request.xhr?
      statement = (params.slice("question", "answer", "user_id"))
      statement[:user_id] = statement[:user_id].to_i
      @statement = Statement.create(statement)
      if @statement.save
        render :json => { :status => 'true', :question => @statement.question }
      else
        render :json => { :status => 'false' }
      end
    end


  end

  def edit
  end

  def update
  end

  def destroy
  end
end
