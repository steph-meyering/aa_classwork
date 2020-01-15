# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
    SELECT yr
    FROM (
      SELECT * 
      FROM nobels
      WHERE subject IN ('Physics', 'Chemistry')
    ) AS physics_chemistry
    WHERE subject NOT IN ('Chemistry')
  ;
  SQL
end


# SELECT 
#   FROM 
#   WHERE ;