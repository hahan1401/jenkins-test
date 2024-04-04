FROM node:18-alpine
FROM ubuntu:latest

WORKDIR /app

# Update package lists
RUN apt-get update

# Install rsync
RUN apt-get install -y rsync

# Install dependencies based on the preferred package manager
COPY package.json yarn.lock* package-lock.json* pnpm-lock.yaml* ./


RUN corepack enable
RUN yarn set version stable
RUN yarn config set nodeLinker node-modules

RUN \
  if [ -f yarn.lock ]; then yarn --frozen-lockfile; \
  elif [ -f package-lock.json ]; then npm ci; \
  elif [ -f pnpm-lock.yaml ]; then yarn global add pnpm && pnpm i; \
  elif [ -f yarn.lock ]; then yarn install; \
  # Allow install without lockfile, so example works even without Node.js installed locally
  else echo "Warning: Lockfile not found. It is recommended to commit lockfiles to version control." && yarn install; \
  fi

COPY app ./app
RUN yarn build


COPY public ./public
COPY .next/standalone ./
COPY .next/static ./.next/static

# Next.js collects completely anonymous telemetry data about general usage. Learn more here: https://nextjs.org/telemetry
# Uncomment the following line to disable telemetry at run time
# ENV NEXT_TELEMETRY_DISABLED 1

# Note: Don't expose ports here, Compose will handle that for us

# Start Next.js in development mode based on the preferred package manager
# CMD \
#   if [ -f yarn.lock ]; then yarn dev; \
#   elif [ -f package-lock.json ]; then npm run dev; \
#   elif [ -f pnpm-lock.yaml ]; then pnpm dev; \
#   else yarn dev; \
#   fi

CMD ["node", "server.js"]