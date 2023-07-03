      ___     ___   __   __   ___      ___    ___   
     |   \   | __|  \ \ / /  / _ \    | _ \  / __|  
     | |) |  | _|    \ V /  | (_) |   |  _/  \__ \  
     |___/   |___|   _\_/_   \___/   _|_|_   |___/  

# DevOps Project
This is the devops project and will contain all automation related to CI Architecture. 


Folder Structure
 - sample - Project samples.  
 - templates - cicd templates for microservices (might extend for all frameworks).
 - training - Include some templates for implementing ci/cd workflow.

# What you'll learn
- Understand the basics of the Azure DevOps architecture.
- Understand with seperate Application and DevOps repositories
- Implement CICD Pipelines With Azure Pipelines Templates
- Understand the basic scenario CICD flow (Build -> Run Testing -> Build Images -> Sonar analysis -> Quality Gateway -> Push Images -> Scan Source Code, Scan Docker Images -> Deploy to AKS)

# Prerequisite
- Basic knowledge of Jenkins or GitLab or any tools
- Basic knowledge of automation and the CI-CD strategy
- Basic knowledge of Docker and K8S

# Requirement
- Azure DevOps has
      - already existing project
	- installed some
		- Plugins:
			- trivy
			- ReportGenerator
			- Replace Tokens
	- Service connections: already integrate with
		- GitHub (target dashboard)
		- ACR with Service connection type Docker Registry
		- Kubernetes with Service connection type Kubernetes
	- Project -> Pipelines
   		- Environments
			- Create New Environment:
				- Name: test
				- Resource: Kubernetes (Put all information to integrate with AKS)
		- Library
			- Create 2 variables group:
				- bookstore
					- csproject
					- projectname
					- SONAR_PROJECT
				- demo_var
					- acrUrl
					- baseImage
					- containerName
					- imageVersionDotnet
					- imageVersionSonar
					- Registry
					- runtime
					- SONAR_TOKEN
					- SONAR_URL
- SonarQube Server
  	- Generate Tokens
- ACR
  	- Admin user: Enable
- MSSQL
- AKS
	- Attach an ACR to an AKS cluster:
   		- az aks update -n myAKSCluster -g myResourceGroup --attach-acr <acr-name>
- Repositories:
	- https://github.com/nashtech-garage/dotnet-bookstore-api/tree/azuredevops


# Refer
- https://learn.microsoft.com/en-us/azure/devops/pipelines/get-started/pipelines-sign-up?view=azure-devops
