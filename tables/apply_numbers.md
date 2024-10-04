# apply_numbers

| Field                                           | Type         | Null | Key | Default | Extra |
| ----------------------------------------------- | ------------ | ---- | --- | ------- | ----- |
| id                                              | char(26)     | NO   | PRI | null    |       |
| account_id                                      | char(26)     | NO   | MUL | null    |       |
| status_id                                       | char(26)     | NO   |     | null    |       |
| phase_id                                        | char(26)     | NO   | MUL | null    |       |
| apply_no                                        | varchar(255) | NO   |     | null    |       |
| delivering_apply_no                             | varchar(255) | YES  |     | null    |       |
| duplicate_serial_number                         | char(4)      | NO   |     | 0000    |       |
| lock_flg                                        | tinyint(1)   | NO   |     | 0       |       |
| apply_limit                                     | timestamp    | YES  |     | null    |       |
| status_changed_number                           | char(2)      | YES  |     | null    |       |
| status_changed_date                             | timestamp    | YES  |     | null    |       |
| reservation_submitted_date                      | timestamp    | YES  |     | null    |       |
| reservation_limit                               | timestamp    | YES  |     | null    |       |
| approve_reservation_amount                      | int          | YES  |     | null    |       |
| approve_reservation_day                         | timestamp    | YES  |     | null    |       |
| apply_submitted_date                            | timestamp    | YES  |     | null    |       |
| delivering_decided_date                         | timestamp    | YES  |     | null    |       |
| decided_amount                                  | int          | YES  |     | null    |       |
| delivering_determined_date                      | timestamp    | YES  |     | null    |       |
| determined_amount                               | int          | NO   |     | 0       |       |
| transfer_of_fundexpected_day                    | timestamp    | YES  |     | null    |       |
| final_report_limit                              | timestamp    | YES  |     | null    |       |
| final_report_submission_date                    | timestamp    | YES  |     | null    |       |
| final_report_approval_date                      | timestamp    | YES  |     | null    |       |
| final_report_deficiency_correction_request_date | timestamp    | YES  |     | null    |       |
| final_report_deficiency_limit_date              | timestamp    | YES  |     | null    |       |
| final_report_inherit_apply_number_id            | char(26)     | YES  |     | null    |       |
| joint_venturer_modified_flg                     | tinyint(1)   | NO   |     | 0       |       |
| withdrawal_deadline                             | timestamp    | YES  |     | null    |       |
| deficiency_request_date                         | timestamp    | YES  |     | null    |       |
| deficiency_limit                                | timestamp    | YES  |     | null    |       |
| app_number                                      | char(10)     | YES  |     | null    |       |
| examination_edit_lock_examination_account_id    | char(26)     | YES  |     | null    |       |
| examination_edit_locked_at                      | timestamp    | YES  |     | null    |       |
| previous_version_id                             | varchar(255) | YES  |     | null    |       |
| next_version_id                                 | varchar(255) | YES  |     | null    |       |
| made_by_batch_flg                               | tinyint(1)   | NO   |     | 0       |       |
| deleted_at                                      | timestamp    | YES  |     | null    |       |
| created_account_id                              | varchar(255) | NO   |     | null    |       |
| created_at                                      | timestamp    | NO   |     | null    |       |
| updated_account_id                              | varchar(255) | NO   |     | null    |       |
| updated_at                                      | timestamp    | NO   |     | null    |       |
