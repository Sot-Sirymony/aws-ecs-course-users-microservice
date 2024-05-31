sudo apt update
sudo apt install haproxy

#config ha proxy

sudo apt update
sudo apt install haproxy
#Configure HAProxy to balance traffic between the Spring Boot Droplets (spring-boot-1 and spring-boot-2). Here's a basic example:
global
  log /dev/log local0
  log /dev/log local1 notice
  chroot /var/lib/haproxy
  stats socket /run/haproxy/admin.sock mode 660 level admin expose-fd listeners
  stats timeout 30s
  user haproxy
  group haproxy
  daemon

defaults
  log global
  mode http
  option httplog
  option dontlognull
  timeout connect 5000
  timeout client 50000
  timeout server 50000

frontend http_front
  bind *:80
  default_backend http_back

backend http_back
  balance roundrobin
  server spring_boot_1 your_spring_boot_1_ip:8080 check
  server spring_boot_2 your_spring_boot_2_ip:8080 check

  #Restart HAProxy:
  sudo systemctl restart haproxy



##note Note
#Use the IP Address of the HAProxy Droplet:
#If you're accessing your APIs within the same network, you can use the private IP address of the HAProxy Droplet. This is useful for internal communication between services.
#Example:
#arduino
#Copy code
http://haproxy_private_ip/api/endpoint


#Use a Domain Name:
#If you have a domain name associated with your HAProxy Droplet, you can use it to access your APIs. This is typically used for external access.
http://your_domain_name/api/endpoint



