SELECT
    apply_numbers.account_id AS 'アカウントID',
    apply_numbers.delivering_apply_no AS '交付申請番号',
    apply_numbers.phase_id AS 'フェーズID',
    MAX(CASE WHEN apply_items.param_name = 'transferDestinationAccountInformationName' THEN apply_data.value END) AS '振込先口座名',
    MAX(CASE WHEN apply_items.param_name = 'transferDestinationAccountInformationCode' THEN apply_data.value END) AS '振込先金融機関コード',
    MAX(CASE WHEN apply_items.param_name = 'transferDestinationAccountInformationBranchCode' THEN apply_data.value END) AS '振込先支店コード',
    MAX(CASE WHEN apply_items.param_name = 'transferDestinationAccountInformationType' THEN apply_data.value END) AS '振込先口座種別',
    MAX(CASE WHEN apply_items.param_name = 'transferDestinationAccountInformationMeigi' THEN apply_data.value END) AS '振込先口座名義',
    MAX(CASE WHEN apply_items.param_name = 'transferDestinationAccountInformationInstitutionName' THEN apply_data.value END) AS '振込先金融機関名',
    MAX(CASE WHEN apply_items.param_name = 'transferDestinationAccountInformationBranchName' THEN apply_data.value END) AS '振込先支店名',
    MAX(CASE WHEN apply_items.param_name = 'transferDestinationAccountInformationNumber' THEN apply_data.value END) AS '振込先口座番号'
FROM apply_numbers
INNER JOIN apply_accounts ON apply_accounts.id = apply_numbers.account_id
LEFT JOIN apply_data ON apply_numbers.id = apply_data.apply_number_id
INNER JOIN apply_items ON apply_data.item_id = apply_items.id
WHERE apply_items.param_name IN (
    'transferDestinationAccountInformationName',
    'transferDestinationAccountInformationCode',
    'transferDestinationAccountInformationBranchCode',
    'transferDestinationAccountInformationType',
    'transferDestinationAccountInformationMeigi',
    'transferDestinationAccountInformationInstitutionName',
    'transferDestinationAccountInformationBranchName',
    'transferDestinationAccountInformationNumber'
)
# AND apply_numbers.delivering_apply_no = 'K000000003'
GROUP BY
    apply_numbers.account_id,
    apply_numbers.delivering_apply_no,
    apply_numbers.phase_id,
    apply_accounts.unification_account_id
LIMIT 10;









