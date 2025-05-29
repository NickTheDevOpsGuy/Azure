🔗 Linking GitHub Commits to Azure Boards

This guide explains how to connect your GitHub repository to Azure Boards, enabling automatic tracking of work item progress via commit messages.

## 📦 Prerequisites
• An Azure DevOps organization
• A project in Azure DevOps (e.g., lab-6-devops-project-tracking-azure-boards-github)
• A GitHub repository
• Admin permissions on both Azure DevOps and GitHub

## ⚙️ Setup Steps

1. Install the Azure Boards GitHub App
	1.	Go to: https://azure.com/github
	2.	Click Install Azure Boards.
	3.	Select the GitHub repository you want to connect.

2. Connect GitHub Repo to Azure Boards
	1.	Navigate to your Azure DevOps project.
	2.	Go to Project Settings → Boards → GitHub connections.
	3.	Click Connect your GitHub account.
	4.	Authorize Azure Boards and select your GitHub repository.
	5.	The repo should now be listed as connected.

🧪 Verify the Link
1. Go to Boards → Work Items.
2. Create a new work item (e.g., Task #123).
3. In GitHub, make a commit with the message:

git commit -m "Fix logging bug. AB#123"

4. Push the commit:

git push origin main

5.  Go back to the Azure Boards task. Under Development, the GitHub commit should now be visible.

## 📝 Syntax Reference

• AB#{id} — Link to a work item
• Fixes AB#{id} — Will also move the work item to Done/Resolved (if configured)

💡 Tip: You must use the AB#123 syntax to reference Azure Boards work items.

## ✅ Example

If you create Task #101 in Azure Boards, your commit message might be:

git commit -m "Improve API response formatting. AB#101"

This will show up in Azure Boards under that work item.

⸻

For more information, see:

• [Azure Boards GitHub Integration Docs](https://learn.microsoft.com/en-us/azure/devops/boards/github/connect-to-github)
• [Supported Syntax for Linking](https://learn.microsoft.com/en-us/azure/devops/boards/github/link-your-github-commits-prs-issues-to-work-items#linking-using-commit-or-pr-comments)

⸻

🎯 Next Step: Try it out and see your GitHub commits show up in Azure Boards. It’s like magic, but for grown-up DevOps kids. ✨

## 🙋‍♂️ About the Author

Built with 💻 by [Nicholas Clark](https://www.linkedin.com/in/nickdoesdevops)

- Follow the journey: #NickDoesDevOPS

🧠 #NickDoesDevOps
🚀 #LearningInPublic
🔧 #WorldDominations

- GitHub: [NickTheDevOpsGuy](https://github.com/NickTheDevOpsGuy)

## 📄 License
MIT
