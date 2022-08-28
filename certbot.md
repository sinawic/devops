
<!-- Install Certbot -->
sudo snap install --classic certbot

<!-- Prepare the Certbot command -->
sudo ln -s /snap/bin/certbot /usr/bin/certbot

<!-- Request a wildcard certificate for domains. -->
DOMAIN=example.com

certbot certonly --manual -d *.$DOMAIN -d $DOMAIN --agree-tos --manual-public-ip-logging-ok --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory --register-unsafely-without-email --rsa-key-size 4096

<!-- Set the txt dns records with given values -->
_acme-challenge=xxx
_acme-challenge=xxx

<!-- Copy the generated pem files to desired directory or not -->
<!-- files will be at /etc/letsencrypt/archive/DOMAIN -->
<!-- Point the cert files address in nginx to the newly created pem files -->

<!-- Must do: check if nginx has any errors before restarting -->
sudo nginx -t
<!-- Restart nginx service -->
sudo systemctl restart nginx

<!-- also for namaa -->
<!-- got to the konga panel, in the certs -->
<!-- the certs related to namaa -->
<!-- replace the privkey with new privkey content -->
<!-- replace the cert with newly created fullchain content -->

<!-- refer to links for more info -->
<!-- https://certbot.eff.org/instructions?ws=nginx&os=ubuntufocal -->
<!-- https://eff-certbot.readthedocs.io/en/stable/using.html#nginx -->
<!-- https://codex.so/wildcard-ssl-certificate-by-let-s-encrypt -->
