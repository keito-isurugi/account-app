DROP TABLE IF EXISTS accounts CASCADE;
CREATE TABLE accounts
(
  id                    SERIAL PRIMARY KEY,
  name                  VARCHAR(255)              NOT NULL,
  report_id             INTEGER                   NOT NULL,
  first_category_id     INTEGER                   NOT NULL,
  second_category_id    INTEGER                   NOT NULL,
  third_category_id     INTEGER                   NOT NULL,
  tax_category_id       INTEGER                   NOT NULL,
  subsidiary_account_id INTEGER                   NOT NULL,
  created_at            TIMESTAMP WITH TIME ZONE  NOT NULL DEFAULT NOW(),
  created_by            VARCHAR(255)              NOT NULL,
  updated_at            TIMESTAMP WITH TIME ZONE  NOT NULL DEFAULT NOW(),
  updated_by            VARCHAR(255)              NOT NULL,
  deleted_at            TIMESTAMP WITH TIME ZONE  NOT NULL DEFAULT NOW(),
  delete_flg            BOOLEAN                   NOT NULL DEFAULT false
);

COMMENT ON TABLE  accounts IS '勘定科目テーブル';
COMMENT ON COLUMN accounts.name                   IS '勘定科目名';
COMMENT ON COLUMN accounts.report_id              IS '科目区分ID';
COMMENT ON COLUMN accounts.first_category_id      IS '大分類ID';
COMMENT ON COLUMN accounts.second_category_id     IS '中分類ID';
COMMENT ON COLUMN accounts.third_category_id      IS '小分類ID';
COMMENT ON COLUMN accounts.tax_category_id        IS '税区分ID';
COMMENT ON COLUMN accounts.subsidiary_account_id  IS '補助科目ID';
COMMENT ON COLUMN accounts.created_at             IS '作成日時';
COMMENT ON COLUMN accounts.created_by             IS '作成者';
COMMENT ON COLUMN accounts.updated_at             IS '更新日時';
COMMENT ON COLUMN accounts.updated_by             IS '更新者';
COMMENT ON COLUMN accounts.deleted_at             IS '削除日時';
COMMENT ON COLUMN accounts.delete_flg             IS '削除フラグ';

CREATE INDEX IF NOT EXISTS accounts_id_name_index ON accounts (id, name);
CREATE INDEX IF NOT EXISTS accounts_id_index ON accounts (id);
CREATE INDEX IF NOT EXISTS accounts_name_index ON accounts (name);