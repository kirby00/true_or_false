require 'test_helper'
require_relative '../factories/statement_factory'
require_relative '../factories/answer_factory'

class StatementTest < ActiveSupport::TestCase

  test "question is present" do
    statement = Statement.new
    assert !statement.save
  end

  test "question is longer than 4 characters" do
    statement = StatementFactory.question_too_short
    assert statement.invalid?
  end

  test "question is shorter than 250 characters" do
    statement = StatementFactory.question_too_long
    assert !statement.save
  end

  test "answer is present" do
    statement = StatementFactory.no_answer
    assert !statement.save
  end

  test "can find answer" do
    statement = StatementFactory.question_with_id
    answer = AnswerFactory.with_all_attributes
    answers = [answer]
    assert_equal answer, statement.find_answer(answers)
  end

end
