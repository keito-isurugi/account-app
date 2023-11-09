DROP TABLE IF EXISTS first_categories CASCADE;
CREATE TABLE first_categories
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

COMMENT ON TABLE  first_categories IS '大分類テーブル';
COMMENT ON COLUMN first_categories.name        IS '大分類名';
COMMENT ON COLUMN first_categories.created_at  IS '作成日時';
COMMENT ON COLUMN first_categories.created_by  IS '作成者';
COMMENT ON COLUMN first_categories.updated_at  IS '更新日時';
COMMENT ON COLUMN first_categories.updated_by  IS '更新者';
COMMENT ON COLUMN first_categories.deleted_at  IS '削除日時';
COMMENT ON COLUMN first_categories.delete_flg  IS '削除フラグ';

CREATE INDEX IF NOT EXISTS first_categories_id_name_index ON first_categories (id, name);
CREATE INDEX IF NOT EXISTS first_categories_id_index ON first_categories (id);
CREATE INDEX IF NOT EXISTS first_categories_name_index ON first_categories (name);