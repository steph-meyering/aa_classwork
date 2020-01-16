require_relative 'question_database'


class Reply
  
  attr_accessor :id, :user_id, :question_id, :parent_reply_id, :body

  def self.find_by_id(id)
    hash_id = QuestionDatabase.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      replies
    WHERE
      id = ?
    SQL

    Reply.new(hash_id)
  end

  def self.find_by_user_id(id)
    hash_user_id = QuestionDatabase.instance.execute(<<-SQL, id)
    SELECT 
      *
    FROM
      replies
    WHERE 
      user_id = ?
    SQL

    Reply.new(hash_user_id)
    
  end

  def self.find_by_question_id(id)
    hash_question_id = QuestionDatabase.instance.execute(<<-SQL, id)
    SELECT 
      *
    FROM
      replies
    WHERE 
      question_id = ?
    SQL

    Reply.new(hash_question_id)
    
  end

  def initialize(hash)
    @id = hash[0]["id"]
    @user_id = hash[0]["user_id"]
    @question_id = hash[0]["question_id"]
    @parent_reply_id = hash[0]["parent_reply_id"]
    @body = hash[0]["body"]
  end

  def author
    author_hash = QuestionDatabase.instance.execute(<<-SQL, self.user_id)
    SELECT 
      *
    FROM
      users
    WHERE
      id = (
        SELECT
          user_id
        FROM
          replies
        WHERE
          user_id = ?
      )
    SQL
  end
   

end