require_relative 'question_database'

class QuestionFollow

  attr_accessor :user_id, :question_id

  def self.find_by_user_id(id)
    hash = QuestionDatabase.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      question_follows
    WHERE
      user_id = ?
    SQL
    QuestionFollow.new(hash)
  end
  
  def initialize(hash)
    @user_id = hash[0]["user_id"]
    @question_id = hash[0]["question_id"]
  end
end
