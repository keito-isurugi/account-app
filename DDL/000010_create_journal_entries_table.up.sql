DROP TABLE IF EXISTS accounts CASCADE;
CREATE TABLE accounts
(
  id                  SERIAL PRIMARY KEY,
  journal_entered_at  TIMESTAMP WITH TIME ZONE  NOT NULL,
  debit_account_id    INTEGER                   NOT NULL,
  debit_amount        INTEGER                   NOT NULL,
  credit_account_id   INTEGER                   NOT NULL,
  credit_amount       INTEGER                   NOT NULL,
  created_at          TIMESTAMP WITH TIME ZONE  NOT NULL DEFAULT NOW(),
  created_by          VARCHAR(255)              NOT NULL,
  updated_at          TIMESTAMP WITH TIME ZONE  NOT NULL DEFAULT NOW(),
  updated_by          VARCHAR(255)              NOT NULL,
  deleted_at          TIMESTAMP WITH TIME ZONE  NOT NULL DEFAULT NOW(),
  delete_flg          BOOLEAN                   NOT NULL DEFAULT false
);

COMMENT ON TABLE  accounts IS '勘定科目テーブル';
COMMENT ON COLUMN accounts.journal_entered_at IS '勘定科目名';
COMMENT ON COLUMN accounts.debit_account_id   IS '科目区分ID';
COMMENT ON COLUMN accounts.debit_amount       IS '大分類ID';
COMMENT ON COLUMN accounts.credit_account_id  IS '中分類ID';
COMMENT ON COLUMN accounts.credit_amount      IS '小分類ID';
COMMENT ON COLUMN accounts.created_at         IS '作成日時';
COMMENT ON COLUMN accounts.created_by         IS '作成者';
COMMENT ON COLUMN accounts.updated_at         IS '更新日時';
COMMENT ON COLUMN accounts.updated_by         IS '更新者';
COMMENT ON COLUMN accounts.deleted_at         IS '削除日時';
COMMENT ON COLUMN accounts.delete_flg         IS '削除フラグ';

CREATE INDEX IF NOT EXISTS accounts_id_name_index ON accounts (id, name);
CREATE INDEX IF NOT EXISTS accounts_id_index ON accounts (id);
CREATE INDEX IF NOT EXISTS accounts_name_index ON accounts (name);