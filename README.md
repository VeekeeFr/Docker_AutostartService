# Docker_AutostartService
Adds a docker container autostart service (systemctl)

=== Installation ===
File docker_autostart.service should be manually edited in order to set install path.

sudo ln -s $PWD/docker_autostart.service /etc/systemd/system/docker_autostart.service
sudo systemctl enable /home/core/autostart/docker_autostart.service
sudo systemctl start docker_autostart.service

=== Configuration ===
File docker_env.list should list all Docker containers (by order of start).

=== Logging ===
A service.log file is present in install directory.

It is also possible to user systemctl log view :
systemctl status docker_autostart.service
