# Dockerfile
# FROM debian:latest
# FROM ubuntu:latest
# FROM fedora:latest
# FROM linuxmintd/mint21.2-amd64:latest
# FROM archlinux:latest 
# FROM opensuse/leap:latest

# Skopiuj pliki do obrazu
COPY distro.sh /app/distro.sh
COPY library.sh /app/library.sh

# Nadaj odpowiednie uprawnienia
RUN chmod +x /app/distro.sh
RUN chmod +x /app/library.sh

# Ustaw bieżący katalog
WORKDIR /app
