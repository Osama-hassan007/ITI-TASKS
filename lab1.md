### lap1
----------------------------------
### problem1
1. 1
``` bash
docker container run hello-world
```
1. 2
``` bash 
docker container ls
```
1. 3
``` bash
docker container start f4f
```
1. 4
``` bash 
docker container rm f4f
```
1. 5
``` bash
ocker rmi hello-world
```
----------------
### problem 2
2. 1
``` bash 
docker container run -it centos
```
2. 2
``` bash
echo "docker" in interactive mood at centos
```
2. 3
```bash
touch hello_docker in interactive mood at centos
```
2. 4
``` bash 
docker container stop f97
docker container rm f97
the file will deleted
```
2. 5
``` bash
docker rm $(docker ps --filter status=exited -q)
```
------------------------------------
### problem 3
3. 1
``` bash 
docker container run -it --name apache -v vol:/var/ -p 8090:80 bash
```
3. 2
```bash
echo osama >> lab1.html
docker container run -it --name apache -v vol:/var/ -p 8090:80 bash
cd/var
ls 
lab1.html
```
3. 3
```bash 
docker container rm 9ed
```
3. 4
```bash 
docker container run -it --name apache3 -v vol:/var/ -p 9098:80 httpd 
```
--------------------------------------------------------------------
### problem 4
4. 1
``` bash 
docker container run -it --name apcache1 httpd
```
4. 2
``` bash 
cd /usr/local/apache2/htdocs/
```
4. 3
``` bash
docker container run -it --name apache5  httpd bash
docker commit 9f515e5213fa
```
4. 4 
``` bash 

FROM nginx
 
 RUN apt-get update && apt-get upgrade -y
 
 COPY os.html /usr/share/nginx/html
 
 EXPOSE 8080
 
 CMD ["nginx", "-g", "daemon off;"]

 docker build -t my_enginx .
 
 ```
-----------------------------------------------------------------------------
### problem 5
```bash 
docker run -it -v volume3:/var/lib/mysql --name app-database -e MYSQL_ROOT_PASSWORD=P4sSw0rd0! -d mysql:latest
```



