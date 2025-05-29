# 🔗 Work Item Auto-Linking with GitHub Commits

Auto-linking your GitHub commits to Azure Boards work items is a powerful way to maintain traceability without any manual hassle. Here's how it works and how you can make the most of it.

---

## 🛠️ Prerequisites

- Azure Boards and GitHub integration must be configured.
- The repository must be linked to your Azure DevOps project.
- You must have access to create work items in Azure Boards.

---

## 🧩 Supported Commit Message Syntax

To link a commit to a work item, include the work item ID in your commit message using one of the following syntaxes:

```text
Fixes AB#123
Resolves AB#456
Related to AB#789
```

This automatically:

• Links the commit to the work item.
• Adds the commit to the Development section in the work item.
• Updates the State of the work item depending on the keyword (e.g. “Fixes” can close it).

---

## 🔄 Common Link Keywords

| Keyword     | Effect                             |
|-------------|-------------------------------------|
| Fixes       | Closes the work item               |
| Resolves    | Closes the work item               |
| Closes      | Closes the work item               |
| Related to  | Adds a link but no state change    |

🔍 Use AB#<id> format — not just #123.

---

## 📝 Examples

```bash
git commit -m "Fixes AB#102 - Corrected login redirect bug"
git commit -m "Related to AB#215 - Add context to error messages"
git commit -m "Resolves AB#308 - Implemented CI pipeline step for tests"
```

---

## 🧠 Pro Tips

• You must push the commit to a branch linked to a Pull Request or directly to the default branch for the linkage to register.
• You can link multiple work items like this:

```bash
git commit -m "Fixes AB#123, AB#124 - Combined hotfixes"
```

• For best results, use clear commit messages with context in addition to the ID.
