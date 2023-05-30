package test

import (
	"context"
	"fmt"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
	"go.mongodb.org/mongo-driver/mongo/readpref"
	"os"
	"os/exec"
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
}
