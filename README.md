# 🇸🇳 Intranet New Deal Technologique – MCEN Sénégal

Portail intranet officiel du **Ministère de la Communication et de l'Économie Numérique**  
Programme **New Deal Technologique – Sénégal 2050**

---

## 🏗️ Structure du projet

```
intranet-newdeal/
├── index.html              # Page d'accueil personnalisée
├── landing.html            # Page services
├── generic.html            # Page actualités
├── elements.html           # Annuaire & documents
├── assets/
│   ├── css/
│   │   ├── main.css        # CSS principal (template Forty)
│   │   └── custom.css      # Personnalisation MCEN (couleurs sénégalaises)
│   └── js/
├── images/
├── Dockerfile              # Image nginx:alpine3.23
└── .github/
    └── workflows/
        ├── ci.yml          # Pipeline CI (branche dev)
        ├── cd.yml          # Pipeline CD (branche prod)
        └── ci-evolved.yml  # Pipeline évolué (slim + CRITICAL + email)
```

---

## 🔀 Branches

| Branche | Usage |
|---------|-------|
| `dev`   | Développement et tests – déclenche le pipeline CI |
| `prod`  | Production stable – déclenche le pipeline CD |

---

## ⚙️ Pipelines CI/CD

### CI – Branche `dev` (`.github/workflows/ci.yml`)

```
Job 1: Build image Docker (nginx:alpine3.23)
  ↓
Job 2: Scan sécurité (Trivy CVE + Gitleaks secrets)
  ↓
Job 3: Push vers Docker Hub
```

### CD – Branche `prod` (`.github/workflows/cd.yml`)

```
Job 1: Scan sécurité (bloque si CRITICAL)
  ↓
Job 2: Déploiement sur runner_prod (port 80)
```

### CI Évolué (`.github/workflows/ci-evolved.yml`)

- ✅ Image de base : `nginx:alpine3.23-slim`
- 🚫 Bloque le pipeline si vulnérabilité **CRITICAL** détectée
- 📧 Notification email en cas de succès ou d'échec

---

## 🔐 Secrets GitHub requis

| Secret | Description |
|--------|-------------|
| `DOCKERHUB_USERNAME` | Nom d'utilisateur Docker Hub |
| `DOCKERHUB_TOKEN`    | Token d'accès Docker Hub |
| `MAIL_USERNAME`      | Email SMTP pour notifications |
| `MAIL_PASSWORD`      | Mot de passe SMTP |
| `NOTIFY_EMAIL`       | Destinataire des notifications |
| `GITLEAKS_LICENSE`   | Licence Gitleaks (optionnel) |

---

## 🚀 Lancement local

```bash
# Build de l'image
docker build -t intranet-newdeal .

# Démarrer le conteneur
docker run -d -p 80:80 --name intranet-newdeal intranet-newdeal

# Accéder au site
open http://localhost
```

---

## 👤 Collaborateurs

- **moisawade@gmail.com** – Collaborateur invité

---

*© 2026 République du Sénégal – Ministère de la Communication et de l'Économie Numérique*
