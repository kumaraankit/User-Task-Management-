### Multi-stage Dockerfile for NestJS application (production)
FROM node:18-alpine AS builder
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm ci --production=false

# Copy source and build
COPY tsconfig*.json ./
COPY src ./src
COPY nest-cli.json ./
RUN npm run build

### Production image
FROM node:18-alpine
WORKDIR /app

# Set environment
ENV NODE_ENV=production

# Copy only production deps and built app
COPY package*.json ./
RUN npm ci --production
COPY --from=builder /app/dist ./dist

# Add entrypoint script (for migrations / startup tasks)
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 3000
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["node", "dist/main.js"]
