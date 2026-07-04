export type AppEnv = {
  readonly nodeEnv: string;
  readonly port: number;
  readonly databaseUrl: string;
};

export const env: AppEnv = {
  nodeEnv: Bun.env.NODE_ENV ?? "development",
  port: Number(Bun.env.PORT ?? "3000"),
  databaseUrl: Bun.env.DATABASE_URL ?? "postgres://taxa:taxa_dev_password@localhost:5432/taxa",
};
