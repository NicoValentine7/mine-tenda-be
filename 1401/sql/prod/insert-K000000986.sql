BEGIN;

SET @delivering_apply_no = 'K000000986';

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
    SELECT '01J6VDTEDEJEY82A7G33R5N6E8' AS id, '082' AS value, 'transferDestinationAccountInformationBranchCode' AS param_name
    UNION ALL SELECT '01J6VDV4RENVNXA5VE35J4VY2F', '高石南', 'transferDestinationAccountInformationBranchName'
    UNION ALL SELECT '01J6VDV4REX1RCWYZ90MQ1VE1N', '1630', 'transferDestinationAccountInformationCode'
    UNION ALL SELECT '01J6VDV4REF07BK8YQ8CTRSNDQ', '大阪信用金庫', 'transferDestinationAccountInformationInstitutionName'
    UNION ALL SELECT '01J6VDV4REDT6W4Z63WRWQX1GM', 'ｻｸﾗﾎ-ﾑ(ｶ', 'transferDestinationAccountInformationMeigi'
    UNION ALL SELECT '01J6VDV4REM2YW43KJKXP0Z3Q8', '登録口座001', 'transferDestinationAccountInformationName'
    UNION ALL SELECT '01J6VDV4RE4DGNCB5AQ3SJ1JWH', '0166707', 'transferDestinationAccountInformationNumber'
    UNION ALL SELECT '01J6VDV4RETGH0P0G35E2FZD7V', '1', 'transferDestinationAccountInformationType'
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
