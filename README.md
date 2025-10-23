# 🧩 Go REST Template — Clean Architecture + Docker + PostgreSQL

>  🇬🇧 English below 🇪🇸 Español arriba

---

## 🇪🇸 Descripción

**Go REST Template** es una plantilla base desarrollada en **Go (Golang)** con una arquitectura limpia y desacoplada, lista para construir APIs REST modernas, seguras y fácilmente desplegables.

Este proyecto integra:

* 🧱 **Clean Architecture** — separación clara entre capas.
* 🐘 **PostgreSQL** — base de datos relacional.
* 🐳 **Docker + Docker Compose** — entorno de desarrollo reproducible.
* ⚙️ **Makefile** — comandos automatizados para ejecutar, testear y construir.
* 🧪 **Endpoint de salud** — `/api/v1/health` para verificación rápida.
* 🌍 **Preparado para CI/CD** — ideal para integración con GitHub Actions.

---

## 🚀 Cómo ejecutar el proyecto

### 🧮 1. Clonar el repositorio

```bash
git clone https://github.com/RodrigoGuerraCortes/go-rest-template.git
cd go-rest-template
```

### 🐳 2. Levantar con Docker

```bash
docker compose up --build -d
```

Esto levantará dos contenedores:

* `go-rest-template` (API)
* `postgres-db` (Base de datos PostgreSQL)

### 🔍 3. Verificar el estado

Abre en tu navegador:
👉 [http://localhost:8080/api/v1/health](http://localhost:8080/api/v1/health)

Deberías ver:

```json
{
  "status": "ok",
  "message": "Go REST Template is running 🚀"
}
```

---

## ⚙️ Variables de entorno

Las variables se definen en el archivo `.env` o directamente en `docker-compose.yml`.

| Variable      | Descripción                    | Valor por defecto |
| ------------- | ------------------------------ | ----------------- |
| `APP_ENV`     | Entorno de ejecución           | `development`     |
| `APP_PORT`    | Puerto del servidor            | `8080`            |
| `DB_HOST`     | Host de la base de datos       | `db`              |
| `DB_PORT`     | Puerto del servicio PostgreSQL | `5432`            |
| `DB_USER`     | Usuario de PostgreSQL          | `postgres`        |
| `DB_PASSWORD` | Contraseña del usuario         | `postgres`        |
| `DB_NAME`     | Base de datos                  | `go_rest`         |

---

## 🧱 Estructura del proyecto

```
go-rest-template/
├── cmd/api/               # Punto de entrada del servidor
├── internal/
│   ├── handler/           # Endpoints HTTP
│   ├── service/           # Lógica de negocio
│   ├── model/             # Modelos y DTOs
│   └── repository/        # Capa de acceso a datos
├── config/                # Archivos de configuración (YAML, ENV)
├── Dockerfile             # Imagen multi-stage optimizada
├── docker-compose.yml     # Servicios API + DB
├── Makefile               # Comandos para desarrollo
└── README.md
```

---

## 🧰 Comandos útiles

| Comando                | Descripción                     |
| ---------------------- | ------------------------------- |
| `make run`             | Ejecuta el servidor local       |
| `make build`           | Compila el binario del proyecto |
| `make test`            | Corre todos los tests           |
| `make tidy`            | Limpia dependencias             |
| `docker compose up -d` | Levanta el entorno con Docker   |
| `docker compose down`  | Detiene los contenedores        |

---

## 🧠 Próximas características

* 🔐 Autenticación JWT
* 👤 CRUD de usuarios (Go + PostgreSQL)
* 🧪 Pruebas unitarias y de integración
* ☁️ Pipeline CI/CD con GitHub Actions
* 📘 Documentación Swagger

---

## 👨‍💻 Autor

**Rodrigo Guerra Cortés**
Full Stack Developer | Go, Laravel & Clean Architecture | 🇨🇱
📧 [rguerracortes@gmail.com](mailto:rguerracortes@gmail.com)
🌐 [LinkedIn](https://linkedin.com/in/rodrigoguerracortes)

---

# 🇬🇷 Go REST Template — Clean Architecture + Docker + PostgreSQL

## 📘 Overview

**Go REST Template** is a clean, modular, and production-ready REST API boilerplate built with **Go (Golang)**.
It follows **Clean Architecture** principles and includes a **Dockerized setup** with **PostgreSQL**, ready for CI/CD pipelines.

---

## 🚀 Features

* 🧩 **Clean Architecture** — modular and maintainable design.
* 🐘 **PostgreSQL integration** — relational database support.
* 🐳 **Docker & Compose ready** — reproducible environments.
* ⚙️ **Makefile automation** — simple commands for build/test/run.
* 🧪 **Health check endpoint** — `/api/v1/health` confirms server status.
* 🧠 **Ready for CI/CD** — GitHub Actions & Coveralls friendly.

---

## ⚙️ Run locally with Docker

```bash
docker compose up --build -d
```

Then visit 👉 [http://localhost:8080/api/v1/health](http://localhost:8080/api/v1/health)

Expected response:

```json
{
  "status": "ok",
  "message": "Go REST Template is running 🚀"
}
```

---

## 📂 Project structure

```
go-rest-template/
├── cmd/api/               # Entry point
├── internal/
│   ├── handler/           # HTTP endpoints
│   ├── service/           # Business logic
│   ├── model/             # Data models
│   └── repository/        # Database layer
├── config/
├── Dockerfile
├── docker-compose.yml
├── Makefile
└── README.md
```

---

## 🧰 Makefile commands

| Command                | Description        |
| ---------------------- | ------------------ |
| `make run`             | Run server locally |
| `make build`           | Build binary       |
| `make test`            | Run tests          |
| `make tidy`            | Clean dependencies |
| `docker compose up -d` | Start containers   |
| `docker compose down`  | Stop containers    |

---

## 🧱 Next Steps

* Add **JWT authentication**
* Implement **CRUD /users**
* Add **Swagger documentation**
* Add **unit + integration tests**
* Configure **CI/CD**

---

## 👨‍💻 Author

**Rodrigo Guerra Cortés**
Full Stack Developer | Go, Laravel & Clean Architecture | 🇨🇱
📧 [rguerracortes@gmail.com](mailto:rguerracortes@gmail.com)
🌐 [LinkedIn](https://linkedin.com/in/rodrigoguerracortes)

---

🪪 Licensed under the **MIT License**.
Feel free to use, fork, and improve this template.
