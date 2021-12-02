# Synapse Delta

Contains delta format stuff, plus more stuff.

[Dec 2021 Update](https://techcommunity.microsoft.com/t5/azure-synapse-analytics-blog/azure-synapse-analytics-november-2021-update/ba-p/3020740)

# DevOps 

My Demo URLs:
* [GitHub repo](https://github.com/hfleitas/synapsedelta)
* [ADO org](https://dev.azure.com/hiramfleitas0814/)
* [Dev workspace](https://ms.web.azuresynapse.net/en-us/authoring/analyze?subFolderPath=&workspace=%2Fsubscriptions%2Fe4e06275-58d1-4081-8f1b-be12462eb701%2FresourceGroups%2Fwplushiramsynapse%2Fproviders%2FMicrosoft.Synapse%2Fworkspaces%2Fwplushiramsynapse)
* [Prod workspace](https://ms.web.azuresynapse.net/en-us/home?subFolderPath=&workspace=%2Fsubscriptions%2Fe4e06275-58d1-4081-8f1b-be12462eb701%2FresourceGroups%2Foneclicksynapse%2Fproviders%2FMicrosoft.Synapse%2Fworkspaces%2Fhfpocws1)
[DR workspace](https://ms.web.azuresynapse.net/en-us/management/git?subFolderPath=&workspace=%2Fsubscriptions%2Fe4e06275-58d1-4081-8f1b-be12462eb701%2FresourceGroups%2Fwestus2rg%2Fproviders%2FMicrosoft.Synapse%2Fworkspaces%2Fhf2a3jppedvm5d4cpocws1)

### AGENDA

#### SECTION I:
* Register repo
* Repo access for team members
* Changes, Commit, Publish
  * Branches 
  * feature
  * main
  * workspace_publish

#### SECTION II:
* CICD Build & Release
* [ADO Extension](https://marketplace.visualstudio.com/items?itemName=AzureSynapseWorkspace.synapsecicd-deploy) / [GitHub Action](https://github.com/marketplace/actions/synapse-workspace-deployment)
* Access Control for Service Principal
* IRs, DWs & Spark

#### SECTION III:
* Release Variables 
  * Parameter template
  * Key vault example
* Triggers
* Emergencies, Feature flag (Exposure Control)
* Disconnect / Overwrite live mode

#### SECTION IV:
* DW Database Project
* [Repo](https://github.com/hfleitas/synapsedelta/tree/main/wplussynapsedw)
* CICD [Build](https://dev.azure.com/hiramfleitas0814/dw/_build?definitionId=4) & [Release](https://dev.azure.com/hiramfleitas0814/dw/_release?_a=releases&view=mine&definitionId=3)
* [ADS Extension](https://docs.microsoft.com/sql/azure-data-studio/extensions/sql-database-project-extension)
 * [ADO Extension](https://github.com/microsoft/azure-pipelines-tasks/blob/master/Tasks/SqlAzureDacpacDeploymentV1/README.md)


#### RESOURCES:
* [Source Control](docs.microsoft.com/azure/synapse-analytics/cicd/source-control)
* [Synapse DevOps](docs.microsoft.com/azure/synapse-analytics/cicd/continuous-integration-delivery)
* Best practices: 
  * [Synapse](docs.microsoft.com/azure/synapse-analytics/cicd/continuous-integration-delivery#best-practices-for-cicd)
  * [ADF](docs.microsoft.com/azure/data-factory/continuous-integration-delivery#best-practices-for-cicd)
* [Bradley's post](techcommunity.microsoft.com/t5/data-architecture-blog/ci-cd-in-azure-synapse-analytics-part-4-the-release-pipeline/ba-p/2034434)
* [Database Projects](docs.microsoft.com/sql/azure-data-studio/extensions/sql-database-project-extension)

![img](https://docs.microsoft.com/en-us/azure/data-factory/media/continuous-integration-delivery/continuous-integration-image12.png)
