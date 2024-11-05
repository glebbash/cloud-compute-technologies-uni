#!/usr/bin/env -S node --experimental-sqlite

import { DatabaseSync } from 'node:sqlite';
import * as http from 'node:http';

const PORT = 3000;

const db = new DatabaseSync('./students.db');

db.exec(`
  CREATE TABLE IF NOT EXISTS students (
    student_name TEXT PRIMARY KEY,
    student_class TEXT
  );
`);

db.prepare(`
  INSERT OR IGNORE
  INTO students (student_name, student_class)
  VALUES (:student_name, :student_class);
`).run({
  student_name: 'Bashkatov',
  student_class: 'IWI-601'
});

const server = http.createServer((_req, res) => {
  const rows = db.prepare('SELECT * FROM students').all();
  
  res.writeHead(200, { 'Content-Type': 'text/html' });
  res.end(`
    <title>Students</title>
    <h1>Students</h1>
    
    <ul>
      ${rows.map(row => `
        <li>${row.student_name}, ${row.student_class}</li>
      `)}
    </ul>
  `);
});

server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
