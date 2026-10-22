-- Attribution records are separate from existing members and orders.
-- The email is used only to match the buyer to the checkout webhook for 30 days.
CREATE TABLE IF NOT EXISTS affiliate_attributions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  affiliate_id uuid NOT NULL REFERENCES affiliates(id) ON DELETE CASCADE,
  customer_email text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  expires_at timestamptz NOT NULL DEFAULT (now() + interval '30 days'),
  converted_order_id uuid UNIQUE REFERENCES orders(id),
  CONSTRAINT affiliate_attributions_email_not_blank CHECK (length(trim(customer_email)) > 3)
);
CREATE INDEX IF NOT EXISTS affiliate_attributions_email_expiry_idx
  ON affiliate_attributions (lower(customer_email), expires_at DESC)
  WHERE converted_order_id IS NULL;
