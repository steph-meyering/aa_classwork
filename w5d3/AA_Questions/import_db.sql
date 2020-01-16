-- users: ID, fname, lname
-- questions: ID, title, body
-- question_follows: question_id, users_id
-- replies: ID, question_id, parent_reply_id, user_id, body...
-- question_likes: user_id, question id
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

INSERT INTO
  users(fname, lname)
VALUES
  ('Stephane', 'Meyering'),('Ryan','Leung'),('Dean', 'Mapa');

  ------------------------------------------------------------------------- 


CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body VARCHAR(255) NOT NULL
);

INSERT INTO
  questions(title, body)
VALUES
  ('First Question','What would Carlos do?'),
  ('Second Question', 'Did Carlos really do that?'),
  ('Third Question','How did Carlos do that?');

    ------------------------------------------------------------------------- 

CREATE TABLE question_follows(
  user_id INTEGER,
  question_id INTEGER,


  FOREIGN KEY (user_id) REFERENCES users(id)
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  question_follows(user_id, question_id)
VALUES 
  (1,2),
  (2,3),
  (3,1);


    ------------------------------------------------------------------------- 
-- question_id, parent_reply_id, user_id, body...
-- question_likes: user_id, question id
CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  body VARCHAR(255) NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id)
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
  FOREIGN KEY (user_id) REFERENCES users(id)
  );

INSERT INTO
  replies(user_id, question_id, parent_reply_id, body)
VALUES
  (3, 2, NULL, 'no he didn''t'),
  (2, 2, 1, 'liar'),
  (1, 3, NULL, 'lorem');

  ------------------------------------------------------------------------- 


CREATE TABLE question_likes (
  user_id INTEGER,
  question_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  question_likes(user_id, question_id)
VALUES
  (2,2),
  (1,3),
  (3,1);
