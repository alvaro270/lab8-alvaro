# crea una imagen usando node14
FROM node:14-alpine3.12

# Crea un directorio
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
# copying packages first helps take advantage of docker layers
# copia el packages.json y el lock.json
COPY package*.json ./
# hace correr el npm install
RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
# hace un copy de la aplicacion completa
COPY . .

# Generate prisma configuration
# RUN npm run generate:prisma
# expone el puerto 8080 que estamos usando para poder hacer el ip
EXPOSE 8080
# hace q el cmd ejecute npm run start
CMD [ "npm", "run", "start" ]
