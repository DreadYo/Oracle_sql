-- SQL
/*
DML (Data Manipulation Language):
 - SELECT
 - INSERT
 - UPDATE
 - DELETE   (the operation is logged in journal. Can be cancelled)
 
DDL (Data Definition Language):
 - CREATE
 - DROP
 - ALTER
 - TRUNCATE (Can't be cancelled)
 - COMMENT
 
DCL (Data Control Language):
 - GRANT
 - REVOKE
 
TCL (Transaction Control Language):
 - COMMIT
 - ROLLBACK
 - SAVEPOINT
 - SET TRANSACTION
 
 
High water mark - how many data was in table.
Truncate move high water mark point to 0.
Delete doesn't move. And after delete, query can be work slow, because server will process all blocks when data was before.
 
*/