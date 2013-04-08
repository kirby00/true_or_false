require 'test_helper'
require_relative '../factories/statement_factory'

class StatementsControllerTest < ActionController::TestCase

  test "can add statement" do
    statement = StatementFactory.question
    get :new
    assert_not_nil assigns(:statement)
  end

  test "can create statement" do
    post :create, {:statement => { :question => "question", :answer => true }}
    assert Statement.count != 0
    assert_redirected_to statements_path
  end

end
