-- Clone Awards: competition foundation.
-- Apply manually after backup and review; never run automatically.
-- 15 levels x 10 challenges; level XP 30..170 means exactly 15,000 XP per completed track.

CREATE TABLE IF NOT EXISTS clone_awards_seasons (
 id uuid PRIMARY KEY DEFAULT gen_random_uuid(), name text NOT NULL,
 starts_at timestamptz NOT NULL, ends_at timestamptz NOT NULL,
 submission_deadline timestamptz NOT NULL, review_deadline timestamptz NOT NULL,
 status text NOT NULL DEFAULT 'draft' CHECK (status IN ('draft','scheduled','active','reviewing','closed','archived')),
 rules_version text NOT NULL DEFAULT '1', created_by text,
 created_at timestamptz NOT NULL DEFAULT now(), updated_at timestamptz NOT NULL DEFAULT now(),
 CHECK (starts_at < ends_at), CHECK (starts_at <= submission_deadline AND submission_deadline <= review_deadline)
);
CREATE INDEX IF NOT EXISTS clone_awards_seasons_status_dates_idx ON clone_awards_seasons(status, starts_at, ends_at);

CREATE TABLE IF NOT EXISTS clone_awards_tracks (
 id uuid PRIMARY KEY DEFAULT gen_random_uuid(), slug text NOT NULL UNIQUE, name text NOT NULL,
 description text NOT NULL DEFAULT '', icon_key text NOT NULL DEFAULT 'trophy', is_active boolean NOT NULL DEFAULT true,
 sort_order integer NOT NULL DEFAULT 0, created_at timestamptz NOT NULL DEFAULT now(), updated_at timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE IF NOT EXISTS clone_awards_levels (
 id uuid PRIMARY KEY DEFAULT gen_random_uuid(), track_id uuid NOT NULL REFERENCES clone_awards_tracks(id) ON DELETE CASCADE,
 level_number integer NOT NULL CHECK (level_number BETWEEN 1 AND 15), title text NOT NULL, description text NOT NULL DEFAULT '',
 created_at timestamptz NOT NULL DEFAULT now(), UNIQUE(track_id, level_number)
);
CREATE TABLE IF NOT EXISTS clone_awards_challenges (
 id uuid PRIMARY KEY DEFAULT gen_random_uuid(), track_id uuid NOT NULL REFERENCES clone_awards_tracks(id) ON DELETE CASCADE,
 level_id uuid NOT NULL REFERENCES clone_awards_levels(id) ON DELETE CASCADE, challenge_key text NOT NULL,
 title text NOT NULL, instructions text NOT NULL, evidence_requirements text NOT NULL,
 xp integer NOT NULL CHECK (xp > 0), sort_order integer NOT NULL DEFAULT 0, is_active boolean NOT NULL DEFAULT true,
 created_at timestamptz NOT NULL DEFAULT now(), updated_at timestamptz NOT NULL DEFAULT now(), UNIQUE(track_id, challenge_key)
);
CREATE INDEX IF NOT EXISTS clone_awards_challenges_level_order_idx ON clone_awards_challenges(level_id, sort_order);

CREATE TABLE IF NOT EXISTS clone_awards_enrollments (
 id uuid PRIMARY KEY DEFAULT gen_random_uuid(), season_id uuid NOT NULL REFERENCES clone_awards_seasons(id),
 account_id uuid NOT NULL REFERENCES member_accounts(id) ON DELETE CASCADE, track_id uuid NOT NULL REFERENCES clone_awards_tracks(id),
 selected_at timestamptz NOT NULL DEFAULT now(), updated_at timestamptz NOT NULL DEFAULT now(), UNIQUE(season_id, account_id)
);
CREATE INDEX IF NOT EXISTS clone_awards_enrollments_track_idx ON clone_awards_enrollments(season_id, track_id);

CREATE TABLE IF NOT EXISTS clone_awards_submissions (
 id uuid PRIMARY KEY DEFAULT gen_random_uuid(), season_id uuid NOT NULL REFERENCES clone_awards_seasons(id),
 account_id uuid NOT NULL REFERENCES member_accounts(id) ON DELETE CASCADE, track_id uuid NOT NULL REFERENCES clone_awards_tracks(id),
 challenge_id uuid NOT NULL REFERENCES clone_awards_challenges(id), evidence_url text, evidence_note text NOT NULL DEFAULT '',
 status text NOT NULL DEFAULT 'pending' CHECK (status IN ('pending','approved','rejected','resubmit')),
 review_note text, reviewed_by text, reviewed_at timestamptz, submitted_at timestamptz NOT NULL DEFAULT now(),
 updated_at timestamptz NOT NULL DEFAULT now(), UNIQUE(season_id, account_id, challenge_id)
);
CREATE INDEX IF NOT EXISTS clone_awards_submissions_review_idx ON clone_awards_submissions(season_id, status, submitted_at);

CREATE TABLE IF NOT EXISTS clone_awards_xp_ledger (
 id uuid PRIMARY KEY DEFAULT gen_random_uuid(), season_id uuid NOT NULL REFERENCES clone_awards_seasons(id),
 account_id uuid NOT NULL REFERENCES member_accounts(id) ON DELETE CASCADE, track_id uuid NOT NULL REFERENCES clone_awards_tracks(id),
 submission_id uuid REFERENCES clone_awards_submissions(id), source_key text NOT NULL,
 entry_type text NOT NULL CHECK (entry_type IN ('award','reversal','adjustment')), xp integer NOT NULL CHECK (xp <> 0),
 reason text NOT NULL DEFAULT '', actor text NOT NULL, created_at timestamptz NOT NULL DEFAULT now(),
 UNIQUE(season_id, account_id, source_key, entry_type)
);
CREATE INDEX IF NOT EXISTS clone_awards_xp_leaderboard_idx ON clone_awards_xp_ledger(season_id, track_id, account_id);

CREATE TABLE IF NOT EXISTS clone_awards_achievements (
 id uuid PRIMARY KEY DEFAULT gen_random_uuid(), season_id uuid NOT NULL REFERENCES clone_awards_seasons(id),
 account_id uuid NOT NULL REFERENCES member_accounts(id) ON DELETE CASCADE, achievement_key text NOT NULL,
 title text NOT NULL, details jsonb NOT NULL DEFAULT '{}'::jsonb, awarded_at timestamptz NOT NULL DEFAULT now(),
 UNIQUE(season_id, account_id, achievement_key)
);
CREATE TABLE IF NOT EXISTS clone_awards_audit_log (
 id uuid PRIMARY KEY DEFAULT gen_random_uuid(), season_id uuid REFERENCES clone_awards_seasons(id),
 account_id uuid REFERENCES member_accounts(id) ON DELETE SET NULL, actor text NOT NULL, action text NOT NULL,
 entity_type text NOT NULL, entity_id uuid, details jsonb NOT NULL DEFAULT '{}'::jsonb, created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS clone_awards_audit_season_idx ON clone_awards_audit_log(season_id, created_at DESC);

INSERT INTO clone_awards_tracks(slug,name,description,icon_key,sort_order) VALUES
 ('negocio-dark','Negócio Dark','Pesquisa, estruturação e validação de uma oferta própria com materiais autorizados.','target',1),
 ('revenda-streaming','Revenda de Streaming','Estruture uma operação usando somente serviços e ofertas autorizados para revenda.','monitor-play',2),
 ('venda-sites-ecommerce','Venda de sites de e-commerce','Prospecção, proposta e entrega de sites de e-commerce para clientes.','store',3),
 ('criar-ecommerce','Criar um e-commerce','Planeje, construa e lance sua própria loja virtual.','shopping-bag',4),
 ('sites-com-ia','Venda de sites criados com IA','Use ferramentas de IA para produzir e vender sites com entrega profissional.','sparkles',5)
ON CONFLICT(slug) DO NOTHING;
