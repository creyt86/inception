#Create user
#l.9 cree la table de data
#l.10 cree un user 
#l.11 a qui on donne tous les droits = administrateur
#l.12 on change le mot de passe et les droits root pour limiter l'acces a l'admin
#l.13 rafraichir tout cela pour que MySQL le prenne en compte

touch /tmp/init_db.sql

cat << EOF > /tmp/init_db.sql
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT_PASSWORD');
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
FLUSH PRIVILEGES;
EOF

# ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';

# mysql -h localhost < /tmp/init_db.sql # on demarre mysql dans le Dockerfile end demarrant le script