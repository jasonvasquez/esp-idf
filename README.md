# ESP32 Dev Environment in a Box

This is a Docker image that runs the minimal ESP32 dev setup within a Docker container.  Theoretically, this will work great from a Linux host, simply mapping the host serial USB device into the container.

For MacOS users... compiling code is currently successful, but, attempting to flash from a MacOS host using Docker for Mac does not work at this time, due to lack of support in Docker for Mac to map USB devices into containers.