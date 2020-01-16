require_relative 'question_database'
require_relative 'user'
require_relative 'reply'

class Question
  attr_accessor :id, :title, :body

  def self.find_by_id(id)
    hash_id = QuestionDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM questions
    WHERE id = ?
    SQL

    self.new(hash_id)

  end

  def self.find_by_author_id(user_id)
    hash_user_id = QuestionDatabase.instance.execute(<<-SQL, user_id)
    SELECT *
    FROM questions
    WHERE id = (
      SELECT
        question_id
      FROM
        question_follows 
      WHERE
        user_id = ?
    )
    SQL

    self.new(hash_user_id)

  end


  # def self.all 
  #   data = QuestionDatabase.instance.execute("SELECT * FROM questions")
  #   data.map { |datum| Questions.new(datum) }
  # end

  def initialize(hash_id)
    @id = hash_id[0]["id"]
    @title = hash_id[0]["title"]
    @body = hash_id[0]["body"]
  end

  def author 
    author_hash = QuestionDatabase.instance.execute(<<-SQL, self.id)
    SELECT
      *
    FROM
      users
    WHERE
      id = 
      (SELECT
        user_id
      FROM
        question_follows
      WHERE 
        question_id = ?)
    SQL

    User.new(author_hash)
  end

  def replies
    Reply.find_by_question_id(self.id)
  end
  
end 