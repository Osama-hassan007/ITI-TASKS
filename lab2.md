### LAB 2
### problem (1)
``` bash 

FROM ubuntu:22.04
RUN  apt-get update 
RUN  apt-get install nginx -y
WORKDIR /lol
COPY index.html /var/www/html/
ADD osama.tar /var/www/html/
EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

docker build -t nginx1:v1.1 .
docker container run -d -p 8080:80 --name nginx101 nginx1:v1.1
```
----------------------------------------------------------------------
### problem (2)
``` bash 
i faced so much errors at this problem 
i will ask you about it next lec inshaallah

```
---------------------------------------------------------------------
### problem (3)
``` bahs

    bridge: The default network driver. If you don’t specify a driver, this is the type of network you are creating. Bridge networks are usually used when your applications run in standalone containers that need to communicate. See bridge networks.

    host: For standalone containers, remove network isolation between the container and the Docker host, and use the host’s networking directly. See use the host network.

    overlay: Overlay networks connect multiple Docker daemons together and enable swarm services to communicate with each other. You can also use overlay networks to facilitate communication between a swarm service and a standalone container, or between two standalone containers on different Docker daemons. This strategy removes the need to do OS-level routing between these containers. See overlay networks.

    ipvlan: IPvlan networks give users total control over both IPv4 and IPv6 addressing. The VLAN driver builds on top of that in giving operators complete control of layer 2 VLAN tagging and even IPvlan L3 routing for users interested in underlay network integration. See IPvlan networks.

    macvlan: Macvlan networks allow you to assign a MAC address to a container, making it appear as a physical device on your network. The Docker daemon routes traffic to containers by their MAC addresses. Using the macvlan driver is sometimes the best choice when dealing with legacy applications that expect to be directly connected to the physical network, rather than routed through the Docker host’s network stack. See Macvlan networks.

    none: For this container, disable all networking. Usually used in conjunction with a custom network driver. none is not available for swarm services. See disable container networking.

    Network plugins: You can install and use third-party network plugins with Docker. These plugins are available from Docker Hub or from third-party vendors. See the vendor’s documentation for installing and using a given network plugin.
```
--------------------------------------------------------------------------------------
### problem (4)
``` bash 
docker network create osbridge
docker container run -it --name ubuntu2 ubuntu
docker container run -it --name ubuntu1 --add-host web:172.17.0.4 ubuntu
docker network connect osbridge ubuntu1
docker network connect osbridge ubuntu1
```

