package test

import (
	"context"
	"fmt"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
	"go.mongodb.org/mongo-driver/mongo/readpref"
	"os/exec"
    "os"
	"testing"
)

// TestExamplesComplete tests a typical deployment of this module. It will verify the SSM parameter is set correctly
// and that snapshots are all working as expected.
func TestExamplesCluster(t *testing.T) {
	fmt.Println("start test----------")
	t.Parallel()

	MONGO_ORG := os.Getenv("MONGODB_ATLAS_ORG")
	terraformOptions := &terraform.Options{
		TerraformDir: "../../examples/complete",
		Vars: map[string]interface{}{
			"org_id": MONGO_ORG,
		},
	}
	defer terraform.Destroy(t, terraformOptions)

	terraform.Init(t, terraformOptions)
	// recursively set prevent destroy to false
	cmd := exec.Command("bash", "-c", "find . -type f -name '*.tf' -exec sed -i'' -e 's/prevent_destroy = true/prevent_destroy = false/g' {} +")
	cmd.Dir = "../../"
	cmd.Run()
	terraform.ApplyAndIdempotent(t, terraformOptions)

	dbPassword := terraform.Output(t, terraformOptions, "password")
	mongoUri := terraform.Output(t, terraformOptions, "cluster_connection_string")

	c1 := "mongodb+srv://terraform-mongo-atlas-user:"
	c2 := "/test?retryWrites=true&w=majority"
	appendURI := c1 + dbPassword + "@" + mongoUri + c2
	fmt.Println("output appendURI: ", appendURI)

	// Create a new client and connect to the server
	client, err := mongo.Connect(context.TODO(), options.Client().ApplyURI(appendURI))
	if err != nil {
		panic(err)
	}
	defer func() {
		if err = client.Disconnect(context.TODO()); err != nil {
			panic(err)
		}
	}()
	// Ping the primary
	if err := client.Ping(context.TODO(), readpref.Primary()); err != nil {
		panic(err)
	}
	fmt.Println("Successfully connected")
}
