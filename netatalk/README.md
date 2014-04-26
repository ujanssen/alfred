netatalk
========

Access files via Apple Filing Protocol (AFP).
Offer files via Bonjour (Zeroconf).

Install:

	sudo apt-get install netatalk

Add volume to etc/netatalk/AppleVolumes.default

	echo '/tank		"Tank"' >> /etc/netatalk/AppleVolumes.default

Add file /etc/avahi/services/afpd.service:

	<?xml version="1.0" standalone='no'?><!--*-nxml-*-->
	<!DOCTYPE service-group SYSTEM "avahi-service.dtd">
	<service-group>
	  <name replace-wildcards="yes">%h</name>
	  <service>
	    <type>_afpovertcp._tcp</type>
	    <port>548</port>
	  </service>
	</service-group>

Restart services:

	service avahi-daemon restart
	service netatalk restart
