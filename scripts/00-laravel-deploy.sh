#!/usr/bin/env bash

echo "Running composer"
composer require hirak/prestissimo:^0.3.10 --dev --working-dir=/var/www/html

# Ensure the required versions are installed locally
composer require composer-plugin-api:^1.0.0 --dev --working-dir=/var/www/html
composer require php:^8.2.7 --dev --working-dir=/var/www/html

composer install --no-dev --working-dir=/var/www/html

echo "Caching config..."
php artisan config:cache

echo "Caching routes..."
php artisan route:cache

echo "Running migrations..."
php artisan migrate --force
