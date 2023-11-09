DROP TABLE IF EXISTS subsidiary_accounts CASCADE;
CREATE TABLE subsidiary_accounts
(
  id          SERIAL PRIMARY KEY,
  name        VARCHAR(255)              NOT NULL,
  created_at  TIMESTAMP WITH TIME ZONE  NOT NULL DEFAULT NOW(),
  created_by  VARCHAR(255)              NOT NULL,
  updated_at  TIMESTAMP WITH TIME ZONE  NOT NULL DEFAULT NOW(),
  updated_by  VARCHAR(255)              NOT NULL,
  deleted_at  TIMESTAMP WITH TIME ZONE  NOT NULL DEFAULT NOW(),
  delete_flg  BOOLEAN                   NOT NULL DEFAULT false
);

COMMENT ON TABLE  subsidiary_accounts IS '補助科目テーブル';
COMMENT ON COLUMN subsidiary_accounts.name        IS '補助科目名';
COMMENT ON COLUMN subsidiary_accounts.created_at  IS '作成日時';
COMMENT ON COLUMN subsidiary_accounts.created_by  IS '作成者';
COMMENT ON COLUMN subsidiary_accounts.updated_at  IS '更新日時';
COMMENT ON COLUMN subsidiary_accounts.updated_by  IS '更新者';
COMMENT ON COLUMN subsidiary_accounts.deleted_at  IS '削除日時';
COMMENT ON COLUMN subsidiary_accounts.delete_flg  IS '削除フラグ';

CREATE INDEX IF NOT EXISTS subsidiary_accounts_id_name_index ON subsidiary_accounts (id, name);
CREATE INDEX IF NOT EXISTS subsidiary_accounts_id_index ON subsidiary_accounts (id);
CREATE INDEX IF NOT EXISTS subsidiary_accounts_name_index ON subsidiary_accounts (name);