CREATE TABLE students (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT UNIQUE
);

INSERT INTO students (name, email) VALUES
  ('Ama K.', 'ama@example.com'),
  ('Kwame A.', 'kwame@example.com'),
  ('Kofi T.', 'kofi@example.com');
