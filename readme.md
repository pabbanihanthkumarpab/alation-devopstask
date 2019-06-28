<pre>

<h1>Devops Home Task</h1>
<h3>My Consideations</h3>
Going to run nodejs simple app to throw the hello world text for HTTP request
Nginx load balancer to loadbalance and handle fail over
Everything will run as docker containers inside a single VM.

<h3>Steps</h3>

1) Clone the repository
git clone https://github.com/sureshsaics/alation-devopstask.git

2) Move to the directory
cd alation-devopstask 

3) Spin the VM using 
vagrant up

4) So for now one VM is up and running with docker installed
If everything went fine you could able to ssh
vagrant ssh app-server

5) We shall start the necessary containers after ssh into the VM
bash /vagrant/files/setup.sh

This would have started two docker containers server the response for HTTP request and a nginx load balncer

6) You can test the app !!!!

If you are inside the VM use
curl http://sampleapp

If you are outside the VM
curl http://172.42.42.100

7) you can make failover by removing one of the running container
   bash /vagrant/files/remove-a-container 
   this will remove webserver1, so that webserver2 will serve your requests.
   
<h3> Note </h3>
- By default nginx upstream works on round robin fashion


</pre>

