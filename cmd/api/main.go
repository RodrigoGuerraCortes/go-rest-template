package main

import (
	"fmt"
	"log"

	"github.com/RodrigoGuerraCortes/go-rest-template/internal/db"
	"github.com/gin-gonic/gin"
)

func main() {
	client := db.NewPostgresClient()
	defer client.Close()

	router := gin.Default()

	router.GET("/api/v1/health", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"status":  "ok",
			"message": "Go REST Template is running 🚀",
		})
	})

	port := "8080"
	fmt.Printf("🚀 Server running at http://localhost:%s\n", port)
	if err := router.Run(":" + port); err != nil {
		log.Fatalf("Failed to start server: %v", err)
	}
}
