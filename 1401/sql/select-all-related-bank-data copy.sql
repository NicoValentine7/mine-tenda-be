SELECT
-- 	apply_data.id,
--     apply_numbers.account_id 'アカウントID',
    apply_numbers.delivering_apply_no as '交付申請番号' ,
--      apply_accounts.unification_account_id as '統括アカウントID',
     apply_data.value as '値',
     apply_items.param_name,
     apply_data.created_at,
     apply_data.updated_at
FROM apply_numbers
INNER JOIN apply_accounts ON apply_accounts.id = apply_numbers.account_id
LEFT JOIN apply_data ON apply_numbers.id = apply_data.apply_number_id
INNER JOIN apply_items ON apply_data.item_id = apply_items.id
WHERE
--  apply_numbers.delivering_apply_no IN(
--     'K000000986',
--     'K000005750',
--     'K000013657'
--     'K000003894',
--     'K000008678',
--     'K000004301'
-- )
-- AND
 apply_items.param_name IN(
--     'transferDestinationAccountInformationName',
--     'transferDestinationAccountInformationCode',
--     'transferDestinationAccountInformationBranchCode',
--     'transferDestinationAccountInformationType',
--     'transferDestinationAccountInformationMeigi',
--     'transferDestinationAccountInformationInstitutionName',
--     'transferDestinationAccountInformationBranchName',
--     'transferDestinationAccountInformationNumber',
    'fixTransferDestinationAccountInformationBranchCode'
)
ORDER BY apply_numbers.delivering_apply_no DESC;









