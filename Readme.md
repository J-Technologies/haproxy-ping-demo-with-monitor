## Using HAProxy for loadbalancing 2 web servers in docker, including a monitor application

This project contains 4 docker containers, two apache servers, one haproxy monitor application and one haproxy server which load balance between these two servers.
The haProxy monitor application was used in the presentation May 18 2015 at Ordina during the ping demonstration.


To build and run all three containers, you can use the `run.sh` or  `run.bat` command.
After the containers are started, the following addresses are available:

* http://[ip]:80     demo website
* http://[ip]:81     haproxy admin site
* http://[ip]:82     haproxy monitor application
* http://[ip]:84     direct access to apache1
* http://[ip]:85     direct access to apache2
