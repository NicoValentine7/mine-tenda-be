-- 目的: 申請時の口座情報と完了報告の口座情報が違うかどうかの確認

WITH bank_info AS (
    SELECT
        an.delivering_apply_no,
        ai.param_name,
        p.phase,
        MAX(ad.value) AS value
    FROM apply_numbers an
    LEFT JOIN apply_data ad ON an.id = ad.apply_number_id
    LEFT JOIN phases p ON an.phase_id = p.id
    INNER JOIN apply_items ai ON ad.item_id = ai.id
    WHERE ai.param_name IN (
        'transferDestinationAccountInformationName',
        'transferDestinationAccountInformationCode',
        'transferDestinationAccountInformationBranchCode',
        'transferDestinationAccountInformationType',
        'transferDestinationAccountInformationMeigi',
        'transferDestinationAccountInformationInstitutionName',
        'transferDestinationAccountInformationBranchName',
        'transferDestinationAccountInformationNumber',
        'fixTransferDestinationAccountInformationName',
        'fixTransferDestinationAccountInformationCode',
        'fixTransferDestinationAccountInformationBranchCode',
        'fixTransferDestinationAccountInformationType',
        'fixTransferDestinationAccountInformationMeigi',
        'fixTransferDestinationAccountInformationInstitutionName',
        'fixTransferDestinationAccountInformationBranchName',
        'fixTransferDestinationAccountInformationNumber'
    )
    AND an.delivering_apply_no IN('K000000986', 'K000005750')
    GROUP BY an.delivering_apply_no, ai.param_name, p.phase
)
SELECT
    bi1.delivering_apply_no,
    bi1.param_name AS original_param,
    bi1.value AS original_value,
    bi2.param_name AS fix_param,
    bi2.value AS fix_value,
    CASE
        WHEN bi1.value = bi2.value THEN '一致'
        ELSE '不一致'
    END AS comparison_result
FROM bank_info bi1
JOIN bank_info bi2 ON bi1.delivering_apply_no = bi2.delivering_apply_no
    AND bi1.param_name = REPLACE(bi2.param_name, 'fix', '')
    AND bi1.param_name != bi2.param_name
ORDER BY bi1.delivering_apply_no, bi1.param_name;
