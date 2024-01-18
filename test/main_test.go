package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformAzDoAgent(t *testing.T) {
	t.Parallel()
	// retryable errors in terraform testing.
	options := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "./fixtures",
	})

	defer terraform.Destroy(t, options)

	terraform.InitAndApply(t, options)

	//**********************************
	//test_one module
	//**********************************

	output := terraform.Output(t, options, "test_one_app_service")
	assert.Equal(t, "app-pa-mgt-scus-01", output)

	output = terraform.Output(t, options, "test_one_storage_account")
	assert.Equal(t, "stsrspamgtscus01", output)

	output = terraform.Output(t, options, "test_one_subnet")
	assert.Equal(t, "snet-pa-mgt-scus-01", output)

	output = terraform.Output(t, options, "test_one_virtual_network")
	assert.Equal(t, "vnet-pa-mgt-scus-03", output)

	//test_two_virtual_network = "vnet-svt-prd-acc-cc-02"
	output = terraform.Output(t, options, "test_one_rg")
	assert.Equal(t, "rg-pa-mgt-scus-01", output)

	// //**********************************
	// //test_two module
	// //**********************************	

	//test_two_app_service_output = "app-rh-prd-scus-02"
	test_two_app_service := terraform.Output(t, options, "test_two_app_service")
	assert.Equal(t, "app-rh-prd-ncus-02", test_two_app_service)

	//test_two_storage_account = "stsvtprdacccc02"
	test_two_storage_account := terraform.Output(t, options, "test_two_storage_account")
	assert.Equal(t, "stsrsrhprdncus02", test_two_storage_account)

	//test_two_subnet = "snet-svt-prd-acc-cc-02"
	test_two_subnet := terraform.Output(t, options, "test_two_subnet")
	assert.Equal(t, "snet-rh-prd-ncus-02", test_two_subnet)

	//test_two_virtual_network = "vnet-svt-prd-acc-cc-02"
	test_two_virtual_network := terraform.Output(t, options, "test_two_virtual_network")
	assert.Equal(t, "vnet-rh-prd-ncus-02", test_two_virtual_network)


	// //**********************************
	// //test_two_random module
	// //**********************************	

	test_two_random_app_service := terraform.Output(t, options, "test_two_random_app_service")
	assert.NotEqual(t, test_two_app_service, test_two_random_app_service)

	test_two_random_storage_account := terraform.Output(t, options, "test_two_random_storage_account")
	assert.NotEqual(t, test_two_storage_account, test_two_random_storage_account)
	
	// //**********************************
	// //test_three module
	// //**********************************		
	// test_three_rg = "rg-ad-idt-scus-01"
	output = terraform.Output(t, options, "test_three_rg")
	assert.Equal(t, "rg-ad-idt-scus-01", output)
	
	// // test_three_subnet = "snet-dnl-prod-it-scu"
	// output = terraform.Output(t, options, "test_three_subnet")
	// assert.Equal(t, "snet-dnl-prod-it-scu", output)
	
	// // test_three_virtual_network = "vnet-dnl-prod-it-scu"
	// output = terraform.Output(t, options, "test_three_virtual_network")
	// assert.Equal(t, "vnet-dnl-prod-it-scu", output)

}