-- Follow-up lab exercise: verify authentication scheme for current session.
-- Note: Shared Memory/local sessions may show NTLM; test remote TCP if validating Kerberos.
SELECT
    session_id,
    net_transport,
    auth_scheme
FROM sys.dm_exec_connections
WHERE session_id = @@SPID;
