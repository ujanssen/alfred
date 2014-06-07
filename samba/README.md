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
	
Then:

	/usr/bin/smbclient \\\\host\\tank passwd
	
	smb: \> help
	?              allinfo        altname        archive        backup         
	blocksize      cancel         case_sensitive cd             chmod          
	chown          close          del            dir            du             
	echo           exit           get            getfacl        geteas         
	hardlink       help           history        iosize         lcd            
	link           lock           lowercase      ls             l              
	mask           md             mget           mkdir          more           
	mput           newer          notify         open           posix          
	posix_encrypt  posix_open     posix_mkdir    posix_rmdir    posix_unlink   
	print          prompt         put            pwd            q              
	queue          quit           readlink       rd             recurse        
	reget          rename         reput          rm             rmdir          
	showacls       setea          setmode        stat           symlink        
	tar            tarmode        timeout        translate      unlock         
	volume         vuid           wdel           logon          listconnect    
	showconnect    tcon           tdis           tid            logoff         
	..             ! 
