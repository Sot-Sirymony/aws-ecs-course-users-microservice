#node build first jar file
##command build docker work for me
docker build --tag sotsirymony168/users-microservice:v1 --force-rm=true --platform linux/amd64 .
docker build -t users-microservice .
docker build -t sotsirymony168/users-microservice-spring-1:v13 .

#/command view docker image after build
 docker images
# push to docker hub after build image
 docker push sotsirymony168/users-microservice