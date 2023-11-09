DROP TABLE IF EXISTS reports CASCADE;
CREATE TABLE reports
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

COMMENT ON TABLE  reports IS '科目区分テーブル';
COMMENT ON COLUMN reports.name        IS '科目区分名';
COMMENT ON COLUMN reports.created_at  IS '作成日時';
COMMENT ON COLUMN reports.created_by  IS '作成者';
COMMENT ON COLUMN reports.updated_at  IS '更新日時';
COMMENT ON COLUMN reports.updated_by  IS '更新者';
COMMENT ON COLUMN reports.deleted_at  IS '削除日時';
COMMENT ON COLUMN reports.delete_flg  IS '削除フラグ';

CREATE INDEX IF NOT EXISTS reports_id_name_index ON reports (id, name);
CREATE INDEX IF NOT EXISTS reports_id_index ON reports (id);
CREATE INDEX IF NOT EXISTS reports_name_index ON reports (name);