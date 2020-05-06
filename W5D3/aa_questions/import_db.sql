PRAGMA foreign_keys = ON;

-- TODO Create tables
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(16) NOT NULL,
  lname VARCHAR(16) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL

  FOREIGN KEY (question_id) REFERENCES questions(id)
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER NOT NULL
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
  FOREIGN KEY (question_id) REFERENCES questions(id)
  FOREIGN KEY (parent_id) REFERENCES replies(id)
)

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL

  FOREIGN KEY (question_id) REFERENCES questions(id)
  FOREIGN KEY (user_id) REFERENCES users(id)
)

-- TODO Seed the database
INSERT INTO
  users (name, )
VALUES
  ('Ryan', 'Tran'), ('John', 'Lam');

INSERT INTO
  questions (title, body, author_id)
VALUES
  

INSERT INTO 
  question_follows (question_id, user_id)
VALUES


INSERT INTO
  replies (question_id, parent_id, body, user_id)
VALUES


INSERT INTO
  question_likes (question_id, user_id)
VALUES
  