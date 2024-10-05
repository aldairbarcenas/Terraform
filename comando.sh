#!/bin/bash

# Actualizar el sistema
sudo yum update -y

# Instalar Docker
sudo yum install docker -y

# Iniciar el servicio Docker
sudo systemctl start docker

# Habilitar Docker para que inicie al arrancar el sistema
sudo systemctl enable docker

# Agregar el usuario actual (ec2-user) al grupo docker (para ejecutar Docker sin sudo, opcional)
sudo usermod -aG docker ec2-user

# Descargar la imagen de Nginx
sudo docker pull nginx

# Ejecutar Nginx en un contenedor con el puerto 80 abierto
sudo docker run -d -p 80:80 --name nginx-container nginx

# Esperar unos segundos para asegurarse de que Nginx se esté ejecutando
sleep 5

# Cambiar el contenido de la página de bienvenida de Nginx usando sed
sudo docker exec nginx-container sed -i 's|Welcome to nginx!|BIENVENIDO ALDAIR|g; s|If you see this page, the nginx web server is successfully installed and working. Further configuration is required.|Esta es la página de prueba para verificar que Nginx está funcionando correctamente.|g; s|For online documentation and support please refer to nginx.org.|Documentación en línea disponible en nginx.org.|g; s|Commercial support is available at nginx.com.|Soporte comercial en nginx.com.|g; s|Thank you for using nginx.|Gracias por usar nginx.|g' /usr/share/nginx/html/index.html
