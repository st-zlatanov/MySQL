INSERT INTO cards (card_number, card_status, bank_account_id)
(
SELECT REVERSE(full_name), 'Active', id
FROM clients
WHERE id >= 191 AND id <=200
);