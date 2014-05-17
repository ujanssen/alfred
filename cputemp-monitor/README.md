cputemp-monitor
===============

Read the CPU temperature and send it to Ganglia

Install:
	
	sudo apt-get install lm-sensors
	sudo apt-get install daemon
	
Copy files:

	sudo mkdir /opt/cputemp-monitor
	sudo cp cputemp-monitor.rb /opt/cputemp-monitor
	sudo cp cputemp-monitor /etc/init.d

Start servce:

	sudo update-rc.d cputemp-monitor defaults 
	sudo service cputemp-monitor start
