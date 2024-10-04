-- 交付申請と、完了報告の銀行関連データを取得
SELECT
    an.delivering_apply_no,
    an.phase_id,
    ai.param_name,
    MAX(ad.value) AS value
FROM apply_numbers an
INNER JOIN apply_accounts aa ON aa.id = an.account_id
LEFT JOIN apply_data ad ON an.id = ad.apply_number_id
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
AND
an.delivering_apply_no = 'K000281068'
GROUP BY an.delivering_apply_no, an.phase_id
ORDER BY an.delivering_apply_no DESC;

-- 全てのan.delivering_apply_noを取得
SELECT SUM(an.delivering_apply_no), an.delivering_apply_no FROM apply_numbers an;

-- fix~prefixがついたapply_dataのphase_idが全て同一であるかを確認する
-- Result: 全ての完了報告(fix~のprefixのapply_data)のphase_idは同一である
SELECT
    an.delivering_apply_no,
    ai.param_name,
    ad.value,
    MIN(an.phase_id) AS min_phase_id,
    MAX(an.phase_id) AS max_phase_id,
    CASE
        WHEN COUNT(DISTINCT an.phase_id) - 1 = 0 THEN '同一'
        ELSE '異なる'
    END AS phase_id_status,
    COUNT(DISTINCT an.phase_id) - 1 AS '異なる phase_id の数'
FROM
    apply_numbers an
INNER JOIN
    apply_data ad ON an.id = ad.apply_number_id
INNER JOIN
    apply_items ai ON ad.item_id = ai.id
WHERE
    ai.param_name LIKE 'fixTransferDestinationAccountInformation%'
GROUP BY
    an.delivering_apply_no
ORDER BY
    an.delivering_apply_no;
