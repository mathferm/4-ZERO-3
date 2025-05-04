
### >_ Introduction

**4-ZERO-3**
Tool to bypass 403/401. This script contain all the possible techniques to do the same. 

- **NOTE** : If you see multiple [200 Ok]/bypasses as output, you must check the Content-Length. If the content-length is same for multiple [200 Ok]/bypasses means false positive. Reason can be "301/302" or "../" [Payload] DON'T PANIC.
- Script will print `cURL` PAYLOAD if possible bypass found.

### >_ Help
```bash
root@me_dheeraj:$ bash 403-bypass.sh -h
```

### >_ Usage / Modes

- Scan with specific payloads:
  * [ `--header` ] Support HEADER based bypasses/payloads
    ```bash
    root@me_dheeraj:$ bash 403-bypass.sh -u https://target.com/secret --header
    ```
  * [ `--protocol` ] Support PROTOCOL based bypasses/payloads
    ```bash
    root@me_dheeraj:$ bash 403-bypass.sh -u https://target.com/secret --protocol
    ```
  * [ `--port` ] Support PORT based bypasses/payloads
    ```bash
    root@me_dheeraj:$ bash 403-bypass.sh -u https://target.com/secret --port
    ```
  * [ `--HTTPmethod` ] Support HTTP Method based bypasses/payloads
    ```bash
    root@me_dheeraj:$ bash 403-bypass.sh -u https://target.com/secret --HTTPmethod
    ```
  * [ `--encode` ] Support URL Encoded bypasses/payloads
    ```bash
    root@me_dheeraj:$ bash 403-bypass.sh -u https://target.com/secret --encode
    ```
  * [ `--SQLi` ] Support MySQL mod_Security & libinjection bypasses/payloads [** New **]
    ```bash
    root@me_dheeraj:$ bash 403-bypass.sh -u https://target.com/secret --SQLi
    ```
  * [ `--delay=10` ] Add a delay between requests [** New **]
    ```bash
    root@me_dheeraj:$ bash 403-bypass.sh -u https://target.com/secret --delay=10
    ```
- Complete Scan {includes all exploits/payloads} for an endpoint [ --exploit ]
```bash
root@me_dheeraj:$ bash 403-bypass.sh -u https://target.com/secret --exploit
```

##### Prerequisites
- apt install curl [Debian]

## To do
- add all the ip from  
  https://www.root-me.org/fr/Challenges/Web-Serveur/HTTP-Contournement-de-filtrage-IP?action_solution=voir#ancre_solution
  Add an option to test either with a fake proxy (from yahoo as currently) or only using classic headers. Also make so when testing with fake proxy you also test with classic one
