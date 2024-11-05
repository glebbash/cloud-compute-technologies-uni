PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE students (
    student_name TEXT PRIMARY KEY,
    student_class TEXT
  );
INSERT INTO students VALUES('Bashkatov','IWI-601');
COMMIT;
