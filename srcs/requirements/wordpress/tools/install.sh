#!/bin/bash

if ! command -v wp &> /dev/null
then
  echo "WP CLI is not installed. Please install WP CLI first."
  exit 1
fi

# Define variables for site URL, title, and admin user
site_url="http://example.com"
site_title="Example Site"
admin_user="admin"
admin_password="admin_password"
admin_email="admin@example.com"

# Check if WordPress is installed
if ! wp core is-installed
then
  # Install WordPress
  wp core install --url=$site_url --title=$site_title --admin_user=$admin_user --admin_password=$admin_password --admin_email=$admin_email
else
  # Re-install WordPress
  wp site delete --yes
  wp core install --url=$site_url --title=$site_title --admin_user=$admin_user --admin_password=$admin_password --admin_email=$admin_email
fi

