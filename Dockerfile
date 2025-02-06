FROM node:20-alpine as builder

WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .

# Add environment variables during build
ARG GITHUB_TOKEN
ENV GITHUB_TOKEN=${GITHUB_TOKEN}

RUN npm run build

FROM node:20-alpine
WORKDIR /app
COPY --from=builder /app/dist /app/dist
COPY --from=builder /app/package*.json ./

RUN npm install -g serve

RUN adduser -D nodeuser
USER nodeuser

CMD ["serve", "-s", "dist", "-l", "80"] 