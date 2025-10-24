# ============================================
# 🐋 Go REST Template - Multi-stage Dockerfile
# ============================================

# ---- Stage 1: Builder ----
FROM golang:1.23-alpine AS builder

WORKDIR /app

# Instalar dependencias del sistema
RUN apk add --no-cache git

# Copiar go.mod y go.sum y descargar dependencias
COPY go.mod go.sum ./
RUN go mod download

# Copiar el código fuente
COPY . .

# Compilar binario optimizado
RUN go build -o go-rest-template ./cmd/api

# ---- Stage 2: Runtime ----
FROM alpine:latest

WORKDIR /app

# Copiar binario desde el builder
COPY --from=builder /app/go-rest-template .

# Copiar configuración
COPY config/config.yaml ./config/config.yaml

# Exponer puerto
EXPOSE 8080

# Comando de inicio
CMD ["./go-rest-template"]
