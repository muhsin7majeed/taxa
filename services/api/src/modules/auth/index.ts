import { Elysia } from "elysia";

export const authModule = new Elysia({ prefix: "/auth" }).post("/signup", () => {
  return {
    message: "Auth signup endpoint scaffolded",
  };
});
