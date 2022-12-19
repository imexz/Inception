# initializes a new build stage and sets the Base Image for subsequent instructions.
FROM debian:buster

# execute any commands in a new layer on top of the current image and commit the results.
# The resulting committed image will be used for the next step in the Dockerfile
RUN apt-get update && apt-get -y install --no-install-recommends \
	nginx \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -f /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

COPY conf/default /etc/nginx/sites-available
# indicates the ports on which a container listens for connections, by default assumes /tcp

COPY ./tools /var/www/html

RUN chmod +x /var/www/html/images

COPY conf/default /etc/nginx/sites-available

WORKDIR /etc/nginx/sites-enabled

RUN ln -s ../sites-available/default .

WORKDIR /

EXPOSE 80

# provide defaults for an executing container (which software should run).
# These defaults can include an executable, or they can omit the executable,
# in which case you must specify an ENTRYPOINT instruction as well.
CMD ["nginx", "-g", "daemon off;"]