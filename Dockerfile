# Utiliser l'image de base HTTPD
FROM httpd:alpine

# Copier le fichier HTML dans le répertoire de Apache
COPY index.html /usr/local/apache2/htdocs/

# Exposer le port 9090
EXPOSE 80
