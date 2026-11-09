-- Individual administrative identities, database-backed sessions and TOTP security.
-- Tables already exist in the production database; this migration makes the schema reproducible.
CREATE TABLE IF NOT EXISTS admin_users (
 id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
 email TEXT NOT NULL UNIQUE CHECK (email = lower(btrim(email))),
 password_hash TEXT,
 role TEXT NOT NULL DEFAULT 'admin' CHECK (role IN ('owner','admin')),
 permissions JSONB NOT NULL DEFAULT '{}'::jsonb,
 status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending','active','disabled')),
 totp_secret_encrypted TEXT,
 totp_enabled_at TIMESTAMPTZ,
 invite_token_hash TEXT,
 invite_expires_at TIMESTAMPTZ,
 invited_at TIMESTAMPTZ,
 last_login_at TIMESTAMPTZ,
 created_by UUID REFERENCES admin_users(id) ON DELETE SET NULL,
 created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
 updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE TABLE IF NOT EXISTS admin_sessions (
 id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
 admin_id UUID NOT NULL REFERENCES admin_users(id) ON DELETE CASCADE,
 token_hash TEXT NOT NULL UNIQUE,
 expires_at TIMESTAMPTZ NOT NULL,
 created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
 last_seen_at TIMESTAMPTZ NOT NULL DEFAULT now(),
 revoked_at TIMESTAMPTZ,
 user_agent TEXT,
 ip_hash TEXT,
 device_label TEXT
);
CREATE TABLE IF NOT EXISTS admin_recovery_codes (
 id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
 admin_id UUID NOT NULL REFERENCES admin_users(id) ON DELETE CASCADE,
 code_hash TEXT NOT NULL,
 created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
 used_at TIMESTAMPTZ,
 UNIQUE(admin_id,code_hash)
);
CREATE TABLE IF NOT EXISTS admin_audit_logs (
 id BIGSERIAL PRIMARY KEY,
 actor_admin_id UUID REFERENCES admin_users(id) ON DELETE SET NULL,
 actor_email TEXT,
 action TEXT NOT NULL,
 target_type TEXT,
 target_id TEXT,
 metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
 ip_hash TEXT,
 created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE TABLE IF NOT EXISTS auth_rate_limits (
 scope TEXT NOT NULL,
 subject_hash TEXT NOT NULL,
 window_started_at TIMESTAMPTZ NOT NULL,
 attempts INTEGER NOT NULL DEFAULT 0 CHECK (attempts >= 0),
 blocked_until TIMESTAMPTZ,
 updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
 PRIMARY KEY(scope,subject_hash)
);
CREATE TABLE IF NOT EXISTS auth_security_events (
 id BIGSERIAL PRIMARY KEY,
 admin_id UUID REFERENCES admin_users(id) ON DELETE SET NULL,
 email TEXT,
 event_type TEXT NOT NULL,
 success BOOLEAN NOT NULL DEFAULT false,
 ip_hash TEXT,
 user_agent TEXT,
 metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
 created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE UNIQUE INDEX IF NOT EXISTS admin_users_email_unique_idx ON admin_users(email);
CREATE INDEX IF NOT EXISTS admin_sessions_admin_active_idx ON admin_sessions(admin_id,expires_at) WHERE revoked_at IS NULL;
CREATE INDEX IF NOT EXISTS admin_audit_logs_created_at_idx ON admin_audit_logs(created_at DESC);
CREATE INDEX IF NOT EXISTS auth_security_events_created_at_idx ON auth_security_events(created_at DESC);
CREATE INDEX IF NOT EXISTS admin_users_status_role_idx ON admin_users(status,role);
