# dump database to SQL (just for debugging)
sqlite3 students.db ".dump" > students-dump.sql

# zip the current dump, append current date to the zip file name
zip students-dump-$(date +%s).zip students-dump.sql
