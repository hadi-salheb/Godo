CREATE TABLE "accounts" (
  "id" bigserial PRIMARY KEY,
  "owner" varchar NOT NULL,
  "created_at" timestampz NOT NULL DEFAULT (now())
);

CREATE TABLE "todos" (
  "id" bigserial PRIMARY KEY,
  "account_id" bigint,
  "title" varchar NOT NULL,
  "created_at" timestampz NOT NULL DEFAULT (now())
);

CREATE TABLE "labels" (
  "id" bigserial PRIMARY KEY,
  "account_id" bigint,
  "title" varchar NOT NULL,
  "color" varchar NOT NULL,
  "created_at" timestampz NOT NULL DEFAULT (now())
);

CREATE TABLE "todos_labels" (
  "id" bigserial PRIMARY KEY,
  "todo_id" bigint,
  "label_id" bigint
);

CREATE INDEX ON "accounts" ("owner");

CREATE INDEX ON "todos" ("account_id");

CREATE INDEX ON "labels" ("account_id");

ALTER TABLE "todos" ADD FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "labels" ADD FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "todos_labels" ADD FOREIGN KEY ("todo_id") REFERENCES "todos" ("id");

ALTER TABLE "todos_labels" ADD FOREIGN KEY ("label_id") REFERENCES "labels" ("id");
