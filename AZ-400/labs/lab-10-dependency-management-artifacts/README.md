# 🦝 AZ-400 Lab 10: Dependency Management with Azure Artifacts

---

## 📝 Description
This lab focuses on mastering dependency management in Azure DevOps by building real pipelines that publish and consume packages using Azure Artifacts feeds. It simulates real-world artifact lifecycles directly aligned with AZ-400 exam objectives and production CI/CD pipeline design.

---

## 🌍 Lab Goal
- Publish packages to Azure Artifacts Feeds
- Consume packages across pipelines
- Manage feed permissions and version pinning
- Fully simulate real-world artifact lifecycle management
- Directly align with AZ-400 exam objectives

---


## 🔧 Prerequisites

- Azure DevOps Organization
- Azure DevOps Project created
- Azure Artifacts enabled
- Azure Artifacts Feed created: `az400-lab10-feed`
- Pipeline permissions granted to access feed


## 📁 Project Structure
```plaintext
AZ-400/labs/lab-10-dependency-management-artifacts/
├── yaml/
│   ├── pipeline-lab-10-universal-consume.yml
│   ├── pipeline-lab-10-universal-publish.yml
├── assets/
│   ├── diagram.png
└── README.md
```

---

## 🛠 Technologies Used

| Tool | Purpose |
| ---- | ------- |
| **Azure DevOps Pipelines** | CI/CD orchestration |
| **Azure Artifacts** | Package feed & dependency management |
| **NPM** | Simulated package publishing |
| **Azure CLI (az)** | Feed permissions & management |
| **Ubuntu Agent (Microsoft Hosted)** | Build agent pool |

---


## 📝 Deployment Diagram

```plaintext
[Build Pipeline]
    |
    |-- Build Package
    |
    |-- Publish to Azure Artifacts Feed (az400-lab10-feed)

[Consume Pipeline]
    |
    |-- Authenticate Feed
    |
    |-- Install Package
    |
    |-- Simulate Consumption
```

## 📊 AZ-400 Skills Covered ##

- Dependency management with Azure Artifacts
- Package publishing and versioning
- Feed permissions and authentication
- Multi-pipeline artifact workflows
- Real-world package lifecycle simulation

---

## 🔎 References

- [Azure Artifacts Overview](https://learn.microsoft.com/en-us/azure/devops/artifacts/overview)
- [Azure Artifacts Feeds](https://learn.microsoft.com/en-us/azure/devops/artifacts/feeds?view=azure-devops)
- [Azure DevOps NPM Task](https://learn.microsoft.com/en-us/azure/devops/pipelines/tasks/package/npm?view=azure-devops)
- [Set up Azure Artifacts Credential Provider](https://learn.microsoft.com/en-us/azure/devops/artifacts/npm/npmrc?view=azure-devops)

---

## 🙋‍♂️ About the Author

Built with 💻 by [Nicholas Clark](https://www.linkedin.com/in/nickdoesdevops)

- Follow the journey: #NickDoesDevOPS

🧠 #NickDoesDevOps
🚀 #LearningInPublic
🔧 #WorldDominations

- GitHub: [NickTheDevOpsGuy](https://github.com/NickTheDevOpsGuy)

## 📄 License
MIT