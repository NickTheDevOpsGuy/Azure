## Azure DevOps Pipelines Variable Scope

Lab 7: Azure DevOps Pipelines Variable Scope

---

## 📝 Description

Lab 7: Azure DevOps Pipelines Variable Scope

---

## 🌌 Lab Goal

Master variable scoping inside Azure DevOps Pipelines.

By the end of this lab you will:

- Understand pipeline-scoped, stage-scoped, and job-scoped variables
- Use variable groups
- Implement runtime expressions
- Handle secret variables securely

---

## 📁 Project Structure

```plaintext
AZ-400/labs/lab-7-pipelines-variable-scope/
├── README.md
├── yaml/
│   ├── pipeline-lab-1-global-deploy.yml
│   ├── pipeline-lab-2-stage-scope-deploy.yml
│   ├── pipeline-lab-3-job-scope-deploy.yml
│   ├── pipeline-lab-4-variable-group-deploy.yml
│   ├── pipeline-lab-5-runtime-expressions-deploy.yml
│   └── pipeline-lab-6-secret-vars-deploy.yml
└── assets/
    └── variable-scope-diagram.png (coming next)
```

## 🔧 Pre-Reqs

Existing Azure DevOps project

- Azure DevOps Pipeline agent (Microsoft-hosted is fine)
- Variable Group created (demo-variable-group) with sample variables:
    - environment = dev
    - region = eastus
    - db_password (secret)

---

## 🦝 Built by NickDoesDevOps

Created with ☕, curiosity, and a touch of chaos by [Nicholas Clark](https://www.linkedin.com/in/nickdoesdevops).  
Follow the journey → [GitHub](https://github.com/NickTheDevOpsGuy) • [LinkedIn](https://www.linkedin.com/in/nickdoesdevops)

🏷 #NickDoesDevOps • #LearningInPublic • #BuiltInPublic
