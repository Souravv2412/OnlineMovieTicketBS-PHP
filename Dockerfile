# Use PHP with Apache
FROM php:8.2-apache

# Enable PDO + MySQL extensions
RUN docker-php-ext-install pdo pdo_mysql

# Copy project files into Apache's root
COPY . /var/www/html/

# Set working directory
WORKDIR /var/www/html/

# Expose Render port
EXPOSE 10000

# Configure Apache to listen on Render's port (10000)
RUN sed -i 's/80/10000/' /etc/apache2/sites-available/000-default.conf

# Start Apache
CMD ["apache2-foreground"]
