-- Persist individual lesson completion for the Vibe Coding learning path.
CREATE TABLE IF NOT EXISTS member_lesson_progress (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  account_id uuid NOT NULL REFERENCES member_accounts(id) ON DELETE CASCADE,
  lesson_key text NOT NULL,
  completed boolean NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (account_id, lesson_key)
);

CREATE INDEX IF NOT EXISTS member_lesson_progress_account_idx
  ON member_lesson_progress (account_id, lesson_key)
  WHERE completed = true;
