# 🚀 Inception

The Inception project challenges you to design a secure and modular infrastructure using Docker and Docker Compose. The goal is to configure several isolated services that communicate via Docker networks, with NGINX acting as a single secure entry point.

---

## 📚 Project Description

You are required to:
- Create your own Dockerfiles (no pulling ready images from DockerHub except Alpine/Debian).
- Host all services in separate containers.
- Use volumes for persistent data.
- Secure your infrastructure using TLS (via NGINX).
- Avoid common Docker anti-patterns such as infinite loops, improper daemonization, etc.

---

### 🧱 Infrastructure Overview

The final architecture will include the following services:

| Service      | Description |
|--------------|-------------|
| **NGINX**     | Acts as a secure reverse proxy, handling HTTPS (TLS v1.2 or v1.3 only). |
| **WordPress** | Installed with `php-fpm`, no NGINX inside the container. |
| **MariaDB**   | Hosts the database for WordPress, without any web server installed. |
| **Volumes**   | Two persistent volumes (one for database data, one for WordPress site files). |
| **Docker Network** | All containers are connected via a dedicated user-defined bridge network. |

---

### 🌐 Domain Configuration

- Your WordPress site must be accessible only through `https://login.42.fr`.
- Replace `login` with your actual 42 intra username.
- The domain should resolve to your local IP for testing purposes (via `/etc/hosts` or DNS override).

---

### ⚙️ Technical Constraints

- ❌ No usage of `network: host`, `--link`, or `links:` in `docker-compose.yml`.
- ❌ No `latest` tags.
- ❌ No infinite loops (`tail -f`, `while true`, etc.) to keep containers alive.
- ❌ No plaintext passwords in Dockerfiles.
- ✅ Containers must restart on failure (`restart: always`).
- ✅ Environment variables must be used for all sensitive data.
- ✅ Use of `.env` and Docker secrets is strongly encouraged.

---

### Docker Compose File (`docker-compose.yml`):

- All services will be defined here.
- The `build` part of each service should be directed to its own Dockerfile.
- Fields like `volumes`, `networks`, `environment`, `depends_on`, `restart`, `ports` must be defined correctly.

---

### 🗝️ .env File:

- Environment variables will be pulled from here.
- Passwords, usernames, database information should be defined here.
- `.env` file should be imported into `.gitignore`.#### Docker Compose File (`docker-compose.yml`):


