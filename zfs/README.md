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





