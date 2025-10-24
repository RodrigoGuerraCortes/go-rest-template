package db

import (
	"context"
	"fmt"
	"log"

	"github.com/RodrigoGuerraCortes/go-rest-template/ent"
	_ "github.com/lib/pq"
)

func NewPostgresClient() *ent.Client {
	dsn := "host=db port=5432 user=postgres password=postgres dbname=go_rest sslmode=disable"
	client, err := ent.Open("postgres", dsn)
	if err != nil {
		log.Fatalf("failed opening connection to postgres: %v", err)
	}

	if err := client.Schema.Create(context.Background()); err != nil {
		log.Fatalf("failed creating schema resources: %v", err)
	}

	fmt.Println("✅ Connected to PostgreSQL and schema created successfully.")
	return client
}
