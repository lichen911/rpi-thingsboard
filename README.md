# rpi-thingsboard

I wanted to install Thingsboard in a container on my Raspberry Pi, but I couldn't find any suitable images that already existed. So, I created one based on arm32v7/openjdk:8-jre that installs Thingsboard 2.3 via the deb package. I believe this should support any DB type using environment variables, but I built this with the intent to use with a postgres instance outside of the container.
