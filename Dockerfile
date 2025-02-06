FROM node:20-alpine as builder

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM node:20-alpine
WORKDIR /app
COPY --from=builder /app/dist /app/dist
COPY --from=builder /app/package*.json ./

# Install a lightweight production server
RUN npm install --production serve

# Use serve to host the static files
CMD ["./node_modules/.bin/serve", "-s", "dist", "-l", "80"] 