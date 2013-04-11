require 'test_helper'
require_relative '../factories/statement_factory'

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

end
