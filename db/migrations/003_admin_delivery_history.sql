CREATE TABLE IF NOT EXISTS admin_delivery_events (
 id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
 order_id uuid NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
 customer_email text NOT NULL,
 channel text NOT NULL CHECK (channel IN ('email','manual')),
 action text NOT NULL CHECK (action IN ('activation_link_generated','send_attempt','email_accepted','email_failed','manual_delivered')),
 status text NOT NULL CHECK (status IN ('pending','sent','delivered','failed','generated')),
 details text, provider_message_id text, created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS admin_delivery_events_order_idx ON admin_delivery_events(order_id,created_at DESC);
CREATE INDEX IF NOT EXISTS admin_delivery_events_email_idx ON admin_delivery_events(lower(customer_email),created_at DESC);