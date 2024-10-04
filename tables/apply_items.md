# apply_items

| Field              | Type         | Null | Key | Default | Extra |
| ------------------ | ------------ | ---- | --- | ------- | ----- |
| id                 | char(26)     | NO   | PRI | null    |       |
| parent_id          | char(26)     | YES  | MUL | null    |       |
| input_type         | varchar(255) | NO   |     | null    |       |
| param_name         | char(255)    | NO   | MUL | null    |       |
| require            | tinyint(1)   | NO   |     | 0       |       |
| read_only          | tinyint(1)   | NO   |     | 0       |       |
| inherit_editable   | tinyint(1)   | NO   |     | 0       |       |
| iterate_type       | tinyint(1)   | NO   |     | 0       |       |
| max_iterate        | varchar(255) | NO   |     | 1       |       |
| min_length         | varchar(255) | NO   |     | 0       |       |
| max_length         | varchar(255) | NO   |     | 0       |       |
| search_item_id     | char(26)     | YES  | MUL | null    |       |
| deleted_at         | timestamp    | YES  |     | null    |       |
| created_account_id | varchar(255) | NO   |     | null    |       |
| created_at         | timestamp    | NO   |     | null    |       |
| updated_account_id | varchar(255) | NO   |     | null    |       |
| updated_at         | timestamp    | NO   |     | null    |       |
