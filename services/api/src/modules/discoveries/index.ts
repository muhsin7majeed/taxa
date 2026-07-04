import { Elysia } from "elysia";

export const discoveriesModule = new Elysia({ prefix: "/discoveries" }).get("/", () => {
  return {
    items: [],
  };
});
