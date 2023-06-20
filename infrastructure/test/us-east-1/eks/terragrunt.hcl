include "root" {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path                             = "../vpc"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs                            = {
    private_subnets = ["fake-subnet-id", "fake-subnet-id2"],
    vpc_id          = "fake-vpc-id"
  }
}

terraform {
  source = "${get_path_to_repo_root()}//modules/eks"
}
inputs = {
    vpc_id     = dependency.vpc.outputs.vpc_id
    subnet_ids = dependency.vpc.outputs.private_subnets
}