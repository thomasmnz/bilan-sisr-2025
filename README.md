# TP SISR : Déploiement de WordPress et Zabbix avec Docker sur Debian 12

Ce projet détaille l'installation et le déploiement d'une VM sous
**Debian 12** permettant de mettre en place deux services :\
- **WordPress**, un CMS complet, - **Zabbix**, un outil de supervision
professionnel,

Les deux services sont déployés via **Docker** et **Docker Compose**.

------------------------------------------------------------------------

## 📌 Prérequis

-   Une **VM Debian 12** (idéalement sur Proxmox)
-   Accès terminal **Bash**
-   Connexion Internet
-   **Docker** & **Docker Compose** (installés via le script)
-   **Git** installé (pour récupérer le projet)

------------------------------------------------------------------------

## 📁 Contenu du repository

Ce dépôt contient :

-   `install_docker.sh` → Script d'installation automatisée de Docker +
    Docker Compose\
-   `wordpress/docker-compose.yml` → Stack Docker pour WordPress\
-   `zabbix/docker-compose.yml` → Stack Docker pour Zabbix\
-   `README.md` → Documentation complète du projet

------------------------------------------------------------------------

## 🚀 1. Cloner le projet

Depuis votre VM Debian :

``` bash
git clone https://github.com/ton_username/ton_repository.git
cd ton_repository
```

------------------------------------------------------------------------

## 🛠️ 2. Installation de Docker avec le script

### Rendre le script exécutable :

``` bash
chmod +x install_docker.sh
```

### Exécuter le script :

``` bash
./install_docker.sh
```

### ✔ Ce que fait le script install_docker.sh

1.  Met à jour le système\

2.  Installe les dépendances (curl, gnupg, lsb-release...)\

3.  Ajoute la clé GPG officielle Docker\

4.  Ajoute le dépôt Docker dans `/etc/apt/sources.list.d/`\

5.  Installe :

    -   docker-ce\
    -   docker-compose-plugin\
    -   docker-buildx-plugin\

6.  Vérifie l'installation avec :

    ``` bash
    docker --version
    docker compose version
    ```

7.  Ajoute l'utilisateur courant dans le groupe `docker`

⚠️ **Déconnectez-vous / reconnectez-vous** pour activer le groupe
docker.

------------------------------------------------------------------------

## 🌍 3. Déployer WordPress

Se rendre dans le bon dossier :

``` bash
cd wordpress
```

Démarrer WordPress :

``` bash
docker compose up -d
```

### ✔ WordPress accessible sur :

👉 http://`<IP_VM>`{=html}:8080

------------------------------------------------------------------------

## 📊 4. Déployer Zabbix

Se rendre dans le dossier :

``` bash
cd zabbix
```

Démarrer Zabbix :

``` bash
docker compose up -d
```

### ✔ Interface Web Zabbix :

👉 http://`<IP_VM>`{=html}:8090

### Identifiants par défaut :

-   **Utilisateur :** Admin\
-   **Mot de passe :** zabbix

------------------------------------------------------------------------

## 🧪 5. Vérifier que tout fonctionne

### Vérifier les conteneurs en cours d'exécution :

``` bash
docker ps
```

### Vérifier les logs WordPress :

``` bash
docker compose logs wordpress
```

### Vérifier les logs Zabbix :

``` bash
docker compose logs zabbix-server
```

------------------------------------------------------------------------

## 🛑 6. Arrêter les services

Depuis chaque dossier :

### WordPress :

``` bash
cd wordpress
docker compose down
```

### Zabbix :

``` bash
cd zabbix
docker compose down
```

------------------------------------------------------------------------

## 🛠️ Dépannage courant

### 🔹 Port déjà utilisé

Modifiez dans `docker-compose.yml` :

``` yaml
ports:
  - "8081:80"
```

### 🔹 Base de données inaccessible

Vérifiez que les identifiants DB correspondent entre les services
WordPress/Zabbix et les services DB.

------------------------------------------------------------------------

## ✔️ 7. Critères du TP

-   Projet clonable via Git\
-   Script Bash fonctionnel et automatisé\
-   Installation Docker/Compose automatisée\
-   WordPress opérationnel\
-   Zabbix opérationnel\
-   README complet, clair et structuré

------------------------------------------------------------------------

## 🎉 Fin du projet

Votre VM est maintenant capable d'héberger WordPress et Zabbix grâce à
Docker.

