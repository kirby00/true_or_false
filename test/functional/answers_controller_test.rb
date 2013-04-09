require 'test_helper'
# require_relative '../factories/answer_factory'


class AnswersControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "can create answer" do
    post :create, {:answer => { :user_id => "11", :question_id => "11", :user_answer => true }}
    assert Answer.count != 0
  end

end
