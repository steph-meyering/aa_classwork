require_relative 'question_database'
require_relative 'question'


class User
  attr_accessor :id, :fname, :lname

  def self.find_by_id(id)
    hash_id = QuestionDatabase.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    User.new(hash_id)
  end

  def self.find_by_name(fname, lname)
    hash_name = QuestionDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT 
        *
      FROM
        users
      WHERE
        fname = ? AND
        lname = ?
    SQL
    User.new(hash_name)
  end
  
  def initialize(hash)
    @id = hash[0]["id"]
    @fname = hash[0]["fname"]
    @lname = hash[0]["lname"]
  end

  def authored_questions
    Question.find_by_author_id(self.id)
  end

  def authored_replies
    Reply.find_by_user_id(self.id)
  end
end 