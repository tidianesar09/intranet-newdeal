# ============================================================
# Intranet – Ministère de la Communication du Sénégal
# Programme New Deal Technologique
# Image de base : nginx:alpine3.23
# ============================================================

FROM nginx:alpine3.23

# Métadonnées
LABEL maintainer="MCEN DevOps Team <devops@communication.gouv.sn>"
LABEL project="intranet-newdeal"
LABEL version="1.0.0"
LABEL org="Ministère de la Communication et de l'Économie Numérique – Sénégal"

# Copier les fichiers du site statique dans le répertoire Nginx
COPY index.html       /usr/share/nginx/html/
COPY landing.html     /usr/share/nginx/html/
COPY generic.html     /usr/share/nginx/html/
COPY elements.html    /usr/share/nginx/html/
COPY assets           /usr/share/nginx/html/assets
COPY images           /usr/share/nginx/html/images
COPY LICENSE.txt      /usr/share/nginx/html/
COPY README.txt       /usr/share/nginx/html/

# Exposer le port 80 (HTTP standard)
EXPOSE 80

# Démarrer Nginx en mode foreground
CMD ["nginx", "-g", "daemon off;"]
