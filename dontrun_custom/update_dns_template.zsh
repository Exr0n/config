MYIP="$(curl https://domains.google.com/checkip)"
if [[ "$(dig +short DOMAIN)" != "$MYIP" ]]; then   # yay -S dnsutils for dig
    curl -X POST -A 'def firefox' https://USERNAME:PASSWORD@domains.google.com/nic/update?hostname=DOMAIN
else echo "DOMAIN up to date"; fi

