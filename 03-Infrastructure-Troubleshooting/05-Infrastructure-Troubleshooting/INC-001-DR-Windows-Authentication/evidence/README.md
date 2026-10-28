# INC-001 Screenshot Evidence

These images were captured during the personal SQL Server DBA lab incident.

| File | Evidence |
|---|---|
| `01-ssms-sspi-authentication-error.png` | Original SSMS `Cannot generate SSPI context` failure when connecting to `DR\DR`. |
| `02-hyperv-dc-insufficient-memory.png` | Hyper-V could not allocate 2,048 MB to start DC (`0x800705AA`). |
| `03-dr-ipconfig-dns-settings.png` | DR VM network configuration, including DNS server and multiple assigned IPv4 addresses. |
| `04-dr-ping-and-dns-lookup.png` | Successful ping to DC IP and successful forward DNS resolution, with initial lookup timeout. |
| `05-hyperv-vm-inventory.png` | Hyper-V lab inventory: DC, DEV, DR, PROD, TEST. |

## Validation still to capture

A screenshot showing **successful SSMS connection to `DR\DR`** was not provided in the conversation. Capture one if desired; do not represent it as included here. Optional: run `SELECT @@SERVERNAME AS server_name, ORIGINAL_LOGIN() AS login_name;` to show a successful session (redact usernames if publishing).

## Privacy check before public GitHub upload

Screenshots expose the lab domain, internal IP addresses, server names, and possibly usernames. Review and redact details you do not want public. These are original screenshots, not recreated or altered.
