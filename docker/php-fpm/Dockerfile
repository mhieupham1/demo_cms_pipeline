FROM php:7.4-fpm

# Copy composer.lock and composer.json
COPY composer.lock composer.json /var/www/

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    libzip-dev \
    libwebp-dev

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions
RUN docker-php-ext-install pdo_mysql zip exif pcntl
RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-webp  --with-jpeg
RUN docker-php-ext-install gd

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy existing application directory contents
COPY . /var/www

RUN composer install

COPY .env.example .env

RUN php artisan key:generate --force; \
        php artisan migrate; \
        php artisan db:seed; \
        php artisan cache:clear; \
        php artisan config:cache; \
        php artisan route:cache; \
        php artisan storage:link; \

RUN chmod 777 -R storage && \
    chmod 777 -R bootstrap

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
