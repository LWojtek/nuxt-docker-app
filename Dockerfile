# Dockerfile
FROM node:21-alpine

# Czy ponizsze sciezki sa wporzadku? Gdzies widzialem ze daja po prostu /app/ ale wtedy mi nie dziala
# Te nuxt app bym zmienil na strefa-klienta lub cos? Niewiem czy to ma znaczenie?
RUN mkdir -p /usr/src/nuxt-app 
WORKDIR /usr/src/nuxt-app 

# Niewiem czy ten krok konieczny?
RUN apk update && apk upgrade
RUN apk add git

COPY . /usr/src/nuxt-app/
RUN npm install
RUN npm run build

EXPOSE 3000

CMD [ "npm", "run", "dev" ]