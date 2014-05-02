ganglia
=======

configure ganglia monitor server and client.

Install:

	apt-get install gmetad ganglia-monitor ganglia-modules-linux ganglia-webfrontend 

Configure:
	
	cp /etc/ganglia-webfrontend/apache.conf /etc/apache2/sites-enabled/ganglia.conf
	/etc/init.d/apache2 restart

In file /etc/ganglia/gmond change to "send_metadata_interval = 60"

Browse:

	http://host/ganglia/
