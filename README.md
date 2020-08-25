# Deploy a Modern Application on Azure Kubernetes Service in just a few steps

This repo is based on http://aksworkshop.io/ from Microsoft learn AKS workshop. You should follow the step by step tutorial if you are learning first time. This repo is a consolidated script of the same workshop to help create the deployment without having to explore. Save time and experiment with a deployment under 30 mins on your own or demo to someone you want.

## Prereqs-

1. You have an Azure subscription
2. A github account
3. Visual studio code
4. git & Helm installed on your system

## How to run and deploy -

1. Clone this repo locally to your system and open the folder in Visual Studio Code
	git clone https://github.com/Bapic/wrkshp-aks.git
	cd wrkshp-aks

2. The scripts are numbered. The first script to be run from a cloud shell in your Azure subscription. If you want to run from VS Code, change the variable declation types. Copy the script text and run in your Cloud Shell. Change the variable values in the script as you like. It deploys all the infra including virtual network, acr, aks, log analytics and clones the required repo etc.

3. The second script can be run from Visual Studio code. Ensure that the variables/names are correct. Update the names based on the step no. 2. deployment. Such as workspace name, aks cluster name, mongodb username and password.

4. Update the ratings-api-deployment.yaml file with the name of your ACR and run script 03_.

5. Deploy script 04_ as is.

6. Update the ratings-web-deployment.yaml file with the name of your ACR and run script 05_.

7. Deploy script 06_ as is.

8. Run the commands in script 07 in sequence except the last one. Update the public IP of your aks cluster ingress controller in the ratings-web-ingresswithSSL.yaml file. Next run the last command in this script.

9. Update cluster-issuer.yaml with your valid email address and deploy script 08_.

10. Update the variables in script 09_ and run to enable RBAC.

11. Run the commands one by one in the script 10_ for enabling scaling (HPA). Follow the steps in https://docs.microsoft.com/en-us/learn/modules/aks-workshop/10-scale-application for hpa test. The commands are in the script as well for easy reference.

