FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

FROM nginx
EXPOSE 80
# expose for AWS EBS
COPY --from=builder /app/build /usr/share/nginx/html
