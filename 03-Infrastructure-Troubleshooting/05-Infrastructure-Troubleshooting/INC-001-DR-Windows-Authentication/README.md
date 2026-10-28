# INC-001 — SQL Server DR Connectivity and Hyper-V Memory Troubleshooting

**Environment:** Personal Hyper-V SQL Server training lab  
**Affected instance:** `DR\DR` (lab instance)  
**Incident type:** Windows Authentication / DNS / infrastructure availability  
**Status:** Resolved — successful SSMS connection  
**Tools:** Hyper-V Manager, Command Prompt (`ipconfig`, `ping`, `nslookup`), SSMS

## Executive summary

A Windows Authentication connection to the lab SQL Server instance `DR\DR` failed with **“The target principal name is incorrect. Cannot generate SSPI context.”** An initial DNS lookup timed out. During investigation, I discovered that the lab Domain Controller (DC), which provides DNS and domain services, was powered off. An attempt to start it failed because Hyper-V could not allocate **2,048 MB** of startup RAM (error `0x800705AA`). I shut down an unneeded VM, freeing sufficient memory to start DC. After DC was available, DNS resolved the DC host record, and I successfully connected to `DR\DR` with Windows Authentication.

**Root-cause assessment:** DC unavailability was the likely cause of the connection failure; the immediate obstacle to restoring DC was insufficient host RAM. The exact Kerberos/SPN failure mechanism was not independently confirmed.

## Lab context

- Host: Windows Pro laptop, 16 GB RAM, Hyper-V.
- VMs visible in Hyper-V: DC, DEV, DR, PROD, TEST.
- A separate SQL Server TEST instance is installed on the host laptop.
- Multiple VMs have 2,048 MB startup RAM; running several simultaneously can exhaust available host memory.
- This is a **simulated lab PROD/DR setup**, not a production incident.

## Symptoms and evidence

| Observation | Evidence / result |
|---|---|
| SSMS Windows Authentication to `DR\DR` failed | `Cannot generate SSPI context` / target principal name incorrect |
| Initial name resolution failed | DNS request timed out |
| DC could not start | Hyper-V: `Unable to allocate 2048 MB of RAM`, `0x800705AA` |
| After freeing memory, DC started | VM status and user verification |
| DR to DC IP connectivity | `ping` returned 4/4 replies, 0% packet loss |
| DNS lookup after DC startup | `nslookup` showed an initial timeout but successfully resolved the DC FQDN to the configured DNS IP |
| Final application validation | SSMS Windows Authentication to `DR\DR` succeeded |

## Investigation and recovery timeline

1. **Identify the failure.** Recorded the exact SSMS error rather than reinstalling SQL Server.
2. **Inspect infrastructure dependencies.** Found the Domain Controller VM was not running.
3. **Investigate why DC was down.** Starting DC failed with Hyper-V error `0x800705AA` (insufficient RAM for 2 GB startup allocation).
4. **Free resources safely.** Gracefully shut down an unnecessary lab VM; then started DC.
5. **Validate network reachability.** From DR, pinged the configured DNS/DC address; all four probes returned.
6. **Validate DNS.** Queried the DC hostname using the configured DNS server; forward lookup succeeded, though the initial DNS server-name lookup timed out.
7. **Retest SQL Server.** Connected to `DR\DR` through SSMS using Windows Authentication; connection succeeded.

## Diagnostic commands

Run these from the **appropriate lab VM**. Replace placeholders with your own addresses and names before using them.

```cmd
ipconfig /all
ping <DC_IP>
nslookup <DC_HOSTNAME> <DNS_SERVER_IP>
nslookup <DR_HOSTNAME> <DNS_SERVER_IP>
```

Optional SSMS connection authentication check (not yet recorded for this incident):

```sql
SELECT session_id, net_transport, auth_scheme
FROM sys.dm_exec_connections
WHERE session_id = @@SPID;
```

> `auth_scheme` may differ for local Shared Memory versus remote TCP connections. This query is a **follow-up exercise**, not evidence that Kerberos was verified during INC-001.

## Resolution

**Action taken:** Shut down an unnecessary VM to free host memory, then started DC.  
**Result:** DC became reachable, the forward DNS lookup succeeded, and the SSMS connection to `DR\DR` worked.

**No SPNs, SQL Server service accounts, DNS records, or virtual NIC IP assignments were modified.**

## Verification and remaining follow-ups

- [x] DC VM successfully started.
- [x] DR could ping the DC/DNS IP address.
- [x] Forward DNS lookup of DC returned the expected address.
- [x] Windows Authentication to `DR\DR` succeeded in SSMS.
- [ ] Investigate the initial `nslookup` timeout / reverse DNS (PTR) response if it persists.
- [ ] Record whether the connection uses NTLM or Kerberos, preferably from a remote TCP session.
- [ ] Check Hyper-V host available memory and each VM's startup/dynamic memory settings.
- [ ] Review why DR's NIC has multiple IPv4 addresses before modifying any of them (they may support clustering or lab services).

## Prevention and lessons learned

- Start the **DC/DNS VM first** when testing domain-dependent SQL Server VMs.
- On a 16 GB host, power on only the VMs needed for a given exercise; monitor available RAM.
- Separate **host capacity**, **network reachability**, **DNS resolution**, and **authentication** as distinct troubleshooting layers.
- `ping` success does not prove DNS or Kerberos is healthy.
- A DNS lookup can resolve the target name even if an initial reverse lookup of the DNS server times out.
- Do not change SPNs, DNS records, or cluster IPs without verifying their actual role.
- Confirm recovery by repeating the original failing operation.

## Interview-ready summary

> In my personal Hyper-V SQL Server lab, Windows Authentication to a DR instance failed with an SSPI context error. I checked infrastructure dependencies and found the domain controller was offline. Hyper-V initially couldn't restart it because of insufficient host memory. After safely shutting down an unused VM, I restarted the domain controller, validated IP connectivity and DNS name resolution, and successfully reconnected to SQL Server. The exercise reinforced a layered troubleshooting approach and the importance of verifying dependencies before changing SQL Server configuration.

## Evidence

- `01-ssms-sspi-error.png`
- `02-hyperv-insufficient-memory.png`
- `03-ping-dc-success.png`
- `04-dns-forward-lookup.png`
- `05-ssms-connected.png`

