CREATE TABLE "account" (
  "id_account" bigserial PRIMARY KEY,
  "owner" int NOT NULL,
  "balance" varchar NOT NULL,
  "currencry" varchar NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "entries" (
  "id_entries" bigserial PRIMARY KEY,
  "account_id" bigint,
  "amount" bigint NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "transfer" (
  "id_transfer" bigserial PRIMARY KEY,
  "from_account_id" bigint,
  "to_account_id" bigint,
  "amount" bigint NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE INDEX ON "account" ("owner");

CREATE INDEX ON "entries" ("account_id");

CREATE INDEX ON "transfer" ("from_account_id");

CREATE INDEX ON "transfer" ("to_account_id");

CREATE INDEX ON "transfer" ("from_account_id", "to_account_id");

ALTER TABLE "entries" ADD FOREIGN KEY ("account_id") REFERENCES "account" ("id_account");

ALTER TABLE "transfer" ADD FOREIGN KEY ("from_account_id") REFERENCES "account" ("id_account");

ALTER TABLE "transfer" ADD FOREIGN KEY ("to_account_id") REFERENCES "account" ("id_account");
