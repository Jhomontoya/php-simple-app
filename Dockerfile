# Usa una imagen oficial de PHP con Apache
FROM php:8.2-apache

# Instalar Git y habilitar mod_rewrite
RUN apt-get update && \
    apt-get install -y git && \
    a2enmod rewrite && \
    rm -rf /var/lib/apt/lists/*

# Copiar los archivos del proyecto a /var/www/html
COPY . /var/www/html

# Cambiar permisos
RUN chown -R www-data:www-data /var/www/html

# Exponer el puerto 80
EXPOSE 80

# Iniciar Apache
CMD ["apache2-foreground"]
