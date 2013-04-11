class StatementFactory

  class << self

    def question
      Statement.new(:question => "one plus one is two", :answer => true)
    end

    def question_too_long
      str = "a" * 251
      Statement.new(:question => str, :answer => true)
    end

    def question_too_short
      str = "a" * 4
      Statement.new(:question => str, :answer => true)
    end

    def no_answer
      Statement.new(:question => "one plus one is two", :answer => nil)
    end

    def question_with_id
      Statement.new(:question => "statement will have answer", :answer => true, :id => 1)
    end
  end
end