FROM node:20-alpine AS base
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"

RUN apk add bash

RUN corepack enable
ENV COREPACK_ENABLE_DOWNLOAD_PROMPT=0

WORKDIR /app
COPY . .

FROM base AS build
RUN npx -p dhall-to-json-cli dhall-to-json --file data/main.dhall --output data/data.json
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --shamefully-hoist --frozen-lockfile --prod
ENV ASTRO_TELEMETRY_DISABLED=1
RUN pnpm run build

FROM node:20 AS runtime

COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/dist ./dist

ENV HOST=0.0.0.0
ENV PORT=4321

EXPOSE 4321
CMD node ./dist/server/entry.mjs