hddtemp-monitor
===============

Read the HDD temperature and send it to Ganglia

Install:
	
	sudo mkdir /opt/hddtemp-monitor
	sudo cp hddtemp-monitor.rb /opt/hddtemp-monitor
	sudo cp hddtemp-monitor /etc/init.d/
	sudo update-rc.d hddtemp-monitor defaults 
	service hddtemp-monitor start
