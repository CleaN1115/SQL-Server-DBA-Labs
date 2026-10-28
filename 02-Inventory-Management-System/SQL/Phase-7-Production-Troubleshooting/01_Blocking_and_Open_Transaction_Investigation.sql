--
/*
============================================================
SQL SERVER PRODUCTION TROUBLESHOOTING LAB
Incident: Blocking Caused by Open Transactions
Database: InventoryManagement
Role: SQL Server DBA
============================================================

SCENARIO:
A user reported that an UPDATE operation was hanging and
not completing.

OBJECTIVE:
Identify the blocking session, determine the root cause,
resolve the blocking safely, and validate the fix.

ROOT CAUSE:
A SQL Server session had multiple open transactions that
were holding locks and blocking another session.
============================================================
*/

USE InventoryManagement;
GO

/* =========================================================
   STEP 1 - Check for Blocking
   ========================================================= */

EXEC sp_who2;
GO

/*
Finding:
SPID 86 was blocked by SPID 77.
*/


/* =========================================================
   STEP 2 - Investigate the Blocking Session
   ========================================================= */

DBCC INPUTBUFFER(77);
GO

SELECT
    session_id,
    status,
    command,
    blocking_session_id,
    wait_type,
    wait_time,
    wait_resource
FROM sys.dm_exec_requests
WHERE session_id IN (77, 86);
GO

/*
Finding:
SPID 86 was in a SUSPENDED state and waiting on LCK_M_U,
indicating that it was waiting to acquire an update lock.
*/


/* =========================================================
   STEP 3 - Check Open Transactions
   ========================================================= */

SELECT
    session_id,
    status,
    open_transaction_count,
    last_request_start_time,
    last_request_end_time
FROM sys.dm_exec_sessions
WHERE session_id = 77;
GO

/*
Finding:
The blocking session had multiple open transactions.
*/


/* =========================================================
   STEP 4 - Resolve the Blocking
   ========================================================= */

/*
LAB ONLY:
Because the blocking transactions were intentionally created
for this lab, they were rolled back from the blocking session.

In production, the DBA should investigate the session,
application, transaction and business impact before deciding
to ROLLBACK or KILL a session.
*/

WHILE @@TRANCOUNT > 0
    ROLLBACK;
GO


/* =========================================================
   STEP 5 - Validate
   ========================================================= */

SELECT @@TRANCOUNT AS OpenTransactions;
GO

EXEC sp_who2;
GO

/*
RESULT:
- Open transaction count returned to 0.
- Blocking was removed.
- The previously blocked UPDATE completed successfully.

KEY DBA LESSON:
Do not immediately kill a blocking session.
Identify the blocker, investigate what it is doing and
understand the business impact before taking corrective action.
*/