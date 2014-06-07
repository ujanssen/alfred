samba
=====

Install and Configure Samba.

Install:
--------

	apt-get install libcups2 samba samba-common avahi-daemon

Configure:
----------

	smbpasswd -a ujanssen

/etc/samba/smbuser:

	ujanssen = "ujanssen" 

/etc/samba/smb.conf:

	[tank]
 
	comment = File Server
	path = /tank
	read only = no
	writable = yes

/etc/avahi/services/smb.service:

	<?xml version="1.0" standalone='no'?>
	<!DOCTYPE service-group SYSTEM "avahi-service.dtd">
	<service-group>
 	  <name replace-wildcards="yes">%h</name>
 	  <service>
         <type>_smb._tcp</type>
         <port>445</port>
       </service>
       <service>
         <type>_device-info._tcp</type>
         <port>0</port>
         <txt-record>model=RackMac</txt-record>
       </service>
    </service-group>


Restart services:

	service avahi-daemon restart
	service smbd restart

To see which shares are available on a given host, run:

	/usr/bin/smbclient -L host
	
