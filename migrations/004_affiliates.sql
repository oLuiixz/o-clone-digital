-- O Clone Digital affiliate program (additive migration; does not alter existing orders/members).
CREATE TABLE IF NOT EXISTS affiliates (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  account_id uuid NOT NULL UNIQUE REFERENCES member_accounts(id) ON DELETE CASCADE,
  code text NOT NULL UNIQUE,
  status text NOT NULL DEFAULT 'pending' CHECK (status IN ('pending','approved','blocked')),
  commission_percent numeric(5,2) NOT NULL DEFAULT 40 CHECK (commission_percent >= 0 AND commission_percent <= 100),
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE IF NOT EXISTS affiliate_clicks (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  affiliate_id uuid NOT NULL REFERENCES affiliates(id) ON DELETE CASCADE,
  clicked_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS affiliate_clicks_affiliate_time_idx ON affiliate_clicks(affiliate_id, clicked_at DESC);
CREATE TABLE IF NOT EXISTS affiliate_commissions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  affiliate_id uuid NOT NULL REFERENCES affiliates(id),
  order_id uuid NOT NULL UNIQUE REFERENCES orders(id),
  order_amount_cents integer NOT NULL CHECK (order_amount_cents >= 0),
  commission_cents integer NOT NULL CHECK (commission_cents >= 0),
  status text NOT NULL DEFAULT 'pending' CHECK (status IN ('pending','approved','reversed','paid')),
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS affiliate_commissions_affiliate_status_idx ON affiliate_commissions(affiliate_id, status);
