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


---


## Dockerfile Overview

A **Dockerfile** is a text document that contains all the commands needed to assemble a Docker image. It supports various instructions that allow you to automate the creation of Docker images.

## Common Dockerfile Instructions

| **Instruction** | **Description**                                                                 |
|-----------------|---------------------------------------------------------------------------------|
| **ADD**         | Add local or remote files and directories.                                      |
| **ARG**         | Use build-time variables.                                                       |
| **CMD**         | Specify default commands to run when the container starts.                      |
| **COPY**        | Copy files and directories into the container.                                  |
| **ENTRYPOINT**  | Specify the default executable to run.                                          |
| **ENV**         | Set environment variables inside the container.                                 |
| **EXPOSE**      | Indicate which ports the container listens on.                                  |
| **FROM**        | Define the base image for the build.                                            |
| **HEALTHCHECK** | Specify a command to check the health of the container.                         |
| **LABEL**       | Add metadata to an image.                                                       |
| **MAINTAINER**  | Specify the author of the image.                                                |
| **ONBUILD**     | Define instructions to be executed when the image is used in a build.          |
| **RUN**         | Execute commands during the image build.                                        |
| **SHELL**       | Set the default shell for the container.                                        |
| **STOPSIGNAL**  | Define the signal to stop the container.                                        |
| **USER**        | Set the user and group ID for running commands.                                 |
| **VOLUME**      | Create mount points for volumes.                                                |
| **WORKDIR**     | Set the working directory for subsequent instructions.                         |

### Dockerfile Format

- Each instruction is typically written in **UPPERCASE** for readability.
- A Dockerfile begins with the `FROM` instruction, which specifies the base image.
- Comments begin with `#` and can be placed on separate lines or after an instruction.
  
  Example:
  ```dockerfile
  # This is a comment
  FROM ubuntu
  RUN echo "Hello, Docker!"

![image](https://github.com/user-attachments/assets/b758dcee-5058-4870-9467-c7b4f30696f6)




## Docker Commands Cheat Sheet

Docker is a powerful tool for managing containers. Here are some essential Docker commands to get you started:

---

### 1. **`docker --version`**

  Displays the installed Docker version.

```bash
docker --version
````

### 2. **`docker run`**

  Runs a container from an image.

```bash
docker run -d -p 8080:80 nginx

```
>> Starts a container in detached mode and maps port 8080 on the host to port 80 inside the container.


### 3. **`docker ps`**

Lists running containers.

```bash
docker ps

```

### 4. **`docker exec`**

  Executes a command inside a running container.

```bash
docker exec -it <container-id> /bin/bash
```

### 5. **`docker build`**

  Builds an image from a Dockerfile.

```bash
docker build -t myapp .
```

### 6. **`docker images`**
Lists all Docker images on your machine.

```bash
docker images

```


### 7. **`docker stop`**
Stops a running container.

```bash
docker stop <container-id>
```

### 8. **`docker start`**
Starts a stopped container.

```bash
docker start <container-id>

```

###  9. **`docker rm`**
Removes a container.

```bash
docker rm <container-id>

```

### 10. **`docker rmi`**
Removes an image.

```bash
docker rmi <image-id>
```


## Difference Between Docker Containers and Virtual Machines



![image](https://github.com/user-attachments/assets/c4a32ff4-582e-45ae-b45a-ad6676568b6f)





| **Feature**                                | **Docker Containers**                                                                                       | **Virtual Machines (VMs)**                                                                                          |
|--------------------------------------------|-------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| **Operating System**                       | Containers rely on the underlying OS kernel and do not have a separate guest OS.                             | VMs have their own operating system, which runs on top of a hypervisor.                                                |
| **Size and Resource Usage**                | Containers are lightweight because they don’t include an OS, just the application and necessary libraries.    | VMs are significantly larger because they include the entire OS and application, requiring more resources.            |
| **Resource Sharing**                       | Containers share resources like CPU, memory, and storage with other containers on the same host OS.          | Each VM has its own resources like CPU, memory, and storage, which are isolated from other VMs.                       |
| **Process Isolation**                      | OS-level process isolation, sharing the kernel with other containers.                                        | Hardware-level process isolation, which makes VMs slower to boot and more resource-intensive.                        |
| **Boot Time**                              | Containers boot up quickly as they share the underlying OS kernel.                                           | VMs are slower to boot because they require starting up a full operating system.                                      |
| **Use Case**                               | Ideal for microservices, lightweight applications, and environments that need fast scaling.                   | Best for running multiple different operating systems or applications that require full OS environments.             |


### Docs
- [Docker Official Documentation](https://docs.docker.com/)
- [Docker Hub](https://hub.docker.com/)


