# Usar la versión de nginx:stable-alpine
FROM nginx:stable-alpine

# Crear un volumen con el nombre /temp
VOLUME /tmp

# Eliminar de la imagen el contenido de la carpeta /usr/share/nginx/html/*
RUN rm -rf /usr/share/nginx/html/*

# Copiar el contenido de la configuración de nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf

# Copiar mime.types
COPY mime.types /etc/nginx/mime.types

# Copiar el directorio sistema-ventas-front (archivos estáticos) a su respectiva carpeta
COPY *.js *.css *.html *.ico *.txt /usr/share/nginx/html/
COPY assets/ /usr/share/nginx/html/assets/

# Exponer el puerto 80
EXPOSE 80

# Ejecutar el comando: CMD["nginx", "-g", "daemon off;"]
CMD ["nginx", "-g", "daemon off;"]