
DELIMITER $$
CREATE FUNCTION udf_client_cards_count (name_param VARChaR(30))
returns integer
DETERMINISTIC
begin
return (select count(c.id) from cards as c
LEFT JOIN bank_accounts as ba
ON ba.id = c.bank_account_id
LEFT JOIN clients as cl
ON cl.id = ba.client_id
WHERE cl.full_name = name_param);

END $$

DELIMITER $$
CREATE PROCEDURE udp_clientinfo(f_name VARCHAR(30))
BEGIN
select cl.full_name, cl.age, ba.account_number, concat('$', ba.balance) from clients as cl
join bank_accounts as ba
on ba.client_id = cl.id
where cl.full_name = f_name;
END $$