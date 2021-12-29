/*
Requarements for trasactional systems
Transaction - sequence of operations performed (using one or more sql statements)
on a database as a single logical unit of work.
The effects of all the sql statements in a transaction can be either all committed (applied to database)
or all rolled back (undone from the database).

Properties of Transactions
ACID
 - Atomicity
            A transaction is a logical unit of work which must be either completed
            with all of its data modifications, or none of them is performed.
 - Consistency
            At the end of the transaction, all data must be left in a consistent state
            (without errors). 
 - Isolation
            Modifications of data performed by transaction must be independent of
            another transaction. Unless this happens, the outcome of a tramsaction
            may be erroneous.
 - Durability
            When the transaction is completed, effects of the modifications 
            performed by the transaction must be permanent in the system.
*/