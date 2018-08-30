Prerequisites :
1. Azure CLI must be installed
https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest
2. Create a resource group
az group create --name MuleProdAKSCluster --location australiaeast
{
  "id": "/subscriptions/1586dd2f-b369-4ed2-87a0-6f086a75c778/resourceGroups/MuleProdAKSCluster",
  "location": "australiaeast",
  "managedBy": null,
  "name": "MuleProdAKSCluster",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null
}
3. Create AKS Cluster
az aks create --resource-group MuleProdAKSCluster --name MuleProdAKSCluster --node-count 2 --enable-addons monitoring --generate-ssh-keys

{
  "aadProfile": null,
  "addonProfiles": {
    "omsagent": {
      "config": {
        "logAnalyticsWorkspaceResourceID": "/subscriptions/1586dd2f-b369-4ed2-87a0-6f086a75c778/resourcegroups/defaultresourcegroup-ase/providers/microsoft.operationalinsights/workspaces/defaultworkspace-1586dd2f-b369-4ed2-87a0-6f086a75c778-ase"
      },
      "enabled": true
    }
  },
  "agentPoolProfiles": [
    {
      "count": 2,
      "maxPods": 110,
      "name": "nodepool1",
      "osDiskSizeGb": null,
      "osType": "Linux",
      "storageProfile": "ManagedDisks",
      "vmSize": "Standard_DS1_v2",
      "vnetSubnetId": null
    }
  ],
  "dnsPrefix": "MuleProdAK-MuleProdAKSClust-1586dd",
  "enableRbac": true,
  "fqdn": "muleprodak-muleprodaksclust-1586dd-2d52c31e.hcp.australiaeast.azmk8s.io",
  "id": "/subscriptions/1586dd2f-b369-4ed2-87a0-6f086a75c778/resourcegroups/MuleProdAKSCluster/providers/Microsoft.ContainerService/managedClusters/MuleProdAKSCluster",
  "kubernetesVersion": "1.9.9",
  "linuxProfile": {
    "adminUsername": "azureuser",
    "ssh": {
      "publicKeys": [
        {
          "keyData": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC22D332dTSzd1jjSWUKeUAZY+F+yMzL+v6cMyDfRxtoMsoUN8F6zn65PsrDanDuGQOR1R0s/BqezVkkNu21vVZpRKYlCO7U41lObX2fiU/HL6hVYdJoPa0NyjR07fcislJB3nFKuYgCQcYWwdF7Zlrj3BUecT81JPutOO2EvWEGj/Iw9PG5naqAfCL2vU5fgkPa8qf9pwx7rf23K/ChawYD8RsLWib5tW7J2Avm7QQTMPnltkxwWN9VAnM3ridxqn9doUx3jzcwr5wDBg7Zpv9yttfS3xNkJfR6dGL42hvYzY8u8k03/YUuAoy6bO/45rmB1M070Z4gyJB7E8ZT+mh rayfabian@Reys-MacBook-Pro.local\n"
        }
      ]
    }
  },
  "location": "australiaeast",
  "name": "MuleProdAKSCluster",
  "networkProfile": {
    "dnsServiceIp": "10.0.0.10",
    "dockerBridgeCidr": "172.17.0.1/16",
    "networkPlugin": "kubenet",
    "networkPolicy": null,
    "podCidr": "10.244.0.0/16",
    "serviceCidr": "10.0.0.0/16"
  },
  "nodeResourceGroup": "MC_MuleProdAKSCluster_MuleProdAKSCluster_australiaeast",
  "provisioningState": "Succeeded",
  "resourceGroup": "MuleProdAKSCluster",
  "servicePrincipalProfile": {
    "clientId": "fb0bf268-82fc-48f3-8f26-fbe4504e523d",
    "secret": null
  },
  "tags": null,
  "type": "Microsoft.ContainerService/ManagedClusters"
}


4. Connect to the Cluster
az aks install-cli
az aks get-credentials --resource-group MuleProdAKSClusterr --name MuleProdAKSCluster

5. Configure kubectrl
kubectl create secret docker-registry rayfabian --docker-server rayfabian.azurecr.io --docker-email work.rayfabian@outlook.com --docker-username=rayfabian --docker-password N9Cx3KY5qFmrruO4ETnDzIgVS/NdrW9M