# apply_data

| Field              | Type          | Null | Key | Default | Extra |
| ------------------ | ------------- | ---- | --- | ------- | ----- |
| id                 | char(26)      | NO   | PRI | null    |       |
| apply_number_id    | char(26)      | NO   | MUL | null    |       |
| item_id            | char(26)      | NO   | MUL | null    |       |
| category_index     | varchar(255)  | NO   |     | 0       |       |
| parent_index       | varchar(255)  | NO   |     | 0       |       |
| value              | varchar(2000) | NO   |     | null    |       |
| deleted_at         | timestamp     | YES  |     | null    |       |
| created_account_id | varchar(255)  | NO   |     | null    |       |
| created_at         | timestamp     | NO   |     | null    |       |
| updated_account_id | varchar(255)  | NO   |     | null    |       |
| updated_at         | timestamp     | NO   |     | null    |       |
