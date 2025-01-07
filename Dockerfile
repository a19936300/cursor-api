FROM node:lts-alpine

EXPOSE 3000
ENV TZ=Asia/Shanghai

WORKDIR /app
COPY . .

RUN yarn config set registry https://registry.npmmirror.com/
RUN sed -i 's/\/v1\/chat\/completions/\/proxy\/v1\/chat\/completions/g' src/index.js
RUN yarn

CMD ["npm", "run", "start"]
