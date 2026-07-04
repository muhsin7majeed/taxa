import { describe, expect, it } from "bun:test";

import { app } from "../src/app";

describe("health endpoint", () => {
  it("returns service status", async () => {
    const response = await app.handle(new Request("http://localhost/health"));

    expect(response.status).toBe(200);
    expect(await response.json()).toEqual({
      status: "ok",
      service: "taxa-api",
    });
  });
});
