#!/usr/bin/env bash
#
# OpenAM installation and setup script.
#
# MIT license
#
# Auther: Denis Mulalic, 2021

# /etc/systemd/system/tomcat.service file

warn() { echo "WARNING: $@" >&2; }

# usage() { echo "Usage: $0 [-c]: To clean up" }

password_reset() {
	echo "Password reset"
}
GETOPTPARAM=`getopt -l password-reset: -- "$@"`

eval set -- "$GETOPTPARAM"

while true; do
	case "$1" in
		--password-reset )
			password_reset
			shift
			;;
		(--) shift; break ;;
		(*) break ;;
	esac
	shift
done

cleanup() {
		echo "DEBUG: echo cleanup()"
		rm -f /etc/systemd/system/tomcat.service 
}

while getopts ":p:" o; do
	case "${o}" in
			p)
				cleanup
				;;
	esac
done
shift "$((OPTIND-1))"

[ -r /etc/systemd/system/tomcat.service ] || {
		cat > /etc/systemd/system/tomcat.service <<'EOF'
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

Environment=JAVA_HOME=/usr/lib/jvm/default-java/bin
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'
Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

User=tomcat
Group=tomcat
UMask=0007
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target
EOF
  warn "/etc/systemd/system/tomcat.service created"
}


