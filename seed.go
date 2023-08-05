package seed

import (
	"fmt"
	"os"
	"os/exec"
)

func init() {
	if len(os.Args) < 2 {
		fmt.Println("Please provide a command: create-seeder or run-seeder")
		os.Exit(1)
	}

	command := os.Args[1]

	switch command {
	case "create-seeder":
		if len(os.Args) < 3 {
			fmt.Println("Please provide the entity name.")
			os.Exit(1)
		}
		entity := os.Args[2]
		cmd := exec.Command("./scripts/seeder.sh", entity)
		cmd.Stdout = os.Stdout
		cmd.Stderr = os.Stderr
		if err := cmd.Run(); err != nil {
			fmt.Println("Error running create-seeder:", err)
		}

	default:
		fmt.Println("Unknown command:", command)
	}
}
