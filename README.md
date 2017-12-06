# dcos-zookeeper
A cluster implementation of zookeeper for DC/OS.  
Stole most of the code and just re-wrote it to work easier with Marathon. Sloppy implementation. But it works.  

#### To run
* Build container and push to private registry or dockerhub
* Edit zookeeper.json with the nodes where you want to place zookeeper workers
* On any host with DCOS CLI run `dcos marathon group add zookeeper.json`  

glhf 
