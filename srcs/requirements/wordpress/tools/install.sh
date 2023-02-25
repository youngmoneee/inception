#! /bin/sh

if ! command -v wp &> /dev/null
then
  echo "WP CLI is not installed. Please install WP CLI first."
  exit 1
fi

chmod 777 -R /var/www/wordpress
wp core download --path=/var/www/wordpress --locale=ko_KR --allow-root
wp config create --dbname=$V_DB --dbuser=$V_USR --dbpass=$V_PW --dbhost=$V_HOST --dbcharset="utf8" --allow-root
# Check if WordPress is installed
if ! wp core is-installed --allow-root
then
  # Install WordPress
  wp core install --url=$DOMAIN_URL --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PW --admin_email=$WP_ADMIN_EMAIL --allow-root
else
  # Re-install WordPress
  wp site delete --yes --allow-root
  wp core install --url=$DOMAIN_URL --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PW --admin_email=$PW_ADMIN_EMAIL --allow-root
fi
wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root
wp plugin update --all --allow-root
exec php-fpm8 -F
