Got it 👍 — here’s a clean **README.md** you can use for your Netlify + Terraform Cloud setup:

---

# 🚀 Deploying a Netlify Site with Terraform + HCP Terraform

This repository uses [Terraform](https://www.terraform.io/) and [HashiCorp Cloud Platform (HCP) Terraform](https://app.terraform.io/) to provision a Netlify site.

---

## 📋 Prerequisites

* **Terraform** v1.2.2 or later
* **HCP Terraform account**

  * Organization created
  * Workspace set up (VCS-driven or CLI-driven execution mode)
* **Netlify account**

  * [Netlify Personal Access Token](https://docs.netlify.com/cli/get-started/#obtain-a-token)

---

## 🔗 Connecting to HCP Terraform

1. In HCP Terraform, create an **organization** (if you don’t already have one).
2. Create a **workspace**:

   * **Option A (VCS-driven):** Connect to GitHub/GitLab/Bitbucket repo containing this code.
   * **Option B (CLI-driven):** Create a workspace and set execution mode to **CLI-driven** so you can run Terraform locally.
3. Configure your local machine to connect:

   ```bash
   terraform login
   ```

   This will generate and save an API token for authenticating with HCP Terraform.

---

## 🔑 Setting Netlify Credentials

Terraform requires your **Netlify API token** to deploy resources.

* In HCP Terraform → Workspace → **Variables**:

  * Add `netlify_token` as a **Terraform variable**, mark it **sensitive**.

* Or, if running locally:

  ```bash
  export TF_VAR_netlify_token="nfp_xxx123yourtoken"
  ```

---

## ⚙️ Variables

| Variable        | Description                   | Required | Example         |
| --------------- | ----------------------------- | -------- | --------------- |
| `netlify_token` | Netlify API token (sensitive) | ✅        | `nfp_abc123xyz` |

---

## ▶️ Running Terraform

### 1. Initialize providers and modules:

```bash
terraform init
```

### 2. Review the execution plan:

```bash
terraform plan
```

### 3. Apply changes:

* **VCS-driven workspace:** Commit & push changes → Terraform Cloud runs plan/apply.
* **CLI-driven workspace:** Run locally:

  ```bash
  terraform apply -auto-approve
  ```

---

## 📤 Outputs

| Output     | Description                              |
| ---------- | ---------------------------------------- |
| `live_url` | The public HTTPS URL of the Netlify site |

Example:

```
Outputs:

live_url = "https://my-site-fuzzy-panda.netlify.app"
```

---

## 🛑 .gitignore

To avoid committing sensitive information or local state, add the following to your `.gitignore`:

```
# Terraform
.terraform/
*.tfstate
*.tfstate.backup
.terraform.lock.hcl
crash.log
override.tf
override.tf.json
*_override.tf
*_override.tf.json

# Local secrets
terraform.tfvars
*.auto.tfvars
.env
```

---

✅ That’s it — after applying, you’ll get your Netlify site URL in the output.

---

Do you want me to also add a **section showing how to run it entirely locally without Terraform Cloud** (just Terraform + Netlify token), or should I keep this README Cloud-only (HCP Terraform)?
