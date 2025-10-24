APP_NAME = go-rest-template
CMD_DIR = cmd/api
BINARY = bin/$(APP_NAME)

run:
	go run $(CMD_DIR)/main.go

build:
	go build -o $(BINARY) $(CMD_DIR)/main.go

test:
	go test ./... -cover

clean:
	rm -rf bin

docker-build:
	docker build -t $(APP_NAME):latest .

docker-run:
	docker run -p 8080:8080 $(APP_NAME):latest

# ============================================
# 🧩 MIGRACIONES CON ATLAS + ENT
# ============================================

include .env
export $(shell sed 's/=.*//' .env)

# Generar el código de Ent (modelos y migraciones)
ent-generate:
	@echo "⚙️  Generando código Ent..."
	go generate ./ent

# Crear nueva migración
# Ejemplo: make atlas-diff name=add_users_table
atlas-diff:
	@if [ -z "$(name)" ]; then \
		echo "❌ Debes especificar un nombre: make atlas-diff name=add_users_table"; exit 1; \
	fi
	@echo "🧩 Generando migración Atlas: $(name)"
	atlas migrate diff $(name) \
		--dir "file://ent/migrate/migrations" \
		--to "ent://ent/schema" \
		--dev-url "$$DEV_URL"

# Aplicar migraciones usando el esquema de revisiones existente
atlas-apply:
	@echo "🚀 Aplicando migraciones..."
	atlas migrate apply \
		--dir "file://ent/migrate/migrations" \
		--url "$$DB_URL" \
		--revisions-schema atlas_schema_revisions

# Ver estado de migraciones
atlas-status:
	@echo "📊 Estado de migraciones:"
	atlas migrate status \
		--dir "file://ent/migrate/migrations" \
		--url "$$DB_URL" \
		--revisions-schema atlas_schema_revisions

# Ejecutar todo el proceso completo
migrate-all: ent-generate atlas-diff atlas-apply
	@echo "✅ Migraciones generadas y aplicadas con éxito."



# Levantar todo con entorno .env.compose
#docker compose --env-file .env.compose up -d
#
## Verificar el estado de los servicios
#docker compose ps -a
#
## Revisar los logs de migraciones
#docker logs go-rest-template-migrations-1
#
## Verificar que la API está arriba
#curl http://localhost:8080/api/v1/health