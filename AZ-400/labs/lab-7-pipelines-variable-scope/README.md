# Project Title
Lab 7: Azure DevOps Pipelines Variable Scope

## 📝 Description
Lab 7: Azure DevOps Pipelines Variable Scope

## 🌌 Lab Goal

Master variable scoping inside Azure DevOps Pipelines.

By the end of this lab you will:

* Understand pipeline-scoped, stage-scoped, and job-scoped variables
* Use variable groups
* Implement runtime expressions
* Handle secret variables securely

## 📁 Project Structure
```plaintext
.
├── infra/
│   ├── main.bicep
│   └── modules/
├── app/
├── queries/
└── README.md
```

## 🔧 Pre-Reqs
Existing Azure DevOps project

* Azure DevOps Pipeline agent (Microsoft-hosted is fine)
* Variable Group created (demo-variable-group) with sample variables:
    * environment = dev
    * region = eastus
    * db_password (secret)

## 🙋‍♂️ About the Author

Built with 💻 by [Nicholas Clark](https://www.linkedin.com/in/nickdoesdevops)

- Follow the journey: #NickDoesDevOPS

🧠 #NickDoesDevOps
🚀 #LearningInPublic
🔧 #WorldDominations

- GitHub: [NickTheDevOpsGuy](https://github.com/NickTheDevOpsGuy)

## 📄 License
MIT