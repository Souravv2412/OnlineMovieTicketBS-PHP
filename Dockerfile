# Use PHP with Apache
FROM php:8.2-apache

# Enable PDO + MySQL extensions
RUN docker-php-ext-install pdo pdo_mysql

# Copy project files into Apache's root
COPY . /var/www/html/

# Set working directory
WORKDIR /var/www/html/

# Expose port (Render uses dynamic PORT env)
EXPOSE 10000

# Start Apache and dynamically set the port from Render
CMD sed -i "s/Listen 80/Listen ${PORT}/" /etc/apache2/ports.conf && \
    sed -i "s/<VirtualHost \*:80>/<VirtualHost *:${PORT}>/" /etc/apache2/sites-available/000-default.conf && \
    apache2-foreground
