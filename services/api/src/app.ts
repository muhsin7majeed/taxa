import { cors } from "@elysiajs/cors";
import { Elysia } from "elysia";

import { env } from "./config/env";
import { authModule } from "./modules/auth";
import { discoveriesModule } from "./modules/discoveries";
import { syncModule } from "./modules/sync";

export const app = new Elysia()
  .use(cors())
  .get("/health", () => ({
    status: "ok",
    service: "taxa-api",
  }))
  .use(authModule)
  .use(discoveriesModule)
  .use(syncModule);

if (import.meta.main) {
  app.listen(env.port);

  console.log(`Taxa API listening on http://localhost:${env.port}`);
}
