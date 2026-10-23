-- Optional WebAuthn passkeys for member accounts. Apply manually to Neon before enabling the feature.
CREATE TABLE IF NOT EXISTS member_passkeys (
 id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
 account_id UUID NOT NULL REFERENCES member_accounts(id) ON DELETE CASCADE,
 credential_id TEXT NOT NULL UNIQUE,
 public_key TEXT NOT NULL,
 counter BIGINT NOT NULL DEFAULT 0,
 transports TEXT[] NOT NULL DEFAULT '{}',
 device_type TEXT,
 backed_up BOOLEAN NOT NULL DEFAULT false,
 label TEXT NOT NULL DEFAULT 'Minha chave de acesso',
 created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
 last_used_at TIMESTAMPTZ
);
CREATE INDEX IF NOT EXISTS member_passkeys_account_id_idx ON member_passkeys(account_id);
CREATE TABLE IF NOT EXISTS member_passkey_challenges (
 id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
 challenge_hash TEXT NOT NULL UNIQUE,
 account_id UUID REFERENCES member_accounts(id) ON DELETE CASCADE,
 purpose TEXT NOT NULL CHECK (purpose IN ('registration','authentication')),
 expires_at TIMESTAMPTZ NOT NULL,
 consumed_at TIMESTAMPTZ,
 created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS member_passkey_challenges_expiry_idx ON member_passkey_challenges(expires_at);
