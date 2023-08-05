#!/bin/bash

# Cek apakah nama entitas disediakan
if [ -z "$1" ]; then
  echo "Error: Entity name must be provided."
  exit 1
fi

# Buat direktori seeder jika belum ada
mkdir -p seeder

# Definisikan nama file berdasarkan nama entitas
filename="seeder/${1}_seeder.go"

# Buat file dengan isi yang diperlukan
cat >$filename <<EOL
package seeder

import (
	"gorm.io/gorm"
)

func Seed$1(db *gorm.DB) error {
    // You can define your seed data here
    // Example:
    // items := []YourModel{
    //     {Field1: "value1", Field2: "value2"},
    //     // ...
    // }

    // Insert your seed data into the database
    // Example:
    // for _, item := range items {
    //     if err := db.Create(&item).Error; err != nil {
    //         return err
    //     }
    // }
    return nil
}
EOL

echo "Seeder file created for $1: $filename"
