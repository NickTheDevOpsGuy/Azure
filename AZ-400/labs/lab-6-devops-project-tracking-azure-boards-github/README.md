Lab 6: DevOps Project Tracking with Azure Boards and GitHub

## 🧠 Overview

This lab demonstrates how to integrate GitHub with Azure Boards to track DevOps work items, pull requests, and commits in real time. It’s part of the AZ-400 DevOps Lab Series.

## 🎯 Goals

• Link GitHub repository to Azure Boards
• Enable automatic linking of work items via commits and PRs
• Enforce work item mention in PR workflows
• Visualize team progress using Boards, Backlogs, and Dashboards

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
│   └── diagram.png
└── docs/
    ├── work-item-auto-linking.md
    └── queries-views.md
```

## 🔧 Prerequisites

• Azure DevOps organization with Azure Boards enabled
• GitHub repository with admin access
• Personal Access Token (PAT) for Azure DevOps (scope: Work Items, Code)

## ⚙️ Setup Instructions

1. Connect GitHub to Azure Boards

Follow setup/github-boards-link.md to:

• Authorize GitHub repo in Azure Boards
• Configure PAT for access

2. Enable Work Item Linking

In commits/PRs, use this syntax:

Fixes AB#123
Implements AB#456

Azure Boards will automatically link those items to the commit or PR.

3. Enforce Work Item Mentions

Use a sample GitHub Action in workflows/sample-pr-workflow.yml to:
• Ensure all PRs mention an Azure Boards item (e.g., AB#123)
• Fail CI if missing

4. Visualize with Boards

Create queries and dashboards:
• Query: Open bugs per area path
• Chart: Work items by state
• View: Team capacity with effort by assignee

## 📸 Screenshots

| Step | Description | Image |
|------|-------------|-------|
| 1️⃣   | Azure DevOps Project Settings | ![Settings](screenshots/01-settings-devops-project.png) |
| 2️⃣   | GitHub Integration via Azure Boards Extension | ![Extension](screenshots/02-azure-boards-extension.png) |
| 3️⃣   | Service Connection Confirmed | ![Connection](screenshots/03-service-connection-confirm.png) |
| 4️⃣   | Work Item Auto-Linked to GitHub Commit | ![Commit](screenshots/04-work-item-linked-in-commit.png) |
| 5️⃣   | Lab Approved by Raccoon Engineer™ | ![Raccoon](screenshots/05-raccoon-approved.png) |

---

## 🔍 Resources

• Azure Boards GitHub Integration Docs
• Work Item Patterns

⸻

Created by Nick Clark as part of the World Domination AZ-400 Lab Series 🛠

## 🙋‍♂️ About the Author

Built with 💻 by [Nicholas Clark](https://www.linkedin.com/in/nickdoesdevops)

- Follow the journey: #NickDoesDevOPS

🧠 #NickDoesDevOps
🚀 #LearningInPublic
🔧 #WorldDominations

- GitHub: [NickTheDevOpsGuy](https://github.com/NickTheDevOpsGuy)

## 📄 License
MIT
