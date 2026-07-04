import { Elysia } from "elysia";

export const syncModule = new Elysia({ prefix: "/sync" }).post("/push", () => {
  return {
    accepted: 0,
  };
});
