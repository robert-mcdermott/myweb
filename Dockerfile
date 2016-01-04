# Use Ubuntu 14.04 as the base container
FROM ubuntu:14.04

MAINTAINER "Robert McDermott" robert.c.mcdermott@gmail.com

# Update the system and install packages
RUN apt-get -y -qq update && apt-get -y -qq install \
	vim \
	nginx \
	python 

ADD testsuite.py /root/
ADD index.html /usr/share/nginx/html/

RUN chmod 755 /root/testsuite.py
#RUN /root/testsuite.py fail

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
