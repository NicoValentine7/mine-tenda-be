-- 目的: 申請時の口座情報と完了報告の口座情報が違うかどうかの確認

-- 完了報告のapply_numbers.phase_idは'01J2BJNG0C2DJKXHQ35MCKP8ZS'？(STGでの確認)
-- fix~apply_dataは完了報告のデータ
--

-- 交付申請と、完了報告の銀行関連データを取得
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
    'transferDestinationAccountInformationNumber'
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
an.delivering_apply_no IN(
    'K000000986',
    'K000005750'
)
GROUP BY an.delivering_apply_no, ai.param_name
ORDER BY an.delivering_apply_no DESC;
