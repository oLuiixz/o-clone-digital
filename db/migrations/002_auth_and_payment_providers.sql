-- O Clone Digital — authentication and multi-provider payment mappings.
-- Apply only after reviewing/backing up the target database. This file is not applied automatically.

CREATE TABLE IF NOT EXISTS product_provider_mappings (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id uuid NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  provider text NOT NULL CHECK (provider IN ('cakto', 'syncpay')),
  provider_product_id text NOT NULL,
  is_active boolean NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (provider, provider_product_id)
);

CREATE INDEX IF NOT EXISTS product_provider_mappings_product_idx
  ON product_provider_mappings (product_id, is_active);

-- User identity is the normalized email used in the confirmed purchase.
CREATE TABLE IF NOT EXISTS member_accounts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  email text NOT NULL UNIQUE,
  password_hash text,
  email_verified_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS member_activation_tokens (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  email text NOT NULL,
  token_hash text NOT NULL UNIQUE,
  expires_at timestamptz NOT NULL,
  used_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS member_activation_tokens_email_idx
  ON member_activation_tokens (lower(email), expires_at DESC);

CREATE TABLE IF NOT EXISTS member_sessions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  account_id uuid NOT NULL REFERENCES member_accounts(id) ON DELETE CASCADE,
  token_hash text NOT NULL UNIQUE,
  expires_at timestamptz NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  last_seen_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS member_sessions_account_idx
  ON member_sessions (account_id, expires_at DESC);

-- Password reset tokens are separate from activation tokens and single-use.
CREATE TABLE IF NOT EXISTS member_password_reset_tokens (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  account_id uuid NOT NULL REFERENCES member_accounts(id) ON DELETE CASCADE,
  token_hash text NOT NULL UNIQUE,
  expires_at timestamptz NOT NULL,
  used_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS member_password_reset_tokens_account_idx
  ON member_password_reset_tokens (account_id, expires_at DESC);
