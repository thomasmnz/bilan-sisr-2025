#!/bin/bash

################################################################################
# Script : install_docker.sh
# Objectif : Installer Docker + Docker Compose sur Debian 12 automatiquement
# Auteur : Votre Nom
# Description :
#   - Ajoute les dépôts officiels Docker
#   - Installe la dernière version stable de Docker Engine
#   - Active le plugin docker-compose
#   - Ajoute l'utilisateur courant au groupe docker
################################################################################

echo "---------------------------------------------"
echo " [1/5] Mise à jour du système"
echo "---------------------------------------------"
sudo apt update -y
sudo apt install -y ca-certificates curl gnupg lsb-release

echo "---------------------------------------------"
echo " [2/5] Ajout du dépôt officiel Docker"
echo "---------------------------------------------"
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo tee /etc/apt/keyrings/docker.gpg > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
   https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
   | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "---------------------------------------------"
echo " [3/5] Installation de Docker"
echo "---------------------------------------------"
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "---------------------------------------------"
echo " [4/5] Vérifications"
echo "---------------------------------------------"
docker --version
docker compose version

echo "---------------------------------------------"
echo " [5/5] Ajout de l'utilisateur au groupe docker"
echo "---------------------------------------------"
sudo usermod -aG docker $USER

echo "INSTALLATION TERMINÉE."
echo "⚠️ Déconnectez-vous / reconnectez-vous pour activer le groupe docker."
