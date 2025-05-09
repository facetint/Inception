# 🚀 Inception

The Inception project challenges you to design a secure and modular infrastructure using Docker and Docker Compose. The goal is to configure several isolated services that communicate via Docker networks, with NGINX acting as a single secure entry point.

---

## What is Docker?

  Docker is an open platform that simplifies developing, shipping, and running applications by separating them from the underlying infrastructure, enabling faster and more consistent deployment.

  Docker is written in the Go programming language and takes advantage of several features of the Linux kernel to deliver its functionality. Docker uses a technology called namespaces to provide the isolated workspace called the container. When you run a container, Docker creates a set of namespaces for that container.

These namespaces provide a layer of isolation. Each aspect of a container runs in a separate namespace and its access is limited to that namespace.



## Docker architecture


  Docker uses a client-server architecture where the Docker client communicates with the Docker daemon to build, run, and manage containers. They can run on the same machine or connect remotely via a REST API over UNIX sockets or a network. Docker Compose is another client that manages multi-container applications.



![image](https://github.com/user-attachments/assets/1a71350c-a302-4c9b-8991-f2c84ed153d8)



## Docker Core Components

Docker is a platform that runs software applications inside containers. Containers provide isolated environments that make applications more efficient and portable. Let's explore the core components of Docker in detail.

---

## 1. **Docker Engine**
Docker Engine is the software that builds, runs, and manages Docker containers using a client-server architecture. It consists of two main components:
- **Docker Daemon** (`dockerd`): The background process that manages Docker containers.
- **Docker CLI (Command Line Interface)**: Allows users to manage Docker via the command line.

> **Visual**: Docker Engine acts as the interface between the CLI and the Docker Daemon, managing the container lifecycle.  
> (![image](https://github.com/user-attachments/assets/ed931afe-e020-4b88-afc2-71c423196c52)
)


---

## 2. **Containers**
Docker containers are lightweight, portable, and isolated environments that contain all the necessary components (libraries, dependencies, etc.) to run an application.

- **Containers**: Containers are isolated units running a specific application or service. Each container is derived from a Docker image, and multiple containers can run on the same host.

> **Visual**: The portability of containers across different systems, ensuring they work the same everywhere.  
<img width="674" alt="Ekran Resmi 2025-05-09 07 33 13" src="https://github.com/user-attachments/assets/a02a6bf7-921f-4fda-a0d1-8a557f3ec054" />

---

## 3. **Docker Images**
Docker images are read-only templates containing everything required to run a container, including the application code, libraries, dependencies, and configurations. Containers are created from images.

- **Dockerfile**: A script that defines how to build a Docker image, specifying the base operating system, software, and configuration details.

> **Visual**: The process of building an image from a Dockerfile.  
> ![image](https://github.com/user-attachments/assets/4aeecd11-b2ef-49ad-ad89-108d1104d784)


---

## 4. **Docker Hub and Registries**
Docker Hub is a central repository for storing and sharing Docker images. Users can download and share images via Docker Hub.

- **Public Repository**: Public images that anyone can access and use.
- **Private Repository**: Private repositories where users store images that only specific users can access.


---

## 5. **Docker Compose**
Docker Compose is a tool for defining and running multi-container applications. Compose allows you to define all the services of an application in a single YAML file and start them all at once with the `docker-compose up` command.

- **docker-compose.yml**: A configuration file that defines each service’s image, network connections, and other settings.

> **Visual**: A structure where multiple services are run simultaneously using Docker Compose.  
<img width="497" alt="Ekran Resmi 2025-05-09 07 38 49" src="https://github.com/user-attachments/assets/76635ee4-a80a-493c-93ad-3a41bccdef44" />

---

## 6. **Docker Volumes**
Containers are isolated environments, so persistent storage is required to prevent data loss. Docker Volumes ensure that data is stored persistently across containers.

- **Data Sharing**: Data doesn't get lost when a container is stopped. Volumes allow data to be shared between containers.

> **Visual**: How data is transferred between containers using Docker Volumes.  
> ![image](https://github.com/user-attachments/assets/be1af951-a376-4e6a-b2b0-2b627c9f9603)


---

## 7. **Docker Network**
Docker networks define how containers communicate with each other and with the outside world. Docker provides a virtual network environment for each container.

- **Bridge Network**: The default network type, where containers can communicate with each other only within the same network.
- **Host Network**: Containers use the host machine’s network.
- **Overlay Network**: Enables communication between containers on different hosts.

> **Visual**: How Docker network enables data communication between containers.  
> ![image](https://github.com/user-attachments/assets/895a9421-7e8d-4224-93c0-3a26374b1188)


## Conclusion
Docker is a powerful platform that enables running applications in portable and isolated environments. The core components such as **Docker Engine**, **Containers**, **Images**, **Docker Compose**, **Volumes**, and **Networks** provide a complete solution for managing containerized applications efficiently.

Learning and using Docker will increase the portability and efficiency of your applications!

---

### References
- [Docker Official Documentation](https://docs.docker.com/)
- [Docker Hub](https://hub.docker.com/)
