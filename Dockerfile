FROM node:20-alpine as builder

WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:20-alpine
WORKDIR /app
COPY --from=builder /app/dist /app/dist
COPY --from=builder /app/package*.json ./

# Install serve globally for a cleaner setup
RUN npm install -g serve

# Create a non-root user
RUN adduser -D nodeuser
USER nodeuser

# Use serve to host the static files
CMD ["serve", "-s", "dist", "-l", "80"] 