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
    SELECT '01J6VEDBDD0EWZDFJR3A4FZJC3' AS id, '695' AS value, 'transferDestinationAccountInformationBranchCode' AS param_name
    UNION ALL SELECT '01J6VEDBDDPV4RZFQQPHBD66F5', '日本橋支店' AS value, 'transferDestinationAccountInformationBranchName'
    UNION ALL SELECT '01J6VEDBDDFXCQP9WF4P79FPPG', '0009' AS value, 'transferDestinationAccountInformationCode'
    UNION ALL SELECT '01J6VEDBDDDSQ85A6PTSDK1HAA', '三井住友銀行' AS value, 'transferDestinationAccountInformationInstitutionName'
    UNION ALL SELECT '01J6VEDBDDJQABY1ADHZ1XMKXH', 'ﾀﾏﾎ-ﾑ(ｶ' AS value, 'transferDestinationAccountInformationMeigi'
    UNION ALL SELECT '01J6VEDBDDNYBKJWTV5SVDGFXC', '登録口座001' AS value, 'transferDestinationAccountInformationName'
    UNION ALL SELECT '01J6VEDBDDT035RZ9TRMVR8PZ5', '7784327' AS value, 'transferDestinationAccountInformationNumber'
    UNION ALL SELECT '01J6VEDBDDE280XTQWNH4KAJKK', '1' AS value, 'transferDestinationAccountInformationType'
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
