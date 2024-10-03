BEGIN;

SET @delivering_apply_no = 'K000013657';

INSERT INTO apply_data (
    id,
    apply_number_id,
    item_id,
    category_index,
    parent_index,
    value,
    deleted_at,
    created_account_id,
    created_at,
    updated_account_id,
    updated_at
)
SELECT
    v.id,
    ab.apply_number_id,
    ai.id AS item_id,
    0 AS category_index,
    0 AS parent_index,
    v.value,
    NULL AS deleted_at,
    ab.created_account_id,
    NOW() AS created_at,
    ab.updated_account_id,
    NOW() AS updated_at
FROM (
    SELECT DISTINCT ad.apply_number_id, ad.created_account_id, ad.updated_account_id
    FROM apply_data AS ad
    LEFT JOIN apply_numbers AS an ON ad.apply_number_id = an.id
    WHERE an.delivering_apply_no = @delivering_apply_no COLLATE utf8mb4_unicode_ci
    LIMIT 1
) AS ab
CROSS JOIN (
    SELECT '01J6VE88MPQ9HN19JW27M24V8D' AS id, '804' AS value, 'transferDestinationAccountInformationBranchCode' AS param_name
    UNION ALL SELECT '01J6VE88MP9JZW293BZRPP5EA8', 'きよなみ支店', 'transferDestinationAccountInformationBranchName'
    UNION ALL SELECT '01J6VE88MPFCT2KYA4XWWKG7NJ', '0005', 'transferDestinationAccountInformationCode'
    UNION ALL SELECT '01J6VE88MPEYSQBT7ZJ6CAV736', '三菱UFJ銀行', 'transferDestinationAccountInformationInstitutionName'
    UNION ALL SELECT '01J6VE88MP2TNCPW15KSHSEQNV', 'ｶ)ﾄ-ｴﾈﾂｸ', 'transferDestinationAccountInformationMeigi'
    UNION ALL SELECT '01J6VE88MPDMXM14GZJ64ENFP7', '登録口座　長野支店', 'transferDestinationAccountInformationName'
    UNION ALL SELECT '01J6VE88MPDR4EX7MXJQ7R9FGA', '1116997', 'transferDestinationAccountInformationNumber'
    UNION ALL SELECT '01J6VE88MPZD7ME2QPGHPD73YS', '2', 'transferDestinationAccountInformationType'
) AS v
JOIN apply_items AS ai ON v.param_name = ai.param_name COLLATE utf8mb4_unicode_ci
WHERE ai.param_name IN (
    'transferDestinationAccountInformationBranchCode',
    'transferDestinationAccountInformationBranchName',
    'transferDestinationAccountInformationCode',
    'transferDestinationAccountInformationInstitutionName',
    'transferDestinationAccountInformationMeigi',
    'transferDestinationAccountInformationName',
    'transferDestinationAccountInformationNumber',
    'transferDestinationAccountInformationType'
);

-- COMMIT;
-- ROLLBACK;
