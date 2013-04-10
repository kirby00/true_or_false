class StatementsController < ApplicationController

  def index

  end

  def new
    @statement = Statement.new
  end

  def get_statements
    @statements = Statement.limit(10).offset(params[:id])
    # if current_user
    #   @answers = Answer.find_all_by_user_id(session[:user_id])
    # end
    render :layout => false
  end

  def create
    if request.xhr?
      statement = (params.slice("question", "answer", "user_id"))
      statement[:user_id] = statement[:user_id].to_i
      @statement = Statement.create(statement)
      if @statement.save
        render :json => { :status => 'true', :question => @statement.question, :question_id => @statement.id }
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
