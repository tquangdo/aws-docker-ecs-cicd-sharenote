# build environment
FROM node:9.6.1 as builder
ENV APP_HOME /usr/src/app
ENV PATH /usr/src/app/node_modules/.bin:$PATH

RUN mkdir -p $APP_HOME

WORKDIR $APP_HOME
COPY package.json /usr/src/app/package.json
RUN npm install --silent
RUN npm install react-scripts@1.1.1 -g --silent
COPY . $APP_HOME
RUN npm run build


# production environment
FROM nginx:1.13.9-alpine
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
