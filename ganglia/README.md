ganglia
=======

configure ganglia monitor server and client.

Install:

	apt-get install gmetad ganglia-monitor ganglia-modules-linux ganglia-webfrontend 

Configure:
	
	cp /etc/ganglia-webfrontend/apache.conf /etc/apache2/sites-enabled/ganglia.conf
	/etc/init.d/apache2 restart

Browse:

	http://host/ganglia/
