zfs
===

Use the zfs file system with ubuntu server 14.04 LTS.

Install:

	sudo add-apt-repository ppa:zfs-native/stable
	sudo apt-get update
	sudo apt-get install ubuntu-zfs

Look for disks:

	ls -l /dev/disk/by-id/

Create a pool:

	zpool create -f ultra /dev/disk/by-id/usb-WD_My_Passport_4711-0:0

Show pool status:

	zpool status

	  pool: ultra
	 state: ONLINE
	  scan: none requested
	config:

		NAME                           STATE     READ WRITE CKSUM
		ultra                          ONLINE       0     0     0
		  usb-WD_My_Passport_4711-0:0  ONLINE       0     0     0

	errors: No known data errors

List file systems:

	zfs list

	NAME    USED  AVAIL  REFER  MOUNTPOINT
	ultra   110K  1.78T    30K  /ultra

Create file system:

	zfs create ultra/documents

Export file system:

	zfs set sharenfs=rw=@192.168.0.0/24,insecure ultra/documents
	zfs share ultra/documents
	zfs share -a

Use file system from mac:

	nfs://nas/ultra/documents

Monitoring pool performance:

	zpool iostat 2

	               capacity     operations    bandwidth
	pool        alloc   free   read  write   read  write
	----------  -----  -----  -----  -----  -----  -----
	tank        1.46T  1.26T     51      8  6.25M   585K
	tank        1.46T  1.26T      0    477      0  43.5M
	tank        1.46T  1.26T      0    592    255  65.1M
	tank        1.46T  1.26T      0    607      0  60.1M
	tank        1.46T  1.26T      0    669      0  72.8M




