require 'test_helper'
require_relative '../factories/statement_factory'
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

  test "can show if user answer is correct answer" do
    statement = StatementFactory.question_with_id
    answer = AnswerFactory.with_all_attributes

    assert_equal answer.user_answer, statement.answer
  end

  test "can show total number of answers for a question" do

  end

  test "can show total number of correct answers for a question" do

  end

  test "can show correct answers as proportion of total answers" do

  end

end
