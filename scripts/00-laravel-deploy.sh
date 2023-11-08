#!/usr/bin/env bash

echo "Running composer"
composer global require hirak/prestissimo:^0.3.10

# Ensure the required versions are installed globally
composer require composer-plugin-api:^1.0.0
composer require php:^8.2.7

composer install --no-dev --working-dir=/var/www/html

echo "Caching config..."
php artisan config:cache

echo "Caching routes..."
php artisan route:cache

echo "Running migrations..."
php artisan migrate --force
