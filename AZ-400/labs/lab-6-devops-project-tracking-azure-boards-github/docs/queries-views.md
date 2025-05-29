# 🔍 Queries & Views in Azure Boards

This guide helps you set up smart queries and board views to track GitHub-linked work items effectively.

---

## 📋 Default Queries

You can use built-in queries to track project progress, such as:

- **Assigned to Me** – Items you're responsible for
- **Recently Created** – New work items in your project
- **All Work Items** – Full list of work tracked in Azure Boards

> Access from: **Boards → Queries → New Query**

---

## 🛠️ Custom Query Setup

To track GitHub-linked commits and pull requests:

### 🧩 Example: All GitHub-Linked Items

| Field | Operator | Value |
|-------|----------|-------|
| **Tags** | Contains | `GitHub` |
| **Work Item Type** | In | `User Story, Bug, Task` |
| **State** | Not In | `Removed` |

Save this query for filtering only GitHub-related items.

---

## 🎯 Example Views

Create smart views on your Boards using custom queries:

### 🗂️ “Backlog – GitHub Commits”
- Add a query that filters work items with `AB#` commit links.
- Use Kanban style to group by **State** or **Iteration Path**.

### 🔄 “Recently Updated”
- Filter by **Changed Date** in the last 7 days.
- Great for standups or sprint reviews.

---

## ⛳ Pro Tips

- Use **query folders** to organize views by release or milestone.
- Add **charts** to your query results: pie charts, bar charts, etc.
- Share views with your team or pin them to Dashboards.

---

🚀 Bonus:
Once your commit includes `AB#123` syntax, the related Work Item auto-updates and appears in query results ✨

> Check integration: **Boards → Queries → Run Query → Open Item → Links Tab**

---

Need help building a more complex WIQL query? Ping your local raccoon spirit guide 🦝