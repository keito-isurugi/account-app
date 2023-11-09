DROP TABLE IF EXISTS tax_categories CASCADE;
CREATE TABLE tax_categories
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

COMMENT ON TABLE  tax_categories IS '税区分テーブル';
COMMENT ON COLUMN tax_categories.name        IS '税区分名';
COMMENT ON COLUMN tax_categories.created_at  IS '作成日時';
COMMENT ON COLUMN tax_categories.created_by  IS '作成者';
COMMENT ON COLUMN tax_categories.updated_at  IS '更新日時';
COMMENT ON COLUMN tax_categories.updated_by  IS '更新者';
COMMENT ON COLUMN tax_categories.deleted_at  IS '削除日時';
COMMENT ON COLUMN tax_categories.delete_flg  IS '削除フラグ';

CREATE INDEX IF NOT EXISTS tax_categories_id_name_index ON tax_categories (id, name);
CREATE INDEX IF NOT EXISTS tax_categories_id_index ON tax_categories (id);
CREATE INDEX IF NOT EXISTS tax_categories_name_index ON tax_categories (name);