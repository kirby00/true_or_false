require 'test_helper'
require_relative '../factories/answer_factory'

class AnswerTest < ActiveSupport::TestCase

  test "answer has user_id" do
    answer = AnswerFactory.without_user_id
    assert answer.invalid?
  end

  test "answer has question_id" do
    answer = AnswerFactory.without_question_id
    assert answer.invalid?
  end

  test "answer has user_answer" do
    answer = AnswerFactory.without_user_answer
    assert answer.invalid?
  end
end
