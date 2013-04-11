class StatementsController < ApplicationController

  def new
    @statement = Statement.new
  end

  def get_statements
    @statements = Statement.order("id DESC").where("id < ?", params[:id]).limit(10)
    render :layout => false
  end

  def create
    if request.xhr?
      statement = (params.slice("question", "answer", "user_id"))
      statement[:user_id] = statement[:user_id].to_i
      @statement = Statement.create(statement)
      if @statement.save
        render :json => { :status => 'true',
                          :question => @statement.question,
                          :question_id => @statement.id,
                          :session_id => session[:user_id]
                        }
      else
        render :json => { :status => 'false' }
      end
    end
  end
end
