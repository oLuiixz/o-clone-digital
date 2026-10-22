-- Store affiliate SyncPay receiving identifier. Split remains disabled until provider recipient contract is verified.
ALTER TABLE affiliates ADD COLUMN IF NOT EXISTS syncpay_recipient_id text;
CREATE INDEX IF NOT EXISTS affiliates_syncpay_recipient_idx ON affiliates(syncpay_recipient_id) WHERE syncpay_recipient_id IS NOT NULL;
