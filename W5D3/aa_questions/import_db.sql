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
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- TODO Seed the database
INSERT INTO
  users (fname, lname)
VALUES
  ('Ryan', 'Tran'), ('John', 'Lam');

INSERT INTO
  questions (title, body, user_id)
VALUES
  ('What''s the meaning of life?', 'It''s food', 2),
  ('W5D3 Classwork', 'How do we do this project?', 1);

INSERT INTO 
  question_follows (question_id, user_id)
VALUES
  (1, 2),
  (2, 2),
  (2, 1),
  (1, 1);

INSERT INTO
  replies (question_id, parent_id, body, user_id)
VALUES
  (1, NULL, 'Are you sure?', 1),
  (1, 1, 'Maybe', 2),
  (2, NULL, 'We just do it', 2),
  (2, NULL, 'This is hard', 1);

INSERT INTO
  question_likes (question_id, user_id)
VALUES
  (1, 1),
  (2, 2);

  