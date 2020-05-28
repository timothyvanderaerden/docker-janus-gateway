# docker-janus-gateway

Alpine based Docker image for the Janus WebRTC Server.

## Janus WebRTC Server

Janus is an open source, general purpose, WebRTC server designed and developed by [Meetecho](http://www.meetecho.com). This version of the server is tailored for Linux systems, although it can be compiled for, and installed on, MacOS machines as well. Windows is not supported, but if that's a requirement, Janus is known to work in the "Windows Subsystem for Linux" on Windows 10: do **NOT** trust repos that provide .exe builds of Janus, they are not official and will not be supported.

For some online demos and documentations, make sure you pay the [project website](https://janus.conf.meetecho.com/) a visit!

If you have questions on Janus, or wish to discuss Janus with us and other users, please join our [meetecho-janus](https://groups.google.com/forum/#!forum/meetecho-janus) Google Group. If you encounter bugs, please submit an issue on [GitHub](https://github.com/meetecho/janus-gateway/issues): make sure you read the [guidelines](.github/ISSUE_TEMPLATE.md) before opening an issue, though.

## Getting started

### Prerequisites

Docker should be installed, please refer to [their documentation](https://docs.docker.com/get-docker/) to install Docker on the targeted system.

### Usage

Build the image:

```
$ docker build -t janus-gateway .
```

Run the image:

```
$ docker run -d -p 8088:8088 -p 8188:8188 janus-gateway
```

## Description

Janus operates on following ports:

* **8088**: HTTP REST interface
* **8188**: WebSocket interface
