# in order to deploy the infrastructure you should do the following things:
## make sure to have hombrew installed on your laptop and install the following packages
```bash
brew install terragrunt
brew install helmfile
brew install awscli
```

# step 2:
## create the infrastructure with terragrunt
```bash
cd infrastructure/test/us-east-1/eks
terragrunt run-all init
terragrunt run-all apply
```

# step 3:
## install the helmfile on the cluster
```bash
aws eks update-kubeconfig --name us-east-1-talon-eks --alias  us-east-1-talon-eks

cd infrastructure/test/us-east-1/eks

helmfile sync
```