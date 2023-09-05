#choix debian (plus simple apparemment que Alpine)
FROM debian:buster
#RUN permet de lancer nginx a chaque fois, au lieu de le reinstaller a chaque fermeture et ouverture de notre container
#apt est un utilitaire de ligne de commande permettant d'installer, de mettre à jour, de supprimer et de gérer les paquets debian
#le -y permet de dire yes a toutes les questions que poserait le terminal pour l'installation de NGINX
RUN apt update -y \
    && apt-get install -y nginx openssl
#Partie TSL ci-dessous. Le protocole TSL est le remplacant de SSL. Il corrige certaines vulnerabilites. Site securise : https
#RUN OpenSSL -y
#va creer un dossier pour stocker le certificat et la cle pour une connexion securisee
RUN mkdir -p /etc/nginx/ssl
#va creer un certificat ssl pour obtenir le TSL avec toutes les infos necessaires pour le creer et l'enregistrer ou il faut
#RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
#     -out /etc/ssl/inception.crt \
#    -keyout /etc/nginx/ssl/inception.key \
#      -subj "/C=CH/ST=Vaud/L=Renens/O=42 Lausanne/OU=creyt/CN=creyt/UID=creyt"
RUN openssl req -x509 -nodes \
        -out /etc/nginx/ssl/inception.crt \
        -keyout /etc/nginx/ssl/inception.key \
        -subj "/C=CH/ST=Vaud/L=Renens/O=42 Lausanne/OU=creyt/CN=localhost/UID=creyt"

#va créer un dossier qui nous permettra de stocker les fichiers de config de NGINX
#RUN mkdir -p /var/run/nginx
#permet de faire des modifs dans le nginx.conf
COPY ./conf/ /etc/nginx/conf.d

#L'instruction EXPOSE permet d'indiquer le port sur lequel votre application écoute.
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]