# Use PHP-Apache base image (or Node.js base image if Node backend)
FROM php:7.4-apache

# Install MySQL client
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy backend code
COPY . /var/www/html/

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]