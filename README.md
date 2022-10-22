# テーブル設計

## users テーブル（ユーザー管理）（deviseを使う）

| Column                                     | Type       | Options                        |
| ------------------------------------------ | ---------- | ------------------------------ |
| nick_name                                  | string     | null: false                    |
| email                                      | string     | unique: true ,default: ""      |
| encrypted_password                         | string     | null: false ,default: ""       |
| birth_day                                  | date       | null: false                    |
| first_name_chinese_characters              | string     | null: false                    |
| last_name_chinese_characters               | string     | null: false                    |
| first_name_katakana                        | string     | null: false                    |
| last_name_katakana                         | string     | null: false                    |
### Association
- has_many : items                                
- belongs_to : addresses


## addresses テーブル（発送先情報）

| Column                                     | Type       | Options                        |
| ------------------------------------------ | ---------- | ------------------------------ |
| buyer                                      | references | null: false, foreign_key: true |
| post_code                                  | string     | null: false                    |
| prefectures                                | string     | null: false                    |
| municipalities                             | string     | null: false                    |
| address                                    | string     | null: false                    |
| building_name                              | string     | null: true                     |
| phone_number                               | string     | null: false                    |
###  Association
- has_many : items ,through: :orders
- has_many : orders


## orders テーブル（購入履歴）

| Column                                     | Type       | Options                        |
| ------------------------------------------ | ---------- | ------------------------------ |
| buyer                                      | references | null: false, foreign_key: true |
| seller                                     | references | null: false, foreign_key: true |
###  Association
- belongs_to : addresses
- belongs_to : items


## items テーブル（出品情報）

| Column                                     | Type       | Options                        |
| ------------------------------------------ | ---------- | ------------------------------ |
| seller                                     | references | null: false, foreign_key: true |
| product_name                               | text       | null: false                    |
| product_description                        | text       | null: false                    |
| category_id                                | integer    | null: false                    |
| condition                                  | text       | null: false                    |
| delivery_charge                            | string     | null: false                    |
| region_of_origin                           | string     | null: false                    |
| days_to_ship                               | string     | null: false                    |
| price                                      | integer    | null: false                    |
### Association
- has_many : addresses ,through: :orders
- has_many : orders
