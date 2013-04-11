class AnswerFactory

  class << self

    def without_user_id
      Answer.new(:question_id => 1, :user_answer => true)
    end

    def without_question_id
      Answer.new(:user_id => 1, :user_answer => true)
    end

    def without_user_answer
      Answer.new(:user_id => 1, :question_id => 9)
    end

    def with_all_attributes
      Answer.new(:user_id => 1, :question_id => 1, :user_answer => true)
    end

    def with_incorrect_answer
      Answer.new(:user_id => 1, :question_id => 1, :user_answer => false)
    end
  end
end