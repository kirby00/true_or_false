class StatementFactory

  class << self

    def question
      Statement.new(:question => "one plus one is two", :answer => true)
    end
  end
end