# テーブル設計

## users テーブル（ユーザー情報）（deviseを使う）

| Column                                     | Type       | Options                                |
| ------------------------------------------ | ---------- | -------------------------------------- |
| nick_name                                  | string     | null: false                            |
| email                                      | string     | null: false ,unique: true ,default: "" |
| encrypted_password                         | string     | null: false ,default: ""               |
| birth_day                                  | date       | null: false                            |
| first_name                                 | string     | null: false                            |
| last_name                                  | string     | null: false                            |
| read_first                                 | string     | null: false                            |
| read_last                                  | string     | null: false                            |
### Association
- has_many : items     
- has_many : orders                         



## addresses テーブル（受け取り先情報）

| Column                                     | Type       | Options                                |
| ------------------------------------------ | ---------- | -------------------------------------- |
| post_code                                  | string     | null: false                            |
| prefecture_id                              | integer    | null: false                            |
| municipalities                             | string     | null: false                            |
| address                                    | string     | null: false                            |
| building_name                              | string     | null: false                            |
| phone_number                               | string     | null: false                            |
###  Association
- belongs_to : order


## orders テーブル（購入履歴）

| Column                                     | Type       | Options                                |
| ------------------------------------------ | ---------- | -------------------------------------- |
| user                                       | references | null: false, foreign_key: true         |
| item                                       | references | null: false, foreign_key: true         |
###  Association
- belongs_to : user
- belongs_to : item
- has_one : order


## items テーブル（出品情報）

| Column                                     | Type       | Options                                |
| ------------------------------------------ | ---------- | -------------------------------------- |
| user                                       | references | null: false, foreign_key: true         |
| product_name                               | string     | null: false, foreign_key: true         |
| product_description                        | text       | null: false                            |
| category_id                                | integer    | null: false                            |
| condition_id                               | integer    | null: false                            |
| contribution_id                            | integer    | null: false                            |
| prefecture_id                              | integer    | null: false                            |
| day_id                                     | integer    | null: false                            |
| price                                      | integer    | null: false                            |
### Association
- has_one : order
- belongs_to : user
