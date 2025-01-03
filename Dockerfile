# Stage 1: Composer to install PHP dependencies
FROM composer:latest AS composer

WORKDIR /app

# Copy composer files and install dependencies
COPY composer.json composer.lock ./

RUN composer install \
    --optimize-autoloader \
    --no-interaction \
    --no-scripts \
    --no-progress \
    --ignore-platform-req=ext-imagick \
    --ignore-platform-req=ext-gd \
    --ignore-platform-req=ext-soap

# Stage 2: Node.js for frontend dependencies
FROM node:lts-alpine AS node-build

WORKDIR /app

# Copy package files and install node dependencies
COPY package*.json yarn.lock ./

RUN apk add --no-cache git

RUN yarn install --force

# Copy project files and build assets
COPY . .

RUN yarn build

# Stage 3: Final PHP image with nginx and other dependencies
FROM php:8.2-fpm-alpine

WORKDIR /var/www/html

# Install only necessary PHP dependencies and libraries
RUN apk update \
    && apk add --no-cache \
    curl \
    nginx \
    zip \
    libzip-dev \
    libxml2-dev \
    icu-dev \
    freetype-dev \
    libpng-dev \
    jpeg-dev \
    libjpeg-turbo-dev \
    oniguruma-dev \
    php-soap

# Install Composer
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

# Install PHP extensions
RUN pecl install imagick && docker-php-ext-enable imagick

RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg
RUN docker-php-ext-install mysqli pdo pdo_mysql mbstring zip intl xml gd bcmath soap

# Copy necessary configuration files
COPY docker/nginx.conf /etc/nginx/nginx.conf
COPY docker/conf.d /etc/nginx/conf.d
COPY docker/php.ini /usr/local/etc/php/conf.d/app-php.ini
COPY docker/www.conf /usr/local/etc/php-fpm.d/www.conf
COPY docker/health.php /var/www/html/public/health.php

# Copy application files
COPY . .
COPY --from=composer /app/vendor /var/www/html/vendor/
COPY --from=node-build /app/public/build /var/www/html/public/build

# Expose port for web server
EXPOSE 8080

# Set file permissions and create necessary directories
RUN set -xe \
    && chmod +x /var/www/html/bin/console \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 777 /var/www/html/var

# Start PHP-FPM and Nginx directly
CMD ["sh", "-c", "php-fpm & nginx -g 'daemon off;'"]
