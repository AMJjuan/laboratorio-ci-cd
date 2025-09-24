# Usar imagen oficial de Node.js
FROM node:20-alpine

# Establecer directorio de trabajo
WORKDIR /app

# Copiar archivos de dependencias
COPY package*.json ./

# Instalar dependencias de PRODUCCIÓN
RUN npm ci --only=production

# Copiar código de la aplicación
COPY app.js ./

# Exponer puerto de la aplicación
EXPOSE 3000

# Ejecutar como usuario no-root
USER node

# Comando para iniciar la aplicación
CMD ["node", "app.js"]