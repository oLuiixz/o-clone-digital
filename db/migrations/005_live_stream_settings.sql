CREATE TABLE IF NOT EXISTS live_stream_settings (
  id boolean PRIMARY KEY DEFAULT true CHECK (id = true),
  video_url text NOT NULL DEFAULT '',
  updated_at timestamptz NOT NULL DEFAULT now()
);
