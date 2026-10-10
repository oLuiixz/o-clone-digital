-- O Clone Digital — base schema for paid access and webhook processing.
-- Review and apply through the chosen database workflow before enabling production sales.
-- This migration does not configure authentication or connect a payment provider by itself.

CREATE TABLE IF NOT EXISTS products (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug text NOT NULL UNIQUE,
  name text NOT NULL,
  -- Provider-side product ID used to map verified webhook events to this product.
  provider_product_id text,
  description text,
  price_amount integer NOT NULL CHECK (price_amount >= 0),
  currency char(3) NOT NULL DEFAULT 'BRL',
  is_active boolean NOT NULL DEFAULT false,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE UNIQUE INDEX IF NOT EXISTS products_provider_product_id_idx
  ON products (provider_product_id) WHERE provider_product_id IS NOT NULL;

CREATE TABLE IF NOT EXISTS orders (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id uuid NOT NULL REFERENCES products(id),
  customer_email text NOT NULL,
  provider text NOT NULL,
  provider_checkout_id text,
  provider_payment_id text,
  status text NOT NULL DEFAULT 'pending'
    CHECK (status IN ('pending', 'approved', 'refunded', 'chargeback', 'cancelled', 'failed', 'expired')),
  amount integer NOT NULL CHECK (amount >= 0),
  currency char(3) NOT NULL DEFAULT 'BRL',
  approved_at timestamptz,
  refunded_at timestamptz,
  metadata jsonb NOT NULL DEFAULT '{}'::jsonb,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (provider, provider_payment_id)
);

CREATE INDEX IF NOT EXISTS orders_customer_email_idx ON orders (lower(customer_email));
CREATE INDEX IF NOT EXISTS orders_product_status_idx ON orders (product_id, status);

-- Store provider event IDs to make webhook processing idempotent.
CREATE TABLE IF NOT EXISTS payment_events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  provider text NOT NULL,
  provider_event_id text NOT NULL,
  event_type text NOT NULL,
  order_id uuid REFERENCES orders(id),
  processing_status text NOT NULL DEFAULT 'received'
    CHECK (processing_status IN ('received', 'processing', 'processed', 'ignored', 'failed')),
  received_at timestamptz NOT NULL DEFAULT now(),
  processed_at timestamptz,
  error_code text,
  UNIQUE (provider, provider_event_id)
);

CREATE INDEX IF NOT EXISTS payment_events_order_idx ON payment_events (order_id, received_at DESC);

-- Entitlements are application access grants, separate from the payment record.
CREATE TABLE IF NOT EXISTS entitlements (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id uuid NOT NULL REFERENCES orders(id),
  product_id uuid NOT NULL REFERENCES products(id),
  customer_email text NOT NULL,
  status text NOT NULL DEFAULT 'active'
    CHECK (status IN ('active', 'suspended', 'revoked')),
  granted_at timestamptz NOT NULL DEFAULT now(),
  revoked_at timestamptz,
  revocation_reason text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (order_id)
);

CREATE INDEX IF NOT EXISTS entitlements_email_status_idx ON entitlements (lower(customer_email), status);
CREATE INDEX IF NOT EXISTS entitlements_product_status_idx ON entitlements (product_id, status);

-- Operational safeguards:
-- 1. Never trust browser redirects as proof of payment.
-- 2. Verify each provider's webhook authenticity before processing.
-- 3. Insert payment_events with ON CONFLICT DO NOTHING and process only new event IDs.
-- 4. Grant access only after server-side confirmation of an approved payment.
-- 5. Handle refunds/chargebacks by updating orders and revoking the entitlement.
-- 6. Keep provider secrets in server-side environment variables, never in client code.
-- 7. Restrict database credentials and establish privacy/retention policies before production.
