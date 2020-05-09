# dev-spaces-multiple-projects

Sample showing how to deploy to Azure DevSpaces a .NET Core WebAPI that references a class library project.

## Project structure

```cli
├───mywebapi
│   └───Controllers
│
└───mywebapi.Common
```

## Getting started

```cli
# Select your Azure DevSpace
$> azds space select -n <your-devspace> -y

# Check your current context
$> azds show-context

# In the .sln directory, run
$> azds prep --enable-ingress

# Deploy the API to the dev space
$> azds up
```
