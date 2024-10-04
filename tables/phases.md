# phases

## Strcture

| Field               | Type         | Null  | Key   | Default | Extra |
| :------------------ | :----------- | :---- | :---- | :------ | :---- |
| id                  | char(26)     | NO    | PRI   | (null)  |       |
| category_id         | char(26)     | NO    | MUL   | (null)  |       |
| phase               | char(255)    | NO    |       | (null)  |       |
| sort_number         | varchar(255) | NO    |       | (null)  |       |
| limited_release_flg | tinyint(1)   | NO    |       | 0       |       |
| deleted_at          | timestamp    | YES   |       | (null)  |       |
| created_account_id  | varchar(255) | NO    |       | (null)  |       |
| created_at          | timestamp    | NO    |       | (null)  |       |
| updated_account_id  | varchar(255) | NO    |       | (null)  |       |
| updated_at          | timestamp    | NO    |       | (null)  |       |

## Result
| Id                         | Category id                | Phase | Sort number | Limited release flg | Deleted at | Created account id | Created at               | Updated account id | Updated at               |
| :------------------------- | :------------------------- | :---- | :---------- | :------------------ | :--------- | :----------------- | :----------------------- | :----------------- | :----------------------- |
| 01HSZZT18DBV52E520QDW98Z8E | 01HSZZT15PDG4JM28B3Y3NN3SK | 予約申請  | 100         | 0                   | (null)     | system             | 2024-03-27T12:57:52.000Z | system             | 2024-03-27T12:57:52.000Z |
| 01HSZZT18P6F7933XKYH046CG1 | 01HSZZT15PDG4JM28B3Y3NN3SK | 交付申請  | 200         | 0                   | (null)     | system             | 2024-03-27T12:57:52.000Z | system             | 2024-03-27T12:57:52.000Z |
| 01HSZZT191WJ7QMKJ4VK4B3X1V | 01HSZZT16B6G8VW4G8DPFT1TTR | 予約申請  | 400         | 0                   | (null)     | system             | 2024-03-27T12:57:52.000Z | system             | 2024-03-27T12:57:52.000Z |
| 01HSZZT19APAP5SPMVXDGC358K | 01HSZZT16B6G8VW4G8DPFT1TTR | 交付申請  | 500         | 0                   | (null)     | system             | 2024-03-27T12:57:52.000Z | system             | 2024-03-27T12:57:52.000Z |
| 01HSZZT19KD6J1RK55B33Y9NZY | 01HSZZT16PB8HPTRS4HY093WV3 | 予約申請  | 700         | 0                   | (null)     | system             | 2024-03-27T12:57:52.000Z | system             | 2024-03-27T12:57:52.000Z |
| 01HSZZT19WPJ3G5R7H3VWG7SWW | 01HSZZT16PB8HPTRS4HY093WV3 | 交付申請  | 800         | 0                   | (null)     | system             | 2024-03-27T12:57:52.000Z | system             | 2024-03-27T12:57:52.000Z |
| 01J0SJ0NX1TXCMPJZHKCHCJT5Z | 01J0SJ0NRY2SSBD73RHDBYAHC6 | 予約申請  | 900         | 0                   | (null)     | system             | 2024-06-20T00:51:16.000Z | system             | 2024-06-20T00:51:16.000Z |
| 01J0SJ0NYCX66FCNASHAW194B6 | 01J0SJ0NRY2SSBD73RHDBYAHC6 | 交付申請  | 1000        | 0                   | (null)     | system             | 2024-06-20T00:51:16.000Z | system             | 2024-06-20T00:51:16.000Z |
| 01J2BJNG0C2DJKXHQ35MCKP8ZS | 01HSZZT16B6G8VW4G8DPFT1TTR | 完了報告  | 600         | 0                   | (null)     | system             | 2024-07-09T11:04:39.000Z | system             | 2024-07-09T11:04:39.000Z |
