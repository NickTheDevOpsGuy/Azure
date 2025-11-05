# ☸️ Azure Kubernetes Service (AKS) Lab (AZ-400)

This lab demonstrates how to deploy and manage **Azure Kubernetes Service (AKS)** clusters with best-practice configurations for **scalability**, **security**, and **observability** — aligned with the *Design and Implement a Release Strategy* and *Implement a Continuous Integration Strategy* domains of the AZ-400 exam.

---

## 🚀 What You'll Learn

- ⚙️ Deploy an AKS cluster using Infrastructure as Code (Bicep or Terraform)
- 🧩 Configure **RBAC**, **service principals**, and **managed identities**
- 📈 Enable **Azure Monitor**, **Container Insights**, and **Log Analytics** integration
- 📦 Implement **Horizontal Pod Autoscaling (HPA)** and **Persistent Volumes (PV)**
- 🔄 Automate provisioning and cleanup with Bash scripts

---

## 📁 Folder Structure

```plaintext
.
├── .gitignore
├── LICENSE
├── manifests
│   ├── deployment.yaml
│   └── service.yaml
├── README.md
└── scripts
    ├── cleanup.sh
    └── init.sh
```
---

⚙️ Getting Started
1.	Clone the repository:

```bash
git clone https://github.com/yourusername/aks-lab.git
cd Azure/AZ-400/labs/aks-lab
```

2. Initialize the lab:

```bash
./scripts/init.sh
```

3. Deploy the cluster:

```bash
./scripts/deploy.sh
```

---

🧪 Validate

- Check AKS cluster status:

```bash
az aks list -o table
```

- Confirm monitoring:

```bash
az monitor metrics list --resource <aks-name> --metric "CPUUsage"
```

- Access the app via its ingress endpoint.

---

📊 Monitor & Observe

- View logs and metrics in Azure Monitor → Containers
- Explore pod performance and node health in Log Analytics
- Optionally connect to Application Insights for end-to-end tracing

---

## 🧹 Cleanup

```bash
./scripts/cleanup.sh
```

---

## 📚 References

- AKS Documentation￼
- Monitor AKS with Azure Monitor￼
- Bicep for AKS￼

---

## 🦝 Built by NickDoesDevOps

Created with ☕, curiosity, and a touch of chaos by [Nicholas Clark](https://www.linkedin.com/in/nickdoesdevops).  
Follow the journey → [GitHub](https://github.com/NickTheDevOpsGuy) • [LinkedIn](https://www.linkedin.com/in/nickdoesdevops)

🏷 #NickDoesDevOps • #LearningInPublic • #BuiltInPublic