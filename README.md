# Inception
This project aims to broaden the knowledge of system administration by using Docker. It's about virtualizing several Docker images, creating them in a virtual machine.

The goal is to set up a small infrastructure composed of different services under specific rules.

## Main rules

- Each service has to run in a dedicated container.
- Each container must be build from a stable version of either Alpine or Debian.
- Write your own Dockerfiles, one per service.
- ***It is forbidden to pull ready-made Docker images or use services like DockerHub.*** (Alpine / Debian beeing excluded from this rule.)
- The Dockerfiles must be called in the docker-compose.yml by the Makefile.
- Containers have to restart in case of a crash.
- Configure your domain name so it points to your local IP address. This domain name must be <login>.42.fr.
- Using network: host or --link or links: is forbidden.
- Your containers musn’t be started with a command running an infinite loop (for example tail -f, bash, sleep infinity, while true).
- The latest tag is prohibited.
- No password must be present in your Dockerfiles.

## Infrastructure to set up
### Mandatory
- container running NGINX with TLSv1.2 or 1.3
- container with WordPress + php-fpm installed and configured, but without NGINX
- container with MariaDB
- volume that contains the WordPress database
- volume that contains WordPress website files
- docker-network that establishes connection between the containers

### Bonus
- Redis-cache for the WordPress website  
- FTP server pointing to the volume of the WordPress website
- Simple static website (PHP not allowed)
- Adminer
- Service of your choice: Borg Backup


# Example for a digram of the expected infrastructure
<img width="492" alt="Screenshot 2022-12-19 at 17 02 57" src="https://user-images.githubusercontent.com/82594855/208468278-bc7bf737-e546-4900-b96c-4f23f185026d.png"> [^1]

[^1]: taken from the subject pdf
