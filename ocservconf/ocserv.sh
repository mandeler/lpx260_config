#!/bin/bash
#Install necessary deps and tools
sudo apt-get install libev-dev  build-essential pkg-config libgnutls28-dev libreadline-dev libseccomp-dev libwrap0-dev libnl-nf-3-dev liblz4-dev letsencrypt -y
# Create working dir 
sudo mkdir -p /etc/ocserv/ssl 
cd ocserv 
# Extract source code (hereby version 0.11.9)
# Or you can download the latest version from this website
# wget ftp://ftp.infradead.org/pub/ocserv/ocserv-0.11.9.tar.xz
tar -xJvf ocserv-0.11.9.tar.xz 
	# In DIR ocserv-0.11.9
	cd  ocserv-0.11.9
		./configure 
		make && make install
		sudo cp doc/sample.conf  /etc/ocserv/ocserv.conf 
	# create new ocserv user
		echo "Creating the first ocserv user, please input username! Then input your password twice."
		read username
		ocpasswd -c /etc/ocserv/ocpasswd $username 
	# ocpasswd -c /etc/ocserv/ocpasswd {-d delete,-l lock,-u unlock}
	# In DIR ssl
	cd ../ssl
	# create ca.tmpl template
		echo -e  'cn = "doubi"
		organization = "doubi"
		serial = 1
		expiration_days = 365
		ca
		signing_key
		cert_signing_key
		crl_signing_key' > ca.tmpl
	# Generate ca cert and key
		certtool --generate-privkey --outfile ca-key.pem
		certtool --generate-self-signed --load-privkey ca-key.pem --template ca.tmpl --outfile ca-cert.pem
	# create server.tmpl
		echo "Input your server ip addr here, I will use this in server cert"
		read SRVIP
	    echo -e 'cn = "$SRVIP"
		organization = "doubi"
		expiration_days = 365
		signing_key
		encryption_key
		tls_www_server' > server.tmpl
	# Generate server cert and key
		certtool --generate-privkey --outfile server-key.pem
		certtool --generate-certificate --load-privkey server-key.pem --load-ca-certificate ca-cert.pem --load-ca-privkey ca-key.pem --template server.tmpl --outfile server-cert.pem
	# copy all certs and pems into /etc/ocserv/ssl
		sudo cp *.pem  /etc/ocserv/ssl
	
	# Copy init.d/ocserv to /etc/init.d/ocserv
		sudo cp ../ini.d/ocserv /etc/init.d/ocserv
	# Autostartup
		update-rc.d -f ocserv defaults
	# Iptables NAT
		iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
	# IPv4 Forwarding 
		echo -e "net.ipv4.ip_forward=1" >> /etc/sysctl.conf && sysctl -p
	# Config iptables startup rules 
		sudo iptables-save > /etc/iptables.up.rules
		echo -e '#!/bin/bash\n/sbin/iptables-restore < /etc/iptables.up.rules' > /etc/network/if-pre-up.d/iptables
		chmod +x /etc/network/if-pre-up.d/iptables
# Remind
# 测试正常运行ocserv -f -d 1
	echo "/etc/ocserv/ocserv.conf 文件需要手动编辑"