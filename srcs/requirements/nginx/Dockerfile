# initializes a new build stage and sets the Base Image for subsequent instructions.
FROM debian:buster

# execute any commands in a new layer on top of the current image and commit the results.
# The resulting committed image will be used for the next step in the Dockerfile
RUN apt-get update && apt-get -y install --no-install-recommends \
	nginx \
	openssl \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -f /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# create openssl certificate
RUN openssl req -x509 -days 365 -newkey rsa:4096 -nodes \
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/certs/nginx.crt -sha256 -subj "/CN=mstrantz.42.fr"

#RUN	rm -f /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

COPY conf/default /etc/nginx/sites-available
# indicates the ports on which a container listens for connections, by default assumes /tcp

WORKDIR /etc/nginx/sites-enabled

RUN ln -s ../sites-available/default .

WORKDIR /

EXPOSE 443

# provide defaults for an executing container (which software should run).
# These defaults can include an executable, or they can omit the executable,
# in which case you must specify an ENTRYPOINT instruction as well.
CMD ["nginx", "-g", "daemon off;"]
