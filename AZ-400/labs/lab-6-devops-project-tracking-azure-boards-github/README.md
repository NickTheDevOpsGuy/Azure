Lab 6: DevOps Project Tracking with Azure Boards and GitHub

## 🧠 Overview

This lab demonstrates how to integrate GitHub with Azure Boards to track DevOps work items, pull requests, and commits in real time. It’s part of the AZ-400 DevOps Lab Series.

---

## 📸 Screenshots

| Step | Description                                   | Image |
|------|-----------------------------------------------|-------|
| 1️⃣  | Azure DevOps Project Settings                 | ![Settings](https://github.com/NickTheDevOpsGuy/Azure/blob/develop/AZ-400/labs/lab-6-devops-project-tracking-azure-boards-github/assets/screenshots/01-project-overview.png) |
| 2️⃣  | GitHub Integration via Azure Boards Extension | ![Extension](https://github.com/NickTheDevOpsGuy/Azure/blob/develop/AZ-400/labs/lab-6-devops-project-tracking-azure-boards-github/assets/screenshots/02-github-integration-settings.png) |
| 3️⃣  | Service Connection Confirmed                  | ![Connection](https://github.com/NickTheDevOpsGuy/Azure/blob/develop/AZ-400/labs/lab-6-devops-project-tracking-azure-boards-github/assets/screenshots/03-work-item-with-commit.png) |
| 4️⃣  | Work Item Auto-Linked to GitHub Commit        | ![Commit](https://github.com/NickTheDevOpsGuy/Azure/blob/develop/AZ-400/labs/lab-6-devops-project-tracking-azure-boards-github/assets/screenshots/04-commit-message-example.png) |
| 5️⃣  | Lab Approved by Raccoon Engineer™             | ![Raccoon](https://github.com/NickTheDevOpsGuy/Azure/blob/develop/AZ-400/labs/lab-6-devops-project-tracking-azure-boards-github/assets/screenshots/05-racoon.png) |

## 🎯 Goals

- Link GitHub repository to Azure Boards
- Enable automatic linking of work items via commits and PRs
- Enforce work item mention in PR workflows
- Visualize team progress using Boards, Backlogs, and Dashboards

---

## 📦 Repo Structure

```plaintext
lab-6-devops-project-tracking-azure-boards-github/
├── README.md
├── setup/
│   ├── github-boards-link.md
│   └── permissions-config.md
├── workflows/
│   └── sample-pr-workflow.yml
├── assets/
│   ├── screenshots/
│   ├── github-boards-link.md
└── docs/
    ├── work-item-auto-linking.md
    └── queries-views.md
```

## 🔧 Prerequisites

- Azure DevOps organization with Azure Boards enabled
- GitHub repository with admin access
- Personal Access Token (PAT) for Azure DevOps (scope: Work Items, Code)

## ⚙️ Setup Instructions

1. Connect GitHub to Azure Boards

Follow setup/github-boards-link.md to:

- Authorize GitHub repo in Azure Boards
- Configure PAT for access

2. Enable Work Item Linking

In commits/PRs, use this syntax:

Fixes AB#123
Implements AB#456

Azure Boards will automatically link those items to the commit or PR.

3. Enforce Work Item Mentions

Use a sample GitHub Action in workflows/sample-pr-workflow.yml to:

- Ensure all PRs mention an Azure Boards item (e.g., AB#123)
- Fail CI if missing

4. Visualize with Boards

Create queries and dashboards:

- Query: Open bugs per area path
- Chart: Work items by state
- View: Team capacity with effort by assignee

---

## 🔍 Resources

- (Azure Boards GitHub Integration Docs)[https://learn.microsoft.com/en-us/azure/devops/boards/github/?view=azure-devops]
- (Work Item Patterns)[https://learn.microsoft.com/en-us/azure/devops/boards/work-items/about-work-items?view=azure-devops&tabs=agile-process]

⸻

## 🦝 Built by NickDoesDevOps

Created with ☕, curiosity, and a touch of chaos by [Nicholas Clark](https://www.linkedin.com/in/nickdoesdevops).  
Follow the journey → [GitHub](https://github.com/NickTheDevOpsGuy) • [LinkedIn](https://www.linkedin.com/in/nickdoesdevops)

🏷 #NickDoesDevOps • #LearningInPublic • #BuiltInPublic